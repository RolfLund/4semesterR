---
title: Subset data med tidyverse
weight: 1
---
Med “subsetting” menes at danne et mindre udsnit af data. Dette gøres
blandt andet ved at udvælge specifikke rækker og kolonner i data.

`tidyverse` indeholder funktionerne `filter` og `select`, som kan bruges
til at subsette data (fra pakken `dplyr`).

`filter()` tager et datasæt og kriterier i form af logiske udtryk som
argumenter. Funktionen returnerer de rækker, som opfylder kriterierne.

`select()` tager et datasæt efterfulgt af de variable, som skal bevares
som argumenter. Funktionen returnerer de valgte variable.

BEMÆRK: Basis R har også en `filter()` funktion. Denne funktion
overskrives, når man importerer `tidyverse` (se advarsel).

``` r
library(tidyverse)
```
