---
title: "Datahåndteringsøvelse"
date: 2022-05-18
draft: false
weight: 14
---

## Øvelse



I denne øvelse skal I undersøge, hvorvidt hvornår man flyttede hjemmefra påvirker ens tillid. I skal bruge European Social Survey subsættet fra 2018, som har været brugt tidligere. Sammenhængen undersøges med lineær regression. Vores population er folk over 25, som er flyttet hjemmefra.

Variablen `lvpntyr` ("Year first left parents for living separately for 2 months or more") bruges til at finde ud af, hvornår de flyttede hjemmefra (også selvom variablen ikke præcist dækker over dette).

Variablen `ppltrst` ("Most people can be trusted or you can’t be too careful") bruges til at undersøge tillid. 

Der kontrolleres for køn (`gndr`) og alder (udregnet med `yrbrn` "fødselsår") samt hvorvidt, man stemte på rød blok til sidste Folketingsvalg eller ej (variabel dannet ud fra `prtvtddk` - "Party voted for in last national election, Denmark".



Link til data: https://github.com/RolfLund/4semesterR/raw/master/teaching-materials/r-intro/datasets/ESS2018DK_subset.csv

I kan se variabelbeskrivelse under sektionen ["Intro til R 1"](https://rolflund.github.io/4semesterR/intro-til-r-1/#indhold-i-data).



1. Indlæs data og tjek at data ser ud, som det skal.



2. Dan en aldersvariabel ud fra deres fødselsår (`yrbrn`) - Husk at data er fra 2018.



3. Filtrer data sådan, at datasættet kun indeholder respondenter, der var over 25 på undersøgelsestidspunktet.



4. Gør variablen `lvpntyr` numerisk (husk at værdier, som ikke er tal, bliver gjort til missing på denne måde).



5. Filtrer yderligere data sådan, at datasættet kun indeholder responder, der er flyttet hjemmefra (svarende til dem, som er missing - `NA` - i `lvpntyr`)



6. Dan en variabel for, hvor mange år de boede hjemme (differencen mellem `yrbrn` og `lvpntyr`)



7. Dan en variabel for, hvorvidt man stemte på rød eller blå blok ud fra `prtvtddk` ("Party voted for in last national election, Denmark")

​		Partierne skal inddeles på følgende måde i den nye variabel (følger opdeling på [Wikipedia](https://da.wikipedia.org/wiki/Blokpolitik)):

| Parti                                                       | Blok         |
| ----------------------------------------------------------- | ------------ |
| "SF Socialistisk Folkeparti - Socialist People's Party"     | Rød          |
| "Socialdemokratiet - The Social democrats"                  | Rød          |
| "Liberal Alliance - Liberal Alliance"                       | Blå          |
| "Kristendemokraterne - Christian Democrats"                 | Blå          |
| "Enhedslisten - Unity List - The Red-Green Alliance"        | Rød          |
| "Dansk Folkeparti - Danish People's Party"                  | Blå          |
| "Alternativet - The Alternative"                            | Rød          |
| "Venstre, Danmarks Liberale Parti - The Liberal Party"      | Blå          |
| "Det Radikale Venstre - The Radical Liberal Party"          | Rød          |
| "Det Konservative Folkeparti - Conservative People's Party" | Blå          |
| "Other"                                                     | missing/`NA` |



8. Dan en simpel lineær regression, der ser på forholdet mellem antal år boet hjemme (variablen dannet i trin 6) og tillid (`ppltrst`)

   

9. Udvid modellen med kontrolvariable for køn (`gndr`) og alder (variabel dannet i trin 2)

   

10. Udvid modellen med kontrolvariabel for, hvorvidt man stemte på rød eller blå blok





