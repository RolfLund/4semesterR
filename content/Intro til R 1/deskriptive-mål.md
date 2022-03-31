---
title: "Deskriptive mål"
draft: false
weight: 6
---

## Deskriptive mål


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