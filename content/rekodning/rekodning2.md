---
title: Rekodning baseret på enkelt betingelse (if_else/ifelse)
weight: 5
---
Funktionen `ifelse()` bruges til at rekode værdier baseret på ét logisk
udtryk.

Opbygningen er:
`ifelse([logisk udtryk], [værdi for sandt], [værdi for falsk])`

``` r
ess18n <- ess18 |> 
    mutate(health_r = factor(health, levels = c('Very bad', 'Bad', 'Fair', 'Good', 'Very good'), ordered = TRUE)) |>
    mutate(healthdum = ifelse(health_r <= 'Fair', 'Not good', 'Good')) |>
    select(idno, health_r, healthdum)

head(ess18n)
```

    # A tibble: 6 × 3
       idno health_r healthdum
      <dbl> <ord>    <chr>    
    1  5816 Good     Good     
    2  7251 Fair     Not good 
    3  7887 Fair     Not good 
    4  9607 Good     Good     
    5 11688 Very bad Not good 
    6 12355 Fair     Not good 

### Rekod flere værdier med `%in%`

`%in%` er et basisudtryk i R, der bruges til at spørge “er denne værdi i
denne samling af værdier”?

Udtrykket kan både bruges til at spørge, om en værdi ligger inden for et
interval eller om en værdi er til stede i en vector:

``` r
243 %in% c(109:321) # Er værdi i interval?
```

    [1] TRUE

``` r
'Skywalker' %in% c('Katarn', 'Kenobi', 'Windu') # Er værdi i vector?
```

    [1] FALSE

Fordi `%in%` altid evaluerer til en logisk værdi (`TRUE`/`FALSE`) kan
denne også bruges som del af betingelse i rekodning (fx i `ifelse()`):

``` r
ess18n <- ess18 |> 
    mutate(healthdum = ifelse(health %in% c('Very bad', 'Bad', 'Fair'), 'Not good', 'Good')) |>
    select(idno, health, healthdum)

head(ess18n)
```

    # A tibble: 6 × 3
       idno health   healthdum
      <dbl> <chr>    <chr>    
    1  5816 Good     Good     
    2  7251 Fair     Not good 
    3  7887 Fair     Not good 
    4  9607 Good     Good     
    5 11688 Very bad Not good 
    6 12355 Fair     Not good 

{{% notice warning %}} BEMÆRK: Ovenstående kodestykke rekoder også
missingværdier til ‘Good’. Dette sker fordi funktionen koder alt, som
ikke er fanget af if-betingelsen, til den værdi, som er angivet i
“else”-delen. {{% /notice %}}

### Behold oprindelige værdier

I visse tilfælde kan man have brug for at bevare værdier, som de er, og
kun rekode nogen af dem. Med `ifelse()` kan man sikrer dette ved at
angive den oprindelige variabel som værdi for hhv. sandt eller falsk
afhængigt af hvilke værdier, der skal bevares.

Nedenstående rekoder tre af værdierne fra `health` til “Not good”, men
bevarer resten, som de er:

``` r
ess18n <- ess18 |> 
    mutate(health_r = ifelse(health %in% c('Very bad', 'Bad', 'Fair'), 'Not good', health)) |>
    select(idno, health, health_r)

head(ess18n)
```

    # A tibble: 6 × 3
       idno health   health_r
      <dbl> <chr>    <chr>   
    1  5816 Good     Good    
    2  7251 Fair     Not good
    3  7887 Fair     Not good
    4  9607 Good     Good    
    5 11688 Very bad Not good
    6 12355 Fair     Not good

Koden kan oversættes til: Hvis værdien i `health` er enten “Very bad”,
“Bad” eller “Fair”, så kod om til “Not good”. Ellers bevar værdien, som
den er.

### `ifelse` eller `if_else`?

`ifelse()` er en basis R funktion, men der findes i `tidyverse` den
tilsvarende funktion `if_else` (fra pakken `dplyr`).

`if_else()` fungerer mere eller mindre på præcis samme måde som
`ifelse()`. Den primære forskel mellem funktionerne er, at `if_else` er
mere streng, og forventer at værdierne for sand og falsk er af samme
type (class).

I eksemplet herunder laves en (ubrugelig) rekodning, hvor alle værdier
over 5 i `ppltrst` (tillid til andre mennesker fra 0-10) gives værdien
“Over 5”, mens alle andre beholder deres oprindelige værdi (dette gøres
ved bare at specificere den oprindelige variabel under værdien for
falsk).

Først med `ifelse()`:

``` r
ess18n <- ess18 |> 
    mutate(ppltrst_n = ifelse(ppltrst > 5, 'Over 5', ppltrst)) |>
    select(idno, ppltrst, ppltrst_n)

head(ess18n)
```

    # A tibble: 6 × 3
       idno ppltrst ppltrst_n
      <dbl>   <dbl> <chr>    
    1  5816       7 Over 5   
    2  7251       5 5        
    3  7887       8 Over 5   
    4  9607       9 Over 5   
    5 11688       5 5        
    6 12355       5 5        

`ifelse()` foretager rekodningen uden problemer, men bemærk at den nye
variabel er ændret fra `dbl` (en numerisk type/class) til `chr`
(“character” - en string).

Forsøges samme med `if_else()`, gives der en fejl:

``` r
ess18n <- ess18 |> 
    mutate(ppltrst_n = if_else(ppltrst > 5, 'Over 5', ppltrst)) |>
    select(idno, ppltrst, ppltrst_n)
```

    Error in `mutate()`:
    ! Problem while computing `ppltrst_n = if_else(ppltrst > 5, "Over 5",
      ppltrst)`.
    Caused by error in `if_else()`:
    ! `false` must be a character vector, not a double vector.
