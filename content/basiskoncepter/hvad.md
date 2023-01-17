---
title: Hvad er R?
weight: 1
---
R er et gratis analyseprogram med sit eget kommandosprog.

Programmet egner sig især til kvantiative analyser og visualiseringer af
kvantitative data.

R kan arbejde med mange forskellige dataformater. Da programmet er “open
source”, findes ufattelig mange udvidelser til programmet, der tilføjer
funktioner.

## RStudio

R i sig selv er meget begrænset. RStudio tilføjer en brugerflade ovenpå
R, der gør det rarere at arbejde med.

Man arbejder typisk i RStudio, når man bruger R.

## At arbejde med R

R har sit eget kodesprog. R fungerer ved at man skriver kommandoer i R
sproget, som R derefter “fortolker”.

R (og RStudio) har en meget begrænset brugerflade. Det betyder, at
næsten alt vi vil i R (statistik, visualisering osv.), skal ske ved at
skrive koder i R sproget.

### R som lommeregner

Hvad menes med at R “fortolker” kode?

“Fortolkning” i R er blot et spørgsmål om R forstår, hvad du forsøger at
gøre. Man får R til at gøre ting ved at skrive kommandoer. Hvis R
forstår det, gør R den ting. Hvis R ikke forstår det, får man en fejl.

R kan fx forstå matematiske operationer:

``` r
7 * 6
```

    [1] 42

``` r
912 - 132
```

    [1] 780

R kan dog ikke forstå tilfældige kommandoer:

``` r
lav min eksamensopgave
```

    Error: <text>:1:5: unexpected symbol
    1: lav min
            ^
