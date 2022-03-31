---
title: "Udvælg rækker (filter)"
draft: false
weight: 1
---

## Udvælg rækker med `filter`

`filter` funktionen tager mindst to input: et datasæt (en dataframe) og et kriterie.


```R
library(dplyr)

ess18_male <- filter(ess18, gndr == 'Male') # Subset kun med mænd

head(ess18_male)
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



```R
ess18_edusub <- filter(ess18, eduyrs > 15) # Subset med folk med mere end 15 års uddannelse

head(ess18_edusub)
```

{{< rawhtml >}}
<table class="dataframe">
<caption>A tibble: 6 × 17</caption>
<thead>
	<tr><th scope=col>idno</th><th scope=col>netustm</th><th scope=col>ppltrst</th><th scope=col>vote</th><th scope=col>prtvtddk</th><th scope=col>health</th><th scope=col>lvpntyr</th><th scope=col>tygrtr</th><th scope=col>gndr</th><th scope=col>yrbrn</th><th scope=col>edlvddk</th><th scope=col>eduyrs</th><th scope=col>wkhct</th><th scope=col>wkhtot</th><th scope=col>grspnum</th><th scope=col>frlgrsp</th><th scope=col>inwtm</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td> 5816</td><td> 90</td><td>7</td><td>Yes</td><td>SF Socialistisk Folkeparti - Socialist People's Party</td><td>Good     </td><td>1994</td><td>60                             </td><td>Male  </td><td>1974</td><td>Mellemlang videregående uddannelse af 3-4 års varighed. Professionsbachelorer,</td><td>35</td><td>37</td><td>37</td><td>37000</td><td>35000</td><td>61</td></tr>
	<tr><td> 7887</td><td>360</td><td>8</td><td>Yes</td><td>Socialdemokratiet - The Social democrats             </td><td>Fair     </td><td>1983</td><td>55                             </td><td>Male  </td><td>1958</td><td>Lang videregående uddannelse. Kandidatuddannelser af 5.-6. års varighed, F.eks</td><td>25</td><td>39</td><td>39</td><td>36000</td><td>42000</td><td>89</td></tr>
	<tr><td>19970</td><td>240</td><td>9</td><td>Yes</td><td>Liberal Alliance - Liberal Alliance                  </td><td>Very good</td><td>1984</td><td>60                             </td><td>Female</td><td>1966</td><td>Lang videregående uddannelse. Kandidatuddannelser af 5.-6. års varighed, F.eks</td><td>21</td><td>36</td><td>36</td><td>85000</td><td>   NA</td><td>42</td></tr>
	<tr><td>22248</td><td>121</td><td>9</td><td>Yes</td><td>Socialdemokratiet - The Social democrats             </td><td>Good     </td><td>1970</td><td>Never too young                </td><td>Female</td><td>1950</td><td>Mellemlang videregående uddannelse af 3-4 års varighed. Professionsbachelorer,</td><td>19</td><td>37</td><td>37</td><td>   NA</td><td>   NA</td><td>62</td></tr>
	<tr><td>24928</td><td>120</td><td>8</td><td>Yes</td><td>Venstre, Danmarks Liberale Parti - The Liberal Party </td><td>Very good</td><td>1984</td><td>Should never retire permanently</td><td>Male  </td><td>1965</td><td>Mellemlang videregående uddannelse af 3-4 års varighed. Professionsbachelorer,</td><td>19</td><td>NA</td><td>80</td><td>50000</td><td>   NA</td><td>77</td></tr>
	<tr><td>27211</td><td>120</td><td>7</td><td>Yes</td><td>Kristendemokraterne - Christian Democrats            </td><td>Fair     </td><td>1983</td><td>60                             </td><td>Male  </td><td>1969</td><td>Mellemlang videregående uddannelse af 3-4 års varighed. Professionsbachelorer,</td><td>16</td><td>15</td><td>17</td><td>26000</td><td>   NA</td><td>99</td></tr>
</tbody>
</table>
{{< /rawhtml >}}


{{% notice note %}}
Bemærk! Ved brug af `filter` behøves kun at skrive navnet på variablen (`eduyrs`), og ikke både navn på variabel og datasæt, som man ellers typisk gør for at referere til enkeltkolonner i R (`ess18$eduyrs`). 
Dette behøves ikke, da `filter` antager, at variabelnavnet kommer fra det datasæt, som er angivet. Dette er gennemgående for de fleste `tidyverse` pakker og kommandoer (`filter`, `select`, `mutate` osv.)

{{% /notice %}}

### Logiske udtryk og logiske værdier

I R skrives kriterier som "logiske udtryk". Logiske udtryk er kommandoer, som altid returnere logiske værdier. Disse er altid enten `TRUE` eller `FALSE` (eller `NA`).

En række operationer i R returnerer altid logiske værdier:

- `>`
- `>=`
- `<`
- `<=`
- `==`
- `!=`


```R
42 > 10
```


TRUE



```R
10 != 10
```


FALSE

`filter()` forventer et logisk udtryk som kriterie, og bevarer så alle de observationer, som opfylder kriteriet.