---
title: Variabelændringer med mutate
weight: 6
---
En væsentlig del af datahåndtering er at foretage forskellige
variabelændringer - enten i form af at rekode værdier i en variabel
eller ved at danne nye variable, som gør brug af information fra andre
variable.

I `tidyverse` bruges funktionen `mutate` til at foretage
variabelændringer - uanset om der er tale om nye variable eller ændring
af eksisterende (rekodning).

**Dan ny variabel med `mutate`**

Funktionen `mutate()` fra `tidyverse` (pakken `dplyr`) bruges til at
foretage variabelændringer (rekodning samt danne nye variable.

Funktionen mindst to input: 1. Et datasæt, hvor der skal dannes/ændres
en variabel 2. Et udtryk for, hvad den ændrede/nye variabel skal
indeholde. Dette skrives som `nyvar` = `[variabelindhold]`.

I nedenstående dannes en variabel for interviewtid i timer. Denne dannes
ved at tage `inwtm` (interviewtid i minutter) og dividere med 60:

``` r
ess18 <- mutate(ess18, inwth = inwtm / 60)

head(ess18$inwth)
```

    [1] 1.0166667 1.1333333 1.4833333 0.8333333 1.2833333 0.8000000

At lave nye variable og rekodninger er typisk gjort på samme måde. Den
eneste forskel er blot, om ændringerne skrives til ny variabel, eller om
ændringerne overskriver en eksisterende variabel (rekodning).

Det er typisk bedst at danne nye variable, hvis indholdet i variablen er
ændret. Hvis man dog blot ville ændre den oprindelige variabel, skulle
man blot specificere det oprindelige variabelnavn i stedet for et nyt:

``` r
ess18 <- mutate(ess18, inwtm = inwtm / 60) # Overskriver variabel
```