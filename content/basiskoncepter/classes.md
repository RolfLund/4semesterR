---
title: Classes
weight: 5
---
R adskiller mellem objekter via deres "class".

Funktionen `class()` bruges til at tjekke hvilken "class" objektet har:

```{r}
name = "keenan"
year = 1964
```

```{r}
class(name)
```

```{r}
class(year)
```

Talværdier tilskrives typisk class `numeric`, mens tekst tilskrives `character`. Tekstværdier omtales mere generelt som "strings" i programmeringssammenhænge (også i R).

En "class" er R's måde at holde styr på, hvilken type af information, som objektet indeholder. Samtidig sætter class betingelserne for, hvad der kan lade sig gøre med objektet (fx at vi kan lave udregninger med tal, men at vi ikke kan det med tekst).

I de fleste tilfælde kan R tvinge værdier fra en type ("class") til en anden. Ved at gøre dette, bliver inkompatible værdier til missing (`NA`).

Værdier kan tvinges til tekst værdier med `as.character()`

Værdier kan tvinges til numeriske værdier med `as.numeric()`

Herunder omdannes `year` til en string (tekstværdi):

```{r}
year_chr <- as.character(year)

print(year_chr)
class(year_chr)
```

Senere skal vi se, hvordan man nogen gange kan have brug for at fortælle R, hvad class værdier skal have.
