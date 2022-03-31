---
title: "Rekodning og nye variable (mutate)"
draft: false
weight: 4
---

## Rekodning og nye variable (mutate)

At lave nye variable og (simple) rekodninger er typisk gjort på samme måde. Den eneste forskel er blot, om ændringerne skrives til ny variabel, eller om ændringerne overskriver en eksisterende variabel (rekodning).

I denne sektion ser vi kun på rekodning som "omregninger" af eksisterende variable. For at se rekodning af kategorier, så se under materialet til "Intro til R II".


### Rekodning samt at danne nye variable med `dplyr`

Funktionen `mutate()` i `dplyr` bruges til at rekode samt til at danne nye variable.

Funktionen mindst to input: 
1. Et datasæt, hvor der skal dannes/ændres en variabel
2. Et udtryk for, hvad den ændrede/nye variabel skal indeholde. Dette skrives som `nyvar` = `[variabelindhold]`.

I nedenstående dannes en variabel for interviewtid i timer. Denne dannes ved at tage `inwtm` (interviewtid i minutter) og dividere med 60:


```R
ess18 <- mutate(ess18, inwth = inwtm / 60)

head(ess18$inwth)
```

{{< rawhtml >}}
<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>1.01666666666667</li><li>1.13333333333333</li><li>1.48333333333333</li><li>0.833333333333333</li><li>1.28333333333333</li><li>0.8</li></ol>
{{< /rawhtml >}}


Ovenstående danner en ny variabel for interviewtid i timer: `inwth`. 

Det er typisk bedst at danne nye variable, hvis indholdet i variablen er ændret. Hvis man dog blot ville ændre den oprindelige variabel, skulle man blot specificere det oprindelige variabelnavn i stedet for et nyt:

```R
ess18 <- mutate(ess18, inwtm = inwtm / 60) # Overskriver variabel
```