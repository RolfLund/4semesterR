---
title: "Datahåndtering i R"
draft: false
weight: 8
---



## Datahåndtering i R

Når man arbejder med data, er man næste altid nødt til at foretage visse ændringer i data, før at de er egnet til analyse. Dette kaldes "datahåndtering".

Datahåndtering inkluderer blandt andet:
- Udvælge specifikke observationer og variable (kaldes også subsetting)
- Danne nye variables
- Rekode værdier

R understøtter datahåndtering med "basis"-kommandoer, men funktionerne tilgængelige gennem tidyverse (https://www.tidyverse.org/) er langt mere intuitive.

### Subset data med `dplyr` 

`dplyr` indeholder blandt andet funktionerne `filter` og `select`, som kan bruges til at subsette data.

`filter()` tager et datasæt og kriterier i form af "logiske udtryk" (mere om dette senere) med brug af variable. Funktionen returnerer de rækker, som opfylder kriterierne.

`select()` tager et datasæt efterfulgt af de variable, som skal bevares. Funktionen returnerer de valgte variable.

BEMÆRK: Basis R har også en `filter()` funktion. Denne funktion overskrives, når man importerer `dplyr`.