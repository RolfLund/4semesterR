---
title: Missing-værdier
weight: 6
---
Data vil ofte indeholde missing-værdier. Missing-værdier angiver
ikke-gyldige værdier; fx et manglende svar, ugyldigt svar, information
der ikke kunne skaffes eller lignende.

Missing-værdier bruges til at give en værdi uden at give en værdi
(cellerne skal indeholde *noget*). Missing-værdier angives som `NA` i R.

BEMÆRK: Det er ikke givet at missing-værdier er kodet som missing på
forhånd i et datasæt. Hvordan missing-værdier kodes varierer mellem
programmer. Derfor bruger man ofte specifikke talværdier (fx 777777
eller 888888) til at indikere missing-værdier. Man kan også stå i
situationer, hvor visse kategorier er irrelevante for analysen, hvor man
så koder disse til missing.

`summary()`-funktionen inkluderer antallet af missing-værdier i
variablen:

``` r
summary(ess18$inwtm)
```

       Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
      18.00   51.00   59.00   63.32   70.00  613.00       5 

Missing-værdier er hverken høje eller lave i R. Dette betyder at det
ikke er muligt at lave beregninger med missing-værdier.

``` r
min(ess18$inwtm) # NA is neither high or low - returns NA
```

    [1] NA

``` r
max(ess18$inwtm) # NA is neither high or low - returns NA
```

    [1] NA

``` r
mean(ess18$inwtm) # NA is neither high or low - returns NA
```

    [1] NA

Ofte er man nødt til at håndtere missing-værdier i sit analysearbejde;
enten ved at erstatte dem eller ved at fjerne rækker, som har
missing-værdier.

Nogle funktioner har indbyggede argumenter til at håndtere
missing-værdier.

### Kan vi fjerne missing i vores beregning?

Ved at kigge på hjælpefilen for `max()`, kan vi finde argumentet
`na.rm`. Dette argument bruges til at fjerne missing, når R laver
beregningen.

Bemærk at argumentet i hjælpefilen er skrevet `na.rm = FALSE`. Dette
angiver standardindstillingen for funktionen. Det vil sige, at hvis ikke
man specificerer andet, så er det den måde, som funktionen køres. I
dette tilfælde er argumentet som standard sat til `FALSE`
(missing-værdier fjernes *ikke*).

Ved at ændre argumentet, når vi bruger funktionen, fjernes
missing-værdierne inden beregning:

``` r
max(ess18$inwtm, na.rm = TRUE)
```

    [1] 613