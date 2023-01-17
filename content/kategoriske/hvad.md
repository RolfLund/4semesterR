---
title: Hvad er en factor?
weight: 1
---
Factors bruges til eksplicit at fortælle R, at variablen skal behandles
som nominal eller ordinal. Ved at konvertere en variabel til en factor,
sætter man både begrænsninger for de mulige værdier (denne variabel
indeholder kun X værdier), og man fortæller R, hvordan den skal håndtere
variablen, når den bruges i en statistisk model.

Factors kan enten være “unordered” eller “ordered”. En “unordered”
factor svarer til en nominalskaleret variabel (en variabel *uden*
rangorden), mens en “ordered” factor svarer til en ordinalskaleret
variabel (en variabel *med* rangorden).

R kan nogen gange finde på at indlæse tekstvariable som factorer. Dette
kan give problemer, da man i sådanne tilfælde ikke har kontrol med,
hvordan den er blevet konverteret til en factor (fx at en
ordinalskaleret bliver lavet til en “unordered” factor).

### Dan en factor

En variabel kan omdannes til en factor med funktionen (`as.factor`):

``` r
ess18n <- ess18 |>
    mutate(gndr = as.factor(gndr))

head(ess18n)
```

    # A tibble: 6 × 17
       idno netustm ppltrst vote  prtvtddk health lvpntyr tygrtr gndr  yrbrn edlvddk
      <dbl>   <dbl>   <dbl> <chr> <chr>    <chr>  <chr>   <chr>  <fct> <dbl> <chr>  
    1  5816      90       7 Yes   SF Soci… Good   1994    60     Male   1974 Mellem…
    2  7251     300       5 Yes   Dansk F… Fair   1993    40     Fema…  1975 Faglig…
    3  7887     360       8 Yes   Sociald… Fair   1983    55     Male   1958 Lang v…
    4  9607     540       9 Yes   Alterna… Good   1982    64     Fema…  1964 Mellem…
    5 11688      NA       5 Yes   Sociald… Very … 1968    50     Fema…  1952 Faglig…
    6 12355     120       5 Yes   Sociald… Fair   1987    60     Male   1963 Faglig…
    # … with 6 more variables: eduyrs <dbl>, wkhct <dbl>, wkhtot <dbl>,
    #   grspnum <dbl>, frlgrsp <dbl>, inwtm <dbl>

Ved bare at se på data, ses ikke umiddelbart nogen ændring, da værdierne
stadig er “Male” og “Female”. Ses der nærmere på den specifikke
variabel, kan det dog ses, hvordan den nu er opbygget:

``` r
unique(ess18n$gndr)
```

    [1] Male   Female
    Levels: Female Male

### Levels i en factor

Når man omdanner en variabel til en factor, fortæller man også R, at
denne variabel *kun* kan indeholde nogle specifikke værdier. De værdier,
som variablen kan indeholde, er dens “levels”.

Ser man fx på de unikke værdier i et subet kun med mænd, vil man se, at
data kun indeholder værdien “Male”, men at de mulige værdier er “Male”
og “Female”:

``` r
ess18_male_subset <- filter(ess18, gndr == 'Male')

unique(ess18_male_subset$gndr)
```

    [1] "Male"

`as.factor()` vil altid antage, at værdierne i variablen er de mulige
værdier. Hvis man gerne vil styre de mulige værdier (levels), skal man
bruge funktionen `factor()` i stedet.

``` r
ess18n <- ess18 |>
    mutate(gndr = factor(gndr, levels = c('Male', 'Female')))
```

{{% notice warning %}} Husk! R tager ting *meget* bogstaveligt -
herunder også tekstværdierne i en variabel. Når du specificerer levels,
så sørg for at de er skrevet præcist, som de er angivet i variablen. {{%
/notice %}}

Ved at specificere `levels` fortæller man R, at variablen *kun* skal
indeholde de værdier. Alle øvrige værdier bliver derfor sat til missing:

``` r
ess18n <- ess18 |>
    mutate(gndr_3 = factor(gndr, levels = c("Male", "Other")))

table(ess18n$gndr_3)
```


     Male Other 
      655     0 

For at hjælpe sig selv, kan man som alternativ til `factor()` bruge
`parse_factor()` (fra `tidyverse`/`readr`). Denne fungerer præcis
ligesom `factor()` med den ene forskel, at den giver advarsler, hvis
værdier bliver tvunget til missing:

``` r
ess18n <- ess18 |>
    mutate(gndr_3 = parse_factor(gndr, levels = c('Male', 'Other')))
```

    Warning: 630 parsing failures.
    row col           expected actual
      2  -- value in level set Female
      4  -- value in level set Female
      5  -- value in level set Female
      8  -- value in level set Female
      9  -- value in level set Female
    ... ... .................. ......
    See problems(...) for more details.

``` r
table(ess18n$gndr_3)
```


     Male Other 
      655     0 

### Strings (tekstværider) vs. factors

Fordelen ved at bruge factors er, at man kan styre hvordan kategorierne
skal forstås af R. Factors tillader også at man kan arbejde med
kategorier, som muligvis ikke er til stede i data. Dette er fx brugbart
i surveystudier, hvor man kan komme ud for, at visse kategorier ikke er
besvaret.

``` r
ess18n <- ess18 |>
    mutate(gndr_3 = factor(gndr, levels = c('Female', 'Male', 'Other')))

table(ess18n$gndr_3)
```


    Female   Male  Other 
       630    655      0 
