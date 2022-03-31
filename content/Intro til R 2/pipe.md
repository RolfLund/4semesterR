---
title: "Kombinér datahåndteringsfunktioner med pipe (%>%)"
draft: false
weight: 4
---

## Kombinér datahåndteringsfunktioner med pipe (%>%)

Det bliver hurtigt omstændeligt at foretage flere datahåndteringsoperationer, hvis man skal specificere navnet på datasættet hver gang. Dette kan forsimples ved brug af "pipe"-operatoren (`%>%`).

"pipe"-operatoren er en del af `tidyverse` og er derfor kompatibel med næsten alle funktioner fra de `tidyverse` pakkerne. 

Et "pipe" fungerer kort sagt ved at tage outputtet på en kodelinje videre til kodelinjen under, og bruge dette output som input i funktionen på den nye linje. Man bruger for det meste "pipe" i forbindelse med datahåndtering, da ideen her er, at outputtet af en kodelinje/kommando er en dataframe, som så kan bruges som input på kodelinjen/kommandoen på næste linje.

Herunder dannes et subet af ESS18, der indeholder alle mænd og variablene `idno`, `gndr`, `yrbrn`, `edlvddk`:


```R
ess18_male_subset <- filter(ess18, gndr == 'Male')
ess18_male_subset <- select(ess18, idno, gndr, yrbrn, edlvddk)

head(ess18_male_subset)
```

{{< rawhtml >}}
<table class="dataframe">
<caption>A tibble: 6 × 4</caption>
<thead>
	<tr><th scope=col>idno</th><th scope=col>gndr</th><th scope=col>yrbrn</th><th scope=col>edlvddk</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td> 5816</td><td>Male  </td><td>1974</td><td>Mellemlang videregående uddannelse af 3-4 års varighed. Professionsbachelorer,</td></tr>
	<tr><td> 7251</td><td>Female</td><td>1975</td><td>Faglig uddannelse (håndværk, handel, landbrug mv.), F.eks. Faglærte, Social-  </td></tr>
	<tr><td> 7887</td><td>Male  </td><td>1958</td><td>Lang videregående uddannelse. Kandidatuddannelser af 5.-6. års varighed, F.eks</td></tr>
	<tr><td> 9607</td><td>Female</td><td>1964</td><td>Mellemlang videregående uddannelse af 3-4 års varighed. Professionsbachelorer,</td></tr>
	<tr><td>11688</td><td>Female</td><td>1952</td><td>Faglig uddannelse (håndværk, handel, landbrug mv.), F.eks. Faglærte, Social-  </td></tr>
	<tr><td>12355</td><td>Male  </td><td>1963</td><td>Faglig uddannelse (håndværk, handel, landbrug mv.), F.eks. Faglærte, Social-  </td></tr>
</tbody>
</table>
{{< /rawhtml >}}


Ovenstående kode er omstændelig af flere grunde: For det første skal navnet på det endelige subset `ess18_male_subset` gentages for hver datahåndteringskommando. For det andet skal inputdatasættet (`ess18`) også gentages hver gang.

Med et pipe kan dette undgås:


```R
ess18_male_subset <- ess18 %>% # subset skal tage udgangspunkt i ess18
    filter(gndr == 'Male') %>% # filter for mænd - datainput er output af ovenstående (en kopi af ess18)
    select(idno, gndr, yrbrn, edlvddk) # udvælg variable - datainput er output af ovenstående (ess18 filtreret for mænd)

head(ess18_male_subset)
```

{{< rawhtml >}}
<table class="dataframe">
<caption>A tibble: 6 × 4</caption>
<thead>
	<tr><th scope=col>idno</th><th scope=col>gndr</th><th scope=col>yrbrn</th><th scope=col>edlvddk</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td> 5816</td><td>Male</td><td>1974</td><td>Mellemlang videregående uddannelse af 3-4 års varighed. Professionsbachelorer,</td></tr>
	<tr><td> 7887</td><td>Male</td><td>1958</td><td>Lang videregående uddannelse. Kandidatuddannelser af 5.-6. års varighed, F.eks</td></tr>
	<tr><td>12355</td><td>Male</td><td>1963</td><td>Faglig uddannelse (håndværk, handel, landbrug mv.), F.eks. Faglærte, Social-  </td></tr>
	<tr><td>16357</td><td>Male</td><td>1991</td><td>Mellemlang videregående uddannelse af 3-4 års varighed. Professionsbachelorer,</td></tr>
	<tr><td>20724</td><td>Male</td><td>1958</td><td>Faglig uddannelse (håndværk, handel, landbrug mv.), F.eks. Faglærte, Social-  </td></tr>
	<tr><td>24928</td><td>Male</td><td>1965</td><td>Mellemlang videregående uddannelse af 3-4 års varighed. Professionsbachelorer,</td></tr>
</tbody>
</table>
{{< /rawhtml >}}