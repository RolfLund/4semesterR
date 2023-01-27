---
title: Rekod til missing
weight: 7
---
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