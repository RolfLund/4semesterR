---
title: Deskriptive mål
weight: 5
---
R indeholder en række funktioner til at regne specifikke deskriptive
mål, fx `min()` (minimum), `max()` (maksimum), `mean()` (middelværdi),
`sd()` (standardafvigelse) og `length()` (antal værdier/rækker).

``` r
min(ess18$yrbrn) # Mindste værdi
```

    [1] 1929

``` r
max(ess18$yrbrn) # Største værdi
```

    [1] 2003

``` r
mean(ess18$yrbrn) # Middelværdi
```

    [1] 1967.047

``` r
sd(ess18$yrbrn) # Standardafvigelse
```

    [1] 18.29441

``` r
length(ess18$yrbrn) # Antal værdier i variabel (svarer til antal rækker)
```

    [1] 1285

Husk at vi med R kan lagre hvad som helst som et objekt. Hvis vi fx
løbende får brug for at kalde et mål frem, kan vi lagre det som et
objekt for sig:

``` r
mean_yrbrn <- mean(ess18$yrbrn)

print(mean_yrbrn)
```

    [1] 1967.047
