---
title: Hvad er ggplot2?
weight: 1
---
Pakken `ggplot2` er en del af `tidyverse` og bruges til at lave
visualiseringer af data. Funktionerne i `ggplot2` gør det muligt at
tilpasse nærmest alt, og understøtter mange typer af visualisering.

Herunder ses et eksempel på, hvordan man danner et punktdiagram
(scatterplot) i `ggplot2`:

``` r
library(ggplot2)

ess18_filt <- ess18 |> # Filtrering af data for at undgå ekstreme værdier
    filter(grspnum < 200000)

# Dan scatterplot
ggplot(data = ess18_filt, aes(x = yrbrn, y = grspnum)) + 
    geom_point()
```

![png](/output_53_0.png)

Overordnet set fungerer ggplot ved, at man først angiver, hvad der skal
visualiseres (data og “aesthetics”), hvorefter man angiver, hvordan det
skal visualiseres (“geom”).

### Opbygning af et ggplot

Som hovedregel følger et ggplot denne skabelon:

    ggplot(data = <DATA>, mapping = aes(<MAPPINGS>)) + 
      <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))

- **ggplot**: Hovedfunktion. Denne angiver *hvad* der skal visualiseres.
  Funktikonen `ggplot()` indeholder ikke i sig selv information om
  hvilken type plot, der skal laves. Dette angives med en
  “geom”-funktion.

  - *data*: Krævet argument til ggplot. Forventer en data frame som
    input.

- **mapping**: Krævet argument. Her angives hvilke informationer fra
  data, som skal “mappes” til plottet. Dette gøres ved at angive
  “aesthetics” (`aes()`). De primære mappings er `x` og `y` (ligesom
  akerne i et plot). Andre mappings inkluderer `colour`, `fill`,
  `shape`, `size`. Mappings angives altid som`aes(MAPPINGS)` (fx
  `aes(x = 'eduyrs', y = 'grspnum')`). Mappings kan både angives som
  argumentet til plottet i det hele taget, eller specifikt for et enkelt
  visualiseringslag (“geom”). Forskellen er, hvorvidt mapping gælder for
  alle lag i visualiseringen eller kun et enkelt lag.

- **GEOM_FUNCTION (fx geom_point)**: Plotting-funktion. Et “geom” er
  kort sagt den type plot, som man gerne vil bruge til at visualisere
  data. Mere teknisk referer “geom” til den geometriske form, som skal
  bruges til at repræsentere datapunkterne (bjælker, linjer, bokse,
  punkter osv.). Det er muligt at have adskillige geoms i et plot (altså
  flere lag i visualiseringen).

  - *mapping*: Alle geom-funktioner accepterer et mapping argument.
    Bemærk dog at det ikke er alle aesthetics der er kompatible med alle
    geoms (et histogram har fx ikke en mapping for y).

Det kan være vanskeligt at huske alle de enkelte dele af et ggplot i
starten. Dog findes der et cheatsheet, som man med fordel kan søge hjælp
i:
https://raw.githubusercontent.com/rstudio/cheatsheets/master/data-visualization-2.1.pdf

### Kombinér information i adskillige aesthetics og visualiseringslag

Måden `ggplot2` er bygget op tillader, at man kan relativt nemt kan
kombinere mange typer af information i en enkelt visualisering
(nedenstående er ment som et illustrativt eksempel):

``` r
ggplot(data = ess18_filt, mapping = aes(x = eduyrs, y = grspnum)) +
  geom_point(mapping = aes(colour = gndr, shape = vote, size = netustm)) +
  geom_smooth(colour = 'lightgreen')
```

![png](/output_55_1.png)

{{% notice info %}} `ggplot2` bruger `+` til at tilføje lag til
visualiseringen. Selvom koden kan minde om måden, som man bruger pipe
(`|>`), så vil det ikke virke her. Pipe bruges til at videreføre et
output til en ny funktion. I dette tilfælde bruger vi `+` til at
fortælle R, at plottet ikke er færdigt, da der skal tilføjes flere lag.
{{% /notice %}}
