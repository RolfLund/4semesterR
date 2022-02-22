---
title: "Datahåndtering i R: Subsetting"
date: 2021-12-20T08:08:52+01:00
draft: false
weight: 7
---



## Datahåndtering i R

Når man arbejder med data, er man næste altid nødt til at foretage visse ændringer i data, før at de er egnet til analyse. Dette kaldes "datahåndtering".

Datahåndtering inkluderer blandt andet:
- Udvælge specifikke observationer og variable (kaldes også subsetting)
- Danne nye variables
- Rekode værdier

R understøtter datahåndtering med "basis"-kommandoer, men funktionerne tilgængelige gennem tidyverse (https://www.tidyverse.org/) er langt mere intuitive.

### Subset data med `dplyr` 

`dplyr` indeholder blandt andet funktionerne `filter` og `select`, som kan bruges til at subsette data.

`filter()` tager et datasæt og kriterier i form af "logiske udtryk" (mere om dette senere) med brug af variable. Funktionen returnerer de rækker, som opfylder kriterierne.

`select()` tager et datasæt efterfulgt af de variable, som skal bevares. Funktionen returnerer de valgte variable.

BEMÆRK: Basis R har også en `filter()` funktion. Denne funktion overskrives, når man importerer `dplyr`.

### Udvælg rækker med `filter`


```R
library(dplyr)

ess18_male <- filter(ess18, gndr == 'Male') # Subset kun med mænd

head(ess18_male)
```


    Vedhæfter pakke: 'dplyr'


​    
​    De følgende objekter er maskerede fra 'package:stats':
​    
        filter, lag


​    
​    De følgende objekter er maskerede fra 'package:base':
​    
        intersect, setdiff, setequal, union


​    
​    

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


### Logiske udtryk og logiske værdier

Normalt kender vi ikke rækkenumrene på de rækker, som vi gerne vil beholde. Vi udvælger derfor rækker med brug af kriterier. 

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


### Vælg kolonner/variable med `select`


```R
ess18_male_subset <- select(ess18_male, idno, gndr, yrbrn, edlvddk) # Udvælg specifikke variable

head(ess18_male_subset)
```

{{< rawhtml >}}
<table class="dataframe">
<caption>A tibble: 6 × 4</caption>
<thead>
	<tr><th scope=col>idno</th><th scope=col>gndr</th><th scope=col>yrbrn</th><th scope=col>edlvddk</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td> 5816</td><td>Male</td><td>1974</td><td>Mellemlang videregående uddannelse af 3-4 års varighed. Professionsbachelorer,</td></tr>
	<tr><td> 7887</td><td>Male</td><td>1958</td><td>Lang videregående uddannelse. Kandidatuddannelser af 5.-6. års varighed, F.eks</td></tr>
	<tr><td>12355</td><td>Male</td><td>1963</td><td>Faglig uddannelse (håndværk, handel, landbrug mv.), F.eks. Faglærte, Social-  </td></tr>
	<tr><td>16357</td><td>Male</td><td>1991</td><td>Mellemlang videregående uddannelse af 3-4 års varighed. Professionsbachelorer,</td></tr>
	<tr><td>20724</td><td>Male</td><td>1958</td><td>Faglig uddannelse (håndværk, handel, landbrug mv.), F.eks. Faglærte, Social-  </td></tr>
	<tr><td>24928</td><td>Male</td><td>1965</td><td>Mellemlang videregående uddannelse af 3-4 års varighed. Professionsbachelorer,</td></tr>
</tbody>
</table>
{{< /rawhtml >}}