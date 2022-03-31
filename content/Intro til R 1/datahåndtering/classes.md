---
title: "\"Classes\" i R (ændring af variabeltype)"
draft: false
weight: 5
---

## "Classes" i R (ændring af variabeltype)

Som nævnt tidligere, adskiller R mellem objekter via deres "class".

Funktionen `class()` bruges til at tjekke hvilken "class" objektet har:


```R
name = "keenan"
year = 1964
```


```R
class(name)
```


'character'



```R
class(year)
```


'numeric'


Enkelte variable(/"vectors") kan *kun* indeholde værdier med samme class. Funktionen `class()` virker derfor også på variable.

Variablen `tygrtr` (i hvilken alder er man for ung til at gå på pension) ligner en variabel, der bør indeholde numeriske værdier (en alder). Ser vi nærmere på variablen, kan vi dog se, at den også indeholder tekst-værdier:


```R
head(ess18$tygrtr)
```

{{< rawhtml >}}
<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>'60'</li><li>'40'</li><li>'55'</li><li>'64'</li><li>'50'</li><li>'60'</li></ol>
{{< /rawhtml >}}


Undersøger vi variablens "class", kan vi se, at variablen er lagret som tekst (også kaldt "string" i programmeringssprog):


```R
class(ess18$tygrtr)
```


'character'


Dette betyder at vi ikke kan lave beregninger med variablen:


```R
max(ess18$tygrtr, na.rm = TRUE) # Viser højeste værdi alfabetisk
```


'Should never retire permanently'


### "Class coercion" - tving en variabel til en anden type

I de fleste tilfælde kan R tvinge værdier fra en type/class til en anden. Ved at gøre dette, bliver inkompatible værdier til missing (`NA`). 

Værdier kan tvinges til tekst værdier med `as.character()`

Værdier kan tvinges til numeriske værdier med `as.numeric()`

Herunder dannes en numerisk version af `tygrtr` (bemærk advarslen):


```R
ess18 <- mutate(ess18, tygrtr_num = as.numeric(tygrtr))
```

    Warning message in mask$eval_all_mutate(quo):
    "NAs introduced by coercion"


Nu kan variablen bruges i beregninger:


```R
max(ess18$tygrtr_num, na.rm = TRUE)
```


88