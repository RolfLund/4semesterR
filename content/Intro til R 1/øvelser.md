---
title: "Øvelser til undervisningsgangen"
date: 2021-12-20T08:08:52+01:00
draft: false
weight: 10
---

## ØVELSE 1: OBJEKTER OG FUNKTIONER

1. Dan følgende objekter:

    - `name1`: `"araya"`
    - `name2`: `"townsend"`
    - `year1`: `1961` (uden citationstegn)
    - `year2`: `"1972"` (med citationstegn)
2. Forsøg at udregn alderen for `year1` og `year2` (nuværende år - year-objekt). 
3. Brug funktionen `toupper()` til at ændre `name1` til blokbogstaver.



## ØVELSE 2: DESKRIPTIVE MÅL

Brug forskellige funktioner til at udregne følgende:

- Middelværdien (`mean()`) for tid brugt på internettet om dagen (`netustm`)
- Den højeste værdi (`max()`) for tid brugt på internettet om dagen (`netustm`)
- Medianen (`median()`) for brutto månedsløn (`grspnum`)

BEMÆRK! Variablene indeholder muligvis missing-værdier. Tjek hjælpefilerne for at se, hvordan man tager højde for dette.



## ØVELSE 3: SUBSETTING

1. Dan et subset af data, der *kun* indeholder kvinder født efter 1980 og med følgende variable: `idno`, `gndr`, `yrbrn`, `netustm`

2. Brug `head()` til at tjekke om subsettet ser rigtigt ud.

3. Beregn middelværdien for tid brugt på internettet om dagen (`netustm`) for subsettet.

### Ekstra øvelse

1. Dan et subset for mænd født efter 1980
2. Beregn middelværdien for tid brugt på internettet om dagen (`netustm`) for subsettet. Er middelværdien højere eller lavere end det for kvinderne?



## ØVELSE 4: DAN NYE VARIABLE

1. Dan en aldersvariabel (datasættet er fra 2018)

2. Dan en overtids-variabel, der indeholder forskellen mellem faktiske arbejdstimer om ugen (`wkhtot`) og arbejdstimer ansat til om ugen (`wkhct`).

3. Hvad er den højeste overtidsværdi? (brug enten `summary()` eller `max()`



## ØVELSE 5: CLASS COERCION

Dan en variabel, der indeholder antal år respondenten boede hjemme, inden de flyttede hjemmefra (`lvpntyr`: first time living separately for 2 months). 

Bemærk at variablen `lvpntyr` muligvis ikke er klar til beregninger med det samme.

Husk at `as.numeric()` tvinger værdier om til tal.