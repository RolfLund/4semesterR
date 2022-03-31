---
title: "Kategoriske variable (factors)"
draft: false
weight: 5
---

## Factors (kategoriske variable)

Kategoriske variable (nominale og ordinale variable) er typisk gemt som typen "factor" i R.

Factors bruges til eksplicit at fortælle R, at variablen skal behandles som nominal eller ordinal. Ved at konvertere en variabel til en factor, sætter man både begrænsninger for de mulige værdier (denne variabel indeholder kun X værdier), og man fortæller R, hvordan den skal håndtere variablen, når den bruges i en statistisk model. 

Factors kan enten være "unordered" eller "ordered". En "unordered" factor svarer til en nominalskaleret variabel (en variabel *uden* rangorden), mens en "ordered" factor svarer til en ordinalskaleret variabel (en variabel *med* rangorden).

R kan nogen gange finde på at indlæse tekstvariable som factorer. Dette kan give problemer, da man i sådanne tilfælde ikke har kontrol med, hvordan den er blevet konverteret til en factor (fx at en ordinalskaleret bliver lavet til en "unordered" factor).

### Dan en factor

En variabel kan omdannes til en factor med funktionen (`as.factor`):


```R
ess18n <- ess18 %>%
    mutate(gndr = as.factor(gndr))

head(ess18n)
```

{{< rawhtml >}}
<table class="dataframe">
<caption>A tibble: 6 × 17</caption>
<thead>
	<tr><th scope=col>idno</th><th scope=col>netustm</th><th scope=col>ppltrst</th><th scope=col>vote</th><th scope=col>prtvtddk</th><th scope=col>health</th><th scope=col>lvpntyr</th><th scope=col>tygrtr</th><th scope=col>gndr</th><th scope=col>yrbrn</th><th scope=col>edlvddk</th><th scope=col>eduyrs</th><th scope=col>wkhct</th><th scope=col>wkhtot</th><th scope=col>grspnum</th><th scope=col>frlgrsp</th><th scope=col>inwtm</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td> 5816</td><td> 90</td><td>7</td><td>Yes</td><td>SF Socialistisk Folkeparti - Socialist People's Party</td><td>Good    </td><td>1994</td><td>60</td><td>Male  </td><td>1974</td><td>Mellemlang videregående uddannelse af 3-4 års varighed. Professionsbachelorer,</td><td>35</td><td>37</td><td>37</td><td>37000</td><td>35000</td><td>61</td></tr>
	<tr><td> 7251</td><td>300</td><td>5</td><td>Yes</td><td>Dansk Folkeparti - Danish People's Party             </td><td>Fair    </td><td>1993</td><td>40</td><td>Female</td><td>1975</td><td>Faglig uddannelse (håndværk, handel, landbrug mv.), F.eks. Faglærte, Social-  </td><td>13</td><td>32</td><td>34</td><td>22000</td><td>30000</td><td>68</td></tr>
	<tr><td> 7887</td><td>360</td><td>8</td><td>Yes</td><td>Socialdemokratiet - The Social democrats             </td><td>Fair    </td><td>1983</td><td>55</td><td>Male  </td><td>1958</td><td>Lang videregående uddannelse. Kandidatuddannelser af 5.-6. års varighed, F.eks</td><td>25</td><td>39</td><td>39</td><td>36000</td><td>42000</td><td>89</td></tr>
	<tr><td> 9607</td><td>540</td><td>9</td><td>Yes</td><td>Alternativet - The Alternative                       </td><td>Good    </td><td>1982</td><td>64</td><td>Female</td><td>1964</td><td>Mellemlang videregående uddannelse af 3-4 års varighed. Professionsbachelorer,</td><td>13</td><td>32</td><td>34</td><td>32000</td><td>   NA</td><td>50</td></tr>
	<tr><td>11688</td><td> NA</td><td>5</td><td>Yes</td><td>Socialdemokratiet - The Social democrats             </td><td>Very bad</td><td>1968</td><td>50</td><td>Female</td><td>1952</td><td>Faglig uddannelse (håndværk, handel, landbrug mv.), F.eks. Faglærte, Social-  </td><td> 2</td><td>37</td><td>37</td><td>   NA</td><td>   NA</td><td>77</td></tr>
	<tr><td>12355</td><td>120</td><td>5</td><td>Yes</td><td>Socialdemokratiet - The Social democrats             </td><td>Fair    </td><td>1987</td><td>60</td><td>Male  </td><td>1963</td><td>Faglig uddannelse (håndværk, handel, landbrug mv.), F.eks. Faglærte, Social-  </td><td>14</td><td>38</td><td>37</td><td>36000</td><td>38000</td><td>48</td></tr>
</tbody>
</table>
{{< /rawhtml >}}


Ved bare at se på data, ses ikke umiddelbart nogen ændring, da værdierne stadig er "Male" og "Female". Ses der nærmere på den specifikke variabel, kan det dog ses, hvordan den nu er opbygget:


```R
unique(ess18n$gndr)
```

{{< rawhtml >}}
<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>Male</li><li>Female</li></ol>

<details>
	<summary style=display:list-item;cursor:pointer>
		<strong>Levels</strong>:
	</summary>
	<style>
	.list-inline {list-style: none; margin:0; padding: 0}
	.list-inline>li {display: inline-block}
	.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
	</style>
	<ol class=list-inline><li>'Female'</li><li>'Male'</li></ol>
</details>
{{< /rawhtml >}}