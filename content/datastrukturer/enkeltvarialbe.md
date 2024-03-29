---
title: Enkeltvarialbe (vectors)
weight: 4
---
En basal datastruktur i R er en *vector*.

En *vector* er en række af værdier af den samme type (fx en række tal,
en række ord osv.).

En *vector* svarer til en enkelt variabel/kolonne i en dataframe, og man
arbejder med vectors på samme måde, som man arbejder med enkelte
kolonner (samme funktioner kan bruges).

*Vectors* dukker op i mange forskellige sammenhænge i R, da de bruges
hver gang, at man skal specificere en samling af flere værdier.

**Dan en vector**

En vector dannes med `c()`, hvor værdierne adskilles med `,`:

``` r
numbers <- c(2, 9, 11, 7, 12, 14, 4)
```

`numbers` er nu en talrække, som der kan laves beregninger på, ligesom
med en variabel i en dataframe:

``` r
mean(numbers)
```

    [1] 8.428571

``` r
sd(numbers)
```

    [1] 4.353433
