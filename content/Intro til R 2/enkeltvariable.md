---
title: "Enkeltvariable (vectors)"
date: 2021-12-20T08:08:52+01:00
draft: false
weight: 5
---

## Data frames og "vectors"

Data frames består af rækker og kolonner. R forventer typisk at rækkerne indeholder "observationer" (fx personer), mens kolonner indeholder variable (information omkring observationerne).

R behandler en enkelt kolonne/variabel som en "vector". En "vector" er en samling af værdier af den samme *class* (fx tal eller tekster).

Man udpeger en enkelt kolonne i en data frame med `$` (en "vector").


```R
head(ess18$yrbrn) # første seks værdier i yrbrn
```

{{< rawhtml >}}
<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>1974</li><li>1975</li><li>1958</li><li>1964</li><li>1952</li><li>1963</li></ol>
{{< /rawhtml >}}


Hver værdi i en variabel har et indeks, som afspejler rækkenummeret i data.

Man udpeger et specifikt rækkenummer med `[]`:


```R
ess18$yrbrn[10] # Giver 10. værdi (række 10) af yrbrn variabel
```

	1958


```R
ess18$yrbrn[2:10] # Giver række 2 til 10 af yrbrn (begge inkluderet)
```

{{< rawhtml >}}
<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>1975</li><li>1958</li><li>1964</li><li>1952</li><li>1963</li><li>1991</li><li>1984</li><li>1966</li><li>1958</li></ol>
{{< /rawhtml >}}


R indeholder en række funktioner til at regne specifikke deskriptive mål, fx `min()` (minimum), `max()` (maksimum), `mean()` (middelværdi), `sd()` (standardafvigelse) og `length()` (antal værdier/rækker).


```R
min(ess18$yrbrn) # Mindste værdi
max(ess18$yrbrn) # Største værdi
mean(ess18$yrbrn) # Middelværdi
sd(ess18$yrbrn) # Standardafvigelse
length(ess18$yrbrn) # Antal værdier i variabel (svarer til antal rækker)
```


	1929

	2003

	1967.04747081712

	18.2944100607406

	1285


Husk at vi med R kan lagre hvad som helst som et objekt. Hvis vi fx løbende får brug for at kalde et mål frem, kan vi lagre det som et objekt for sig:


```R
mean_yrbrn <- mean(ess18$yrbrn)
```


```R
mean_yrbrn
```

	1967.04747081712


`unique()` giver de unikke værdier i en variabel:


```R
unique(ess18$health)
```

{{< rawhtml >}}
<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>'Good'</li><li>'Fair'</li><li>'Very bad'</li><li>'Very good'</li><li>'Bad'</li><li>NA</li></ol>
{{< /rawhtml >}}