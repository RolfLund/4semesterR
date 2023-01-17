---
title: “Ordered” og “unordered” factors
weight: 2
---
En factor vil som standard blive sat til “unordered” (nominalskaleret).
Dette kan ændres ved at bruge funktionen `factor()` sammen med
`ordered =` argumentet. Hvor `as.factor()` bruges til at konvertere
værdierne i en variabel til ikke-rangordnede kategorier, så bruges
`factor()` både til at styre hvilke kategorier, der skal indgå i
factoren samt til at styre, om den skal være rangordnet eller ej.

Herunder omdannes `health`-variablen (selvvurderet helbred) til en
rangordnet factor, uden rækkefølgen specificeres:

``` r
# Dan factor som rangordnet/ordinal (men hvilken rækkefølge?)
ess18n <- ess18 |>
    mutate(health_r = factor(health, ordered = TRUE))

unique(ess18n$health_r)
```

    [1] Good      Fair      Very bad  Very good Bad       <NA>     
    Levels: Bad < Fair < Good < Very bad < Very good

Fordi rækkefølgen ikke er specificeret, antager R, at de skal sættes i
alfabetisk rangorden. Dette betyder, at `health_r` variablen er kodet
sådan, at “Very bad” betragtes som en højere værdi end “Good”:

``` r
print(ess18n$health_r[5])
```

    [1] Very bad
    Levels: Bad < Fair < Good < Very bad < Very good

``` r
print(ess18n$health_r[10])
```

    [1] Good
    Levels: Bad < Fair < Good < Very bad < Very good

``` r
ess18n$health_r[5] > ess18n$health_r[10] # Er "Very bad" højere end "Good"?
```

    [1] TRUE

R kan ikke vide, hvad der kommer først i rækkefølge ud fra tekstværdien
alene, så det skal man selv specificere i rekodningen. Dette gøres ved
at specificere levels i rækkefølgen lav til høj:

``` r
ess18n <- ess18 |>
    mutate(health_r = factor(health, levels = c('Very bad', 'Bad', 'Fair', 'Good', 'Very good'), ordered = TRUE))

unique(ess18n$health_r)
```

    [1] Good      Fair      Very bad  Very good Bad       <NA>     
    Levels: Very bad < Bad < Fair < Good < Very good

``` r
print(ess18n$health_r[5])
```

    [1] Very bad
    Levels: Very bad < Bad < Fair < Good < Very good

``` r
print(ess18n$health_r[10])
```

    [1] Good
    Levels: Very bad < Bad < Fair < Good < Very good

``` r
ess18n$health_r[5] > ess18n$health_r[10] # Er "Very bad" højere end "Good"?
```

    [1] FALSE
