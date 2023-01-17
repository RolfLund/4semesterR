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

    ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──

    ✓ ggplot2 3.3.5     ✓ purrr   0.3.4
    ✓ tibble  3.1.6     ✓ dplyr   1.0.8
    ✓ tidyr   1.2.0     ✓ stringr 1.4.0
    ✓ readr   2.1.1     ✓ forcats 0.5.1

    ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    x dplyr::filter() masks stats::filter()
    x dplyr::lag()    masks stats::lag()
