---
title: Rekodning af kategoriske variable
weight: 3
---
Vi har tidligere set på hvordan variable kan dannes eller rekodes fra
eksisterende variable med brug af simple omregninger (fx `inwtm / 60`
for at få interviewtid i timer).

Rekodning af kategoriske data må gøres anderledes. Her står man typisk
enten over for at skulle ændre kategorierne, slå kategorier sammen eller
danne kategorier ud fra nogle betingelser (fx hvis man skal lave en
intervalskaleret variabel om til kategorisk).

`tidyverse` (pakken `dplyr`) har en række funktioner til rekodning af
kategoriske værdier. De tre hovedfunktioner er: - `recode`: Ændrer
enkelte kategorier - `if_else`: Rekodning baseret på ét logisk udtryk -
`case_when`: Rekodning baseret på flere logiske udtryk

Alle disse skal kombineres med `mutate`.

Ved at indlæse `tidyverse` er alle disse rekodningsfunktioner læst ind:

``` r
library(tidyverse)
```
