---
title: "R Sproget: Funktioner"
date: 2021-12-20T08:08:52+01:00
draft: false
weight: 3
---

## Funktioner

Funktioner er kommandoer brugt til at transformere objektet på en måde og give et output.

Det, som man sætter i funktionen, kaldes et "argument" eller "input". Antallet af argumenter varierer mellem funktioner.

Funktioner har alle den samme opbygning: `funktionsnavn(arg1, arg2, arg3)`. (funktionsnavn med argumenterne i parentes adskilt med kommaer).

Nogle argumenter er krævet, mens andre er valgfrie.

### Eksempler på funktioner

Gør tekst til blokbogstaver:


```R
name <- 'kilmister'
toupper(name) 
```


	'KILMISTER'


Erstat bogstaver i tekst:


```R
gsub("e", "a", name)
```


	'kilmistar'


### Funktioner og output

Bemærk at funktioner *aldrig* ændrer et objekt. Når man bruger en funktion, beder man R om at *se* et output, men ikke om at ændre noget.

Hvis man vil ændre et objekt, skal man derfor lagre outputtet i et objekt (et nyt eller eksisterende).


```R
name # uændret selvom det er brugt i flere funktioner
```


	'kilmister'



```R
name <- gsub("e", "a", name) # overskriv objekt med ændringen
```


```R
name
```


	'kilmistar'

