---
title: "Missing-værdier"
date: 2021-12-20T08:08:52+01:00
draft: false
weight: 7
---

## Missing-værdier

Data vil ofte indeholde missing-værdier. Missing-værdier angiver ikke-gyldige værdier; fx et manglende svar, ugyldigt svar, information der ikke kunne skaffes eller lignende.

Missing-værdier bruges til at give en værdi uden at give en værdi (cellerne skal indeholde *noget*). Missing-værdier angives som `NA` i R.

BEMÆRK: Det er ikke givet at missing-værdier er kodet som missing på forhånd i et datasæt. Hvordan missing-værdier kodes varierer mellem programmer. Derfor bruger man ofte specifikke talværdier (fx 777777 eller 888888) til at indikere missing-værdier. Man kan også stå i situationer, hvor visse kategorier er irrelevante for analysen, hvor man så koder disse til missing.

`summary()`-funktionen inkluderer antallet af missing-værdier i variablen:


```R
summary(ess18$inwtm)
```


       Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
      18.00   51.00   59.00   63.32   70.00  613.00       5 


Missing-værdier er hverken høje eller lave i R. Dette betyder at det ikke er muligt at lave beregninger med missing-værdier.


```R
min(ess18$inwtm) # NA is neither high or low - returns NA
max(ess18$inwtm) # NA is neither high or low - returns NA
mean(ess18$inwtm) # NA is neither high or low - returns NA
```

	<NA>
	<NA>
	<NA>

Ofte er man nødt til at håndtere missing-værdier i sit analysearbejde; enten ved at erstatte dem eller ved at fjerne rækker, som har missing-værdier.

Nogle funktioner har indbyggede argumenter til at håndtere missing-værdier.

## Brug af hjælpe-funktionen

Alle R funktioner og kommandoer er dokumenteret, så du behøver ikke at huske hvordan hver enkelt funktion fungerer.

Alle funktioner har sin egen "hjælpefil". Hjælpefilen beskriver hvordan funktionen bruges, og hvad de forskellige argumenter gør.

Man åbner hjælpefilen for en funktion ved at skrive `?` foran.

### Kan vi fjerne missing i vores beregning?

Ved at kigge på hjælpefilen for `max()`, kan vi finde argumentet `na.rm`. Dette argument bruges til at fjerne missing, når R laver beregningen.

Bemærk at argumentet i hjælpefilen er skrevet `na.rm = FALSE`. Dette angiver standardindstillingen for funktionen. Det vil sige, at hvis ikke man specificerer andet, så er det den måde, som funktionen køres. I dette tilfælde er argumentet som standard sat til `FALSE` (missing-værdier fjernes ikke).

Ved at ændre argumentet, når vi bruger funktionen, fjernes missing-værdierne inden beregning:


```R
max(ess18$inwtm, na.rm = TRUE)
```

	613