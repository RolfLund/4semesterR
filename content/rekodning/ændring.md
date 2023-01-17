---
title: Ændring af variabeltype (class)
weight: 2
---
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
