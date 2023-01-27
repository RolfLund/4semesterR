---
title: Rekodning baseret på flere udtryk (case_when)
weight: 6
---
Man kan bruge `case_when()` at rekode baseret på flere logiske udtryk.
For hvert udtryk bruges `~` efterfulgt af en værdi for at angive,
hvilken værdi observationerne, der opfylder betiungelsen, skal have.
Hvert logisk udtryk adskilles med komma:

``` r
nyvar = case_when(
    betingelse1 ~ 'kategori 1',
    betingelse2 ~ 'kategori 2',
    betingelse3 ~ 'kategori 3'
    )
```

Herunder dannes en kategorisering af selvangivet arbejdstid om ugen
(`wkhtot`), hvor respondenter inddeles efter, hvorvidt de arbejder
mindre end 37 timer, 37 timer eller mere end 37 timer om ugen:

``` r
ess18n <- ess18 |>
    mutate(
      wkhtot_cat = case_when(
        wkhtot == 37 ~ '37 timer om ugen',
        wkhtot < 37 ~ 'Mindre end 37 timer',
        wkhtot > 37 ~ 'Mere end 37 timer'
        )
      ) |>
    select(idno, wkhtot, wkhtot_cat)

head(ess18n)
```

    # A tibble: 6 × 3
       idno wkhtot wkhtot_cat         
      <dbl>  <dbl> <chr>              
    1  5816     37 37 timer om ugen   
    2  7251     34 Mindre end 37 timer
    3  7887     39 Mere end 37 timer  
    4  9607     34 Mindre end 37 timer
    5 11688     37 37 timer om ugen   
    6 12355     37 37 timer om ugen   

`case_when()` forventer, at alle rækker er indfanget af betingelserne.
Rækker, som ikke er indfanget af betingelser, bliver derfor kodet til
missing.

Hvis man gerne vil undgå dette, kan man kode resterende værdier med brug
af `TRUE ~` (herunder beholdes de værdier, som ikke indfanges af
betingelserne):

``` r
ess18n <- ess18 |>
    mutate(
      wkhtot_cat = case_when(
        wkhtot == 37 ~ '37 timer om ugen',
        wkhtot < 37 ~ 'Mindre end 37 timer',
        wkhtot > 37 ~ 'Mere end 37 timer',
        TRUE ~ as.character(wkhtot)
        )
      ) |>
    select(idno, wkhtot, wkhtot_cat)

head(ess18n)
```

    # A tibble: 6 × 3
       idno wkhtot wkhtot_cat         
      <dbl>  <dbl> <chr>              
    1  5816     37 37 timer om ugen   
    2  7251     34 Mindre end 37 timer
    3  7887     39 Mere end 37 timer  
    4  9607     34 Mindre end 37 timer
    5 11688     37 37 timer om ugen   
    6 12355     37 37 timer om ugen   

### Evaluering af betingelser i `case_when()`

`case_when()` evaluerer de enkelte udtryk i rækkefølge. Derudover bliver
rækker i data også *kun* evalueret én gang. Dette vil sige, at hvis man
i `case_when()` har angivet betingelser, som ikke er gensidigt
udelukkende (altså at rækker har flere betingelser, som er sande), så er
det den første betingelse, som er gældende.Man kan læse betingelserne i
`case_when()` linje for linje lig: For rækkerne hvor denne betingelse er
sand, giv dem følgende værdi og evaluér ikke disse rækker yderligere.

Fordi funktionen fungerer på denne måde, kan man bruge linjen
`TRUE ~ something` til sidst for at angive, hvad de resterende rækker
skal kodes til. Linjen kan læses som “for de rækker, som er tilbage, giv
dem denne værdi”.

### Kod resterende værdier til missing

Linjen `TRUE ~ something` kan også bruges til at kode værdier til
missing. `case_when()` forventer dog, at alle værdier er af samme type,
så dette kan nogen gange give problemer.

Selvom det ikke er tydeligt, så adskiller R mellem forskellige typer af
missing (missing som talværdi, missing som tekstværdi osv.). Hvis man
blot forsøger at kode resten om til missing med `TRUE ~ NA` gives en
fejl:

``` r
ess18n <- ess18 |>
    mutate(
      wkhtot_cat = case_when(
        wkhtot == 37 ~ '37 timer om ugen',
        wkhtot < 37 ~ 'Mindre end 37 timer',
        wkhtot > 37 ~ 'Mere end 37 timer',
        TRUE ~ NA
        )
      ) |>
    select(idno, wkhtot, wkhtot_cat)
```

    Error in `mutate()`:
    ! Problem while computing `wkhtot_cat = case_when(...)`.
    Caused by error in `names(message) <- `*vtmp*``:
    ! 'names' attribute [1] must be the same length as the vector [0]

Den nemmeste måde at undgå denne fejl, er ved at angive hvilken type
missing, som der er tale om (fx ved brug af casting-funktioner som
`as.numeric()` til tal og `as.character()` til tekst):

``` r
ess18n <- ess18 |>
    mutate(
      wkhtot_cat = case_when(
        wkhtot == 37 ~ '37 timer om ugen',
        wkhtot < 37 ~ 'Mindre end 37 timer',
        wkhtot > 37 ~ 'Mere end 37 timer',
        TRUE ~ as.character(NA)
        )
      ) |>
    select(idno, wkhtot, wkhtot_cat)
```
