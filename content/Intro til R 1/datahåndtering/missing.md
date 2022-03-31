---
title: "Håndtering af missingværdier"
draft: false
weight: 3
---

## Håndtering af missingværdier

Missingværdier er som bekendt angivet med `NA` i R. 

Som vist ved beregning af deskriptive mål (middelværdi, standardafvigelse osv.), så kan R ikke lave beregninger på missingværdier. Ved nogle beregninger frasorterer R missingværdierne automatisk inden beregning, men andre gange skal man selv specificerer, hvad der skal ske med missingværdierne.

Man har derfor typisk brug for at kunne identificere hvilke værdier i datasættet, der er missing. `NA` er dog en speciel værdi, så den kan ikke bruges i et filter lig andre værdier.

I nedenstående forsøges at udvælge de respondenter fra `ess18_male` subsettet, som *ikke* er missing i `grspnum` (selvangivet månedlig indkomst):


```R
ess18_male_filter <- filter(ess18_male, grspnum != NA)

head(ess18_male_filter)
```

{{< rawhtml >}}
<table class="dataframe">
<caption>A tibble: 0 × 17</caption>
<thead>
	<tr><th scope=col>idno</th><th scope=col>netustm</th><th scope=col>ppltrst</th><th scope=col>vote</th><th scope=col>prtvtddk</th><th scope=col>health</th><th scope=col>lvpntyr</th><th scope=col>tygrtr</th><th scope=col>gndr</th><th scope=col>yrbrn</th><th scope=col>edlvddk</th><th scope=col>eduyrs</th><th scope=col>wkhct</th><th scope=col>wkhtot</th><th scope=col>grspnum</th><th scope=col>frlgrsp</th><th scope=col>inwtm</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
</tbody>
</table>
{{< /rawhtml >}}


Ovenstående returnerer ingen rækker, da man ikke kan arbejde med missingværdier på den måde i R. 

For at identificere missingværdier bruges funktionen `is.na()`. Funktionen spørger "er værdien missing?" og returner `TRUE`/`FALSE` (`TRUE` hvis missing; ellers `FALSE`):


```R
head(is.na(ess18_male$grspnum)) # Er de første seks værdier i grspnum missing?
```

{{< rawhtml >}}
<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>FALSE</li><li>FALSE</li><li>FALSE</li><li>FALSE</li><li>FALSE</li><li>FALSE</li></ol>
{{< /rawhtml >}}


Funktionen kan bruges til at finde de observationer, som *er* missing, så hvordan vælges de, som *ikke* er missing?

En simpel måde at vælge de observationer, som *ikke* er missing, er ved at "vende" kommandoen om, sådan at der gives `TRUE`, hvis de *ikke* er missing. 

I R kan logiske udtryk vendes om ved at bruge `!` foran udtrykket (ved at "vende om" menes, at `TRUE` bliver til `FALSE`, og `FALSE` bliver til `TRUE`:


```R
!(2 < 4) # 2 er mindre end fire, men giver FALSE, da det vendes om med !
```


FALSE


`!` kan også bruges i kombination med `is.na()`:


```R
head(!(is.na(ess18_male$grspnum))) # Er de første seks værdier i grspnum ikke missing?
```

{{< rawhtml >}}
<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>TRUE</li><li>TRUE</li><li>TRUE</li><li>TRUE</li><li>TRUE</li><li>TRUE</li></ol>
{{< /rawhtml >}}


Med ovenstående kan man udelukkende vælge de respondenter, som ikke er missing:


```R
ess18_male_filter <- filter(ess18_male, !(is.na(grspnum)))

head(ess18_male_filter)
```

{{< rawhtml >}}
<table class="dataframe">
<caption>A tibble: 6 × 17</caption>
<thead>
	<tr><th scope=col>idno</th><th scope=col>netustm</th><th scope=col>ppltrst</th><th scope=col>vote</th><th scope=col>prtvtddk</th><th scope=col>health</th><th scope=col>lvpntyr</th><th scope=col>tygrtr</th><th scope=col>gndr</th><th scope=col>yrbrn</th><th scope=col>edlvddk</th><th scope=col>eduyrs</th><th scope=col>wkhct</th><th scope=col>wkhtot</th><th scope=col>grspnum</th><th scope=col>frlgrsp</th><th scope=col>inwtm</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td> 5816</td><td> 90</td><td>7</td><td>Yes</td><td>SF Socialistisk Folkeparti - Socialist People's Party</td><td>Good     </td><td>1994</td><td>60                             </td><td>Male</td><td>1974</td><td>Mellemlang videregående uddannelse af 3-4 års varighed. Professionsbachelorer,</td><td>35</td><td>37</td><td>37</td><td>37000</td><td>35000</td><td>61</td></tr>
	<tr><td> 7887</td><td>360</td><td>8</td><td>Yes</td><td>Socialdemokratiet - The Social democrats             </td><td>Fair     </td><td>1983</td><td>55                             </td><td>Male</td><td>1958</td><td>Lang videregående uddannelse. Kandidatuddannelser af 5.-6. års varighed, F.eks</td><td>25</td><td>39</td><td>39</td><td>36000</td><td>42000</td><td>89</td></tr>
	<tr><td>12355</td><td>120</td><td>5</td><td>Yes</td><td>Socialdemokratiet - The Social democrats             </td><td>Fair     </td><td>1987</td><td>60                             </td><td>Male</td><td>1963</td><td>Faglig uddannelse (håndværk, handel, landbrug mv.), F.eks. Faglærte, Social-  </td><td>14</td><td>38</td><td>37</td><td>36000</td><td>38000</td><td>48</td></tr>
	<tr><td>16357</td><td>488</td><td>5</td><td>Yes</td><td>Dansk Folkeparti - Danish People's Party             </td><td>Very good</td><td>2013</td><td>50                             </td><td>Male</td><td>1991</td><td>Mellemlang videregående uddannelse af 3-4 års varighed. Professionsbachelorer,</td><td> 4</td><td>37</td><td>37</td><td>40000</td><td>   NA</td><td>50</td></tr>
	<tr><td>20724</td><td> 60</td><td>5</td><td>Yes</td><td>Venstre, Danmarks Liberale Parti - The Liberal Party </td><td>Good     </td><td>1981</td><td>Never too young                </td><td>Male</td><td>1958</td><td>Faglig uddannelse (håndværk, handel, landbrug mv.), F.eks. Faglærte, Social-  </td><td>14</td><td>37</td><td>40</td><td>28000</td><td>34000</td><td>65</td></tr>
	<tr><td>24928</td><td>120</td><td>8</td><td>Yes</td><td>Venstre, Danmarks Liberale Parti - The Liberal Party </td><td>Very good</td><td>1984</td><td>Should never retire permanently</td><td>Male</td><td>1965</td><td>Mellemlang videregående uddannelse af 3-4 års varighed. Professionsbachelorer,</td><td>19</td><td>NA</td><td>80</td><td>50000</td><td>   NA</td><td>77</td></tr>
</tbody>
</table>
{{< /rawhtml >}}