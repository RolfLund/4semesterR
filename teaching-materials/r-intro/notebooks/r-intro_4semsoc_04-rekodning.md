
# {#Kapitel}Rekodning i R

I denne sektion ser vi nærmere på forskellige funktioner til at rekode i
R.

Vi kan overordnet adskille mellem tre typer af rekodning:

- Simpel rekodning (fx omregning af eksisterende variabel)
- Ændring af kategorier (fx ved at sammenslå flere kategorier til én)
- Omkodning fra numerisk til kategorisk (fx ved at lave variable for
  kategoriseringer af alder, indkomst eller andet)

# {#Afsnit}Hvornår laver man en ny variabel?

Når man laver datahåndtering, bør man altid bestræbe sig efter ikke at
*fjerne* information fra datasættet. Når man laver variabelændringer,
bør man derfor *altid* lave en ny variabel, hvis informationen i den
oprindelige variabel ændres (fx når man rekoder fra numerisk til
kategoriske eller sammenslår kategorier).

Hvis variabelændringer primært går på at rette fejl i variablen, så kan
man typisk fint overskrive den oprindelige variabel. Dette kan fx være
aktuelt, hvis variabel skal ændres fra tekst til numerisk, eller hvis
der skal rettes fejl i kategorinavne.

Er man i tvivl bør man altid lave en ny variabel. På den måde er der
ikke information, som går tabt.

# {#Afsnit}Ændring af variabeltype (class)

Som nævnt tidligere, adskiller R mellem objekter via deres “class”.

Enkelte variable(/vectors) kan *kun* indeholde værdier med samme class.
Funktionen `class()` virker derfor også på variable.

Variablen `tygrtr` (i hvilken alder er man for ung til at gå på pension)
ligner en variabel, der bør indeholde numeriske værdier (en alder). Ser
vi nærmere på variablen, kan vi dog se, at den også indeholder
tekst-værdier:

``` r
head(ess18$tygrtr)
```

    [1] "60" "40" "55" "64" "50" "60"

Undersøger vi variablens class, kan vi se, at variablen er lagret som
tekst (en string).

``` r
class(ess18$tygrtr)
```

    [1] "character"

Dette betyder at vi ikke kan lave beregninger med variablen:

``` r
max(ess18$tygrtr, na.rm = TRUE) # Viser højeste værdi alfabetisk
```

    [1] "Should never retire permanently"

### “Class coercion” - tving variabel til en anden type

I de fleste tilfælde kan R tvinge værdier fra en type/class til en anden
(kaldes også “casting” i programmering generelt). Ved at gøre dette,
bliver inkompatible værdier til missing (`NA`).

Værdier kan tvinges til tekst værdier med `as.character()`

Værdier kan tvinges til numeriske værdier med `as.numeric()`

Herunder dannes en numerisk version af `tygrtr` (bemærk advarslen):

``` r
ess18 <- mutate(ess18, tygrtr_num = as.numeric(tygrtr))
```

    Warning in mask$eval_all_mutate(quo): NAs introduced by coercion

Nu kan variablen bruges i beregninger:

``` r
max(ess18$tygrtr_num, na.rm = TRUE)
```

    [1] 88

# {#Afsnit}Rekodning af kategoriske variable

Vi har tidligere set på hvordan variable kan dannes eller rekodes fra
eksisterende variable med brug af simple omregninger (fx `inwtm / 60`
for at få interviewtid i timer).

Rekodning af kategoriske data må gøres anderledes. Her står man typisk
enten over for at skulle ændre kategorierne, slå kategorier sammen eller
danne kategorier ud fra nogle betingelser (fx hvis man skal lave en
intervalskaleret variabel om til kategorisk).

`tidyverse` (pakken `dplyr`) har en række funktioner til rekodning af
kategoriske værdier. De tre hovedfunktioner er:

- `recode`: Ændrer enkelte kategorier
- `if_else`: Rekodning baseret på ét logisk udtryk
- `case_when`: Rekodning baseret på flere logiske udtryk

Alle disse skal kombineres med `mutate`.

Ved at indlæse `tidyverse` er alle disse rekodningsfunktioner læst ind:

``` r
library(tidyverse)
```

# {#Afsnit}Rekodning af enkelte kategorier (recode)

Funktionen `recode()` tager mindst to input:

- Variabel der skal rekodes
- Værdi der skal ændres (i format \[gammel\] = \[ny\]) Herunder bruges
  `recode()` til at ændre kategorierne for køn til dansk:

``` r
ess18n <- ess18 |>
    mutate(gndr_da = recode(gndr, 'Male' = 'Mand', 'Female' = 'Kvinde')) |>
    select(idno, gndr, gndr_da) # Variable udvælges for nemmere at kunne se forskel

head(ess18n)
```

    # A tibble: 6 × 3
       idno gndr   gndr_da
      <dbl> <chr>  <chr>  
    1  5816 Male   Mand   
    2  7251 Female Kvinde 
    3  7887 Male   Mand   
    4  9607 Female Kvinde 
    5 11688 Female Kvinde 
    6 12355 Male   Mand   

Ved brug af `.default` argumentet, kan man angive en værdi for alle
øvrige værdier (bortset fra missing):

``` r
ess18n <- ess18 |>
    mutate(gndr_da = recode(gndr, 'Male' = 'Mand', .default = 'Ikke mand')) |>
    select(idno, gndr, gndr_da)

head(ess18n)
```

    # A tibble: 6 × 3
       idno gndr   gndr_da  
      <dbl> <chr>  <chr>    
    1  5816 Male   Mand     
    2  7251 Female Ikke mand
    3  7887 Male   Mand     
    4  9607 Female Ikke mand
    5 11688 Female Ikke mand
    6 12355 Male   Mand     

`recode()` er en meget simpel funktion og kan *kun* bruges til at omkode
enkelte værdier. Hvis man skal omkode mange kategorier, bør man derfor
overveje, om variablen kan rekode med betingelser i stedet.

# {#Afsnit}Rekodning baseret på enkelt betingelse (if_else/ifelse)

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

# {#Afsnit}Rekodning baseret på flere udtryk (case_when)

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

# {#Afsnit}Rekod til missing

Der kan være flere grunde til, at man er nødt til at kode værdier til
missing:

1.  Det er ikke givet at missing-værdier er kodet som missing på forhånd
    i et datasæt. Hvordan missing-værdier kodes varierer mellem
    programmer. Derfor bruger man ofte specifikke talværdier (fx 777777
    eller 888888) til at indikere missing-værdier.

2.  Afhængig af analysen kan man have behov for at ignorere visse
    observationer, fx for at undgå at outliers skævvrider resultatet.

Begge situationer involverer *rekodning*, hvor man erstatter de
pågældende værdier med missing (enten manuelt eller ud fra betingelser).

### Simpel rekodning med `na_if`

`tidyverse` (specifikt `dplyr`) indeholder funktionen `na_if()`, der kan
bruges til at kode enkelte værdier til missing.

Funktionen tager to argumenter:

1.  En variabel/vector, der skal rekodes
2.  Hvilke værdier, der skal kodes til missing (angivet som vector, hvis
    flere værdier)

ESS18 datasættet indeholder variablen `vote`, der angiver, hvorvidt
respondenten stemte til sidste folketingsvalg. Hvis ikke respondenten
var gammel nok eller ikke havde stemmeret, kunne de svare “Not eligible
to vote”.

Hvis man i en undersøgelse kun er interesseret i dem, der kunne stemme,
så skal de, der ikke *kunne* stemme behandles som missing. Koden
herunder koder disse besvarelser om til missing:

``` r
ess18n <- ess18 |> 
  mutate(vote = na_if(vote, "Not eligible to vote"))

print(unique(ess18$vote)) # unikke værdier før rekodning
```

    [1] "Yes"                  "No"                   "Not eligible to vote"
    [4] NA                    

``` r
print(unique(ess18n$vote)) # unikke værdier efter rekodning
```

    [1] "Yes" "No"  NA   

### Rekodning til missing baseret på betingelser

Missingværdien `NA` kan godt bruges som værdi, når man vil rekode til
missing. Man angiver blot missingværdien som erstatningsværdi i
rekodningsfunktionen. Herunder et eksempel der koder månedsløn over
200.000,- til missing:

``` r
ess18n <- ess18 |> 
  mutate(grspnum = ifelse(grspnum > 200000, NA, grspnum))

print(max(ess18$grspnum, na.rm = TRUE)) # maks. værdi før rekodning
```

    [1] 3e+06

``` r
print(max(ess18n$grspnum, na.rm = TRUE)) # maks. værdi efter rekodning
```

    [1] 150000

# {#END} end
