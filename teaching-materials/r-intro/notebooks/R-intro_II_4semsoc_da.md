```R
library(readr)

ess18 <- read_csv("https://github.com/RolfLund/4semesterR/raw/master/teaching-materials/r-intro/datasets/ESS2018DK_subset.csv")
```

    [1mRows: [22m[34m1285[39m [1mColumns: [22m[34m17[39m
    
    [36m--[39m [1mColumn specification[22m [36m------------------------------------------------------------------------------------------------[39m
    [1mDelimiter:[22m ","
    [31mchr[39m  (7): vote, prtvtddk, health, lvpntyr, tygrtr, gndr, edlvddk
    [32mdbl[39m (10): idno, netustm, ppltrst, yrbrn, eduyrs, wkhct, wkhtot, grspnum, frl...
    
    
    [36mi[39m Use [30m[47m[30m[47m`spec()`[47m[30m[49m[39m to retrieve the full column specification for this data.
    [36mi[39m Specify the column types or set [30m[47m[30m[47m`show_col_types = FALSE`[47m[30m[49m[39m to quiet this message.
    
    

# Introduktion til R (del 2)

*4. semester sociologi, 2022*

## Program

- Hvorfor er datahåndtering så vigtigt?
- Datahåndtering og visualisering i R: Et eksempel
- Subsetting (`filter` og `select`)
- Nye variable og rekodning (`mutate`)
- Kategoriske variable ("factors" i R)
- Visualisering i R med `ggplot`

#### Hvis vi når det
- Lav dine egne funktioner i R
- Opsummeringer af data med `group_by()` 

## HUSK!

Al materiale fra i dag kan findes på kursussiden: https://rolflund.github.io/4semesterR/ (sektionerne "Intro til R I" og "Intro til R II")

Bogen "R for Data Science" introducerer til datahåndtering og visualiseirng, og kan tilgås gratis online: https://r4ds.had.co.nz/

<center><a href = "https://r4ds.had.co.nz/"> <img src="https://d33wubrfki0l68.cloudfront.net/b88ef926a004b0fce72b2526b0b5c4413666a4cb/24a30/cover.png" width="200"/></a></center>

Brug Google (eller anden søgemaskine)!

## Datahåndtering og visualisering i R: Et eksempel

Herunder foretages en række datahåndteringer på European Social Survey 2018 delsættet. Vi bruger dagen i dag på at forstå de forskellige datahåndteringsfunktioner (primært fra `tidyverse` - specifikt pakken `dplyr`).


```R
library(dplyr)

ess18_wh <- ess18 %>%
    mutate(age = 2018 - yrbrn) %>%
    filter(age >= 25) %>%
    filter(!(is.na(wkhtot))) %>%
    mutate(wkhtot_cat = case_when(
        wkhtot == 37 ~ "37 timer om ugen",
        wkhtot < 37 ~ "Mindre end 37 timer",
        wkhtot > 37 ~ "Mere end 37 timer")
          ) %>%
    mutate(wkhtot_cat = factor(wkhtot_cat, levels = c("Mindre end 37 timer", "37 timer om ugen", "Mere end 37 timer"), 
                               ordered = TRUE)) %>%
    mutate(gndr = factor(gndr, levels = c("Male", "Female"), labels = c("Mand", "Kvinde"))) %>%
    select(gndr, age, wkhtot, wkhtot_cat, netustm)
```

Herunder dannes et barplot baseret på det sæt, som blev dannet i ovenstående kode. Vi vil ligeledes bruge dagen i dag på at forstå, hvordan denne visualisering er dannet (med brug af `ggplot2` - også en del af `tidyverse`)


```R
library(ggplot2)

ggplot(ess18_wh, aes(x = wkhtot_cat, y = (..count..)/sum(..count..), fill = gndr)) + 
    geom_bar(position = "dodge") + 
    scale_y_continuous(labels = scales::percent) + 
    labs(title = "Arbejdstid fordelt på køn",
         x = "Arbejdstid",
         y = "Procent", 
         fill = "Køn")
```


    
![png](output_7_0.png)
    


## Subsetting (`filter` og `select`)

Se under "Intro til R I" under sektionen "Datahåndtering i R".

## Nye variable og rekodning (`mutate`)

Se under "Intro til R I" under sektionen "Datahåndtering i R".

## Kombinér datahåndteringsfunktioner med pipe (%>%)

Det bliver hurtigt omstændeligt at foretage flere datahåndteringsoperationer, hvis man skal specificere navnet på datasættet hver gang. Dette kan forsimples ved brug af "pipe"-operatoren (`%>%`).

"pipe"-operatoren er en del af `tidyverse` og er derfor kompatibel med næsten alle funktioner fra de `tidyverse` pakkerne. 

Et "pipe" fungerer kort sagt ved at tage outputtet på en kodelinje videre til kodelinjen under, og bruge dette output som input i funktionen på den nye linje. Man bruger for det meste "pipe" i forbindelse med datahåndtering, da ideen her er, at outputtet af en kodelinje/kommando er en dataframe, som så kan bruges som input på kodelinjen/kommandoen på næste linje.

Herunder dannes et subet af ESS18, der indeholder alle mænd og variablene `idno`, `gndr`, `yrbrn`, `edlvddk`:


```R
ess18_male_subset <- filter(ess18, gndr == 'Male')
ess18_male_subset <- select(ess18, idno, gndr, yrbrn, edlvddk)

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
	<tr><td> 5816</td><td>Male  </td><td>1974</td><td>Mellemlang videregående uddannelse af 3-4 års varighed. Professionsbachelorer,</td></tr>
	<tr><td> 7251</td><td>Female</td><td>1975</td><td>Faglig uddannelse (håndværk, handel, landbrug mv.), F.eks. Faglærte, Social-  </td></tr>
	<tr><td> 7887</td><td>Male  </td><td>1958</td><td>Lang videregående uddannelse. Kandidatuddannelser af 5.-6. års varighed, F.eks</td></tr>
	<tr><td> 9607</td><td>Female</td><td>1964</td><td>Mellemlang videregående uddannelse af 3-4 års varighed. Professionsbachelorer,</td></tr>
	<tr><td>11688</td><td>Female</td><td>1952</td><td>Faglig uddannelse (håndværk, handel, landbrug mv.), F.eks. Faglærte, Social-  </td></tr>
	<tr><td>12355</td><td>Male  </td><td>1963</td><td>Faglig uddannelse (håndværk, handel, landbrug mv.), F.eks. Faglærte, Social-  </td></tr>
</tbody>
</table>
{{< /rawhtml >}}



Ovenstående kode er omstændelig af flere grunde: For det første skal navnet på det endelige subset `ess18_male_subset` gentages for hver datahåndteringskommando. For det andet skal inputdatasættet (`ess18`) også gentages hver gang.

Med et pipe kan dette undgås:


```R
ess18_male_subset <- ess18 %>% # subset skal tage udgangspunkt i ess18
    filter(gndr == 'Male') %>% # filter for mænd - datainput er output af ovenstående (en kopi af ess18)
    select(idno, gndr, yrbrn, edlvddk) # udvælg variable - datainput er output af ovenstående (ess18 filtreret for mænd)

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


### Levels i en factor

Når man omdanner en variabel til en factor, fortæller man også R, at denne variabel kun kan indeholde nogle specifikke værdier. De værdier, som variablen kan indeholde, er dens "levels".

Ser man fx på de unikke værdier i et subet kun med mænd, vil man se, at data kun indeholder værdien "Male", men at de mulige værdier er "Male" og "Female":


```R
ess18_male_subset <- filter(ess18, gndr == 'Male')

unique(ess18_male_subset$gndr)
```


Male
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


### "Ordered" og "unordered" factors

En factor vil som standard blive sat til "unordered" (nominalskaleret). Dette kan ændres ved at bruge funktionen `factor()` sammen med `ordered =` argumentet. Hvor `as.factor()` bruges til at konvertere værdierne i en variabel til ikke-rangordnede kategorier, så bruges `factor()` både til at styre hvilke kategorier, der skal indgå i factoren samt til at styre, om den skal være rangordnet eller ej.

Herunder omdannes `health`-variablen (selvvurderet helbred) til en rangordnet factor, uden rækkefølgen specificeres:


```R
# Dan factor som rangordnet/ordinal (men hvilken rækkefølge?)
ess18n <- ess18 %>%
    mutate(health_r = factor(health, ordered = TRUE))

unique(ess18n$health_r)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>Good</li><li>Fair</li><li>Very bad</li><li>Very good</li><li>Bad</li><li>&lt;NA&gt;</li></ol>

<details>
	<summary style=display:list-item;cursor:pointer>
		<strong>Levels</strong>:
	</summary>
	<style>
	.list-inline {list-style: none; margin:0; padding: 0}
	.list-inline>li {display: inline-block}
	.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
	</style>
	<ol class=list-inline><li>'Bad'</li><li>'Fair'</li><li>'Good'</li><li>'Very bad'</li><li>'Very good'</li></ol>
</details>


Fordi rækkefølgen ikke er specificeret, antager R, at de skal sættes i alfabetisk rangorden. Dette betyder, at `health_r` variablen er kodet sådan, at "Very bad" betragtes som en højere værdi end "Good":


```R
print(ess18n$health_r[5])
print(ess18n$health_r[10])

ess18n$health_r[5] > ess18n$health_r[10] # Er "Very bad" højere end "Good"?
```

    [1] Very bad
    Levels: Bad < Fair < Good < Very bad < Very good
    [1] Good
    Levels: Bad < Fair < Good < Very bad < Very good
    


TRUE


R kan ikke vide, hvad der kommer først i rækkefølge ud fra tekstværdien alene, så det skal man selv specificere i rekodningen. Dette gøres ved at specificere levels i rækkefølgen lav til høj:


```R
ess18n <- ess18 %>%
    mutate(health_r = factor(health, levels = c('Very bad', 'Bad', 'Fair', 'Good', 'Very good'), ordered = TRUE))

unique(ess18n$health_r)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>Good</li><li>Fair</li><li>Very bad</li><li>Very good</li><li>Bad</li><li>&lt;NA&gt;</li></ol>

<details>
	<summary style=display:list-item;cursor:pointer>
		<strong>Levels</strong>:
	</summary>
	<style>
	.list-inline {list-style: none; margin:0; padding: 0}
	.list-inline>li {display: inline-block}
	.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
	</style>
	<ol class=list-inline><li>'Very bad'</li><li>'Bad'</li><li>'Fair'</li><li>'Good'</li><li>'Very good'</li></ol>
</details>



```R
print(ess18n$health_r[5])
print(ess18n$health_r[10])

ess18n$health_r[5] > ess18n$health_r[10] # Er "Very bad" højere end "Good"?
```

    [1] Very bad
    Levels: Very bad < Bad < Fair < Good < Very good
    [1] Good
    Levels: Very bad < Bad < Fair < Good < Very good
    


FALSE


{{% notice warning %}}
Husk! R tager ting *meget* bogstaveligt - herunder også tekstværdierne i en variabel. Når du specificerer levels, så sørg for at de er skrevet præcist, som de er angivet i variablen.
{{% /notice %}}

Ved at specificere `levels` fortæller man R, at variablen *kun* skal indeholde de værdier. Alle øvrige værdier bliver derfor sat til missing:


```R
ess18n <- ess18 %>%
    mutate(gndr_3 = factor(gndr, levels = c("Male", "Other")))

table(ess18n$gndr_3)
```


    
     Male Other 
      655     0 


For at hjælpe sig selv, kan man som alternativ til `factor()` bruge `parse_factor()` (fra `readr`/`tidyverse`). Denne fungerer præcis ligesom `factor()` med den ene forskel, at den giver advarsler, hvis værdier bliver tvunget til missing:


```R
ess18n <- ess18 %>%
    mutate(gndr_3 = parse_factor(gndr, levels = c('Male', 'Other')))

table(ess18n$gndr_3)
```

    Warning message:
    "630 parsing failures.
    row col           expected actual
      2  -- value in level set Female
      4  -- value in level set Female
      5  -- value in level set Female
      8  -- value in level set Female
      9  -- value in level set Female
    ... ... .................. ......
    See problems(...) for more details.
    "
    


    
     Male Other 
      655     0 


### Labels i en factor

`factor()` funktionen har også et `labels` argument. Denne bruges til at angive, hvad værdierne i factoren skal hedde. Som standard antager R, at `labels` skal være det samme som `levels`, men man kan vælge at specificere andre labels. Disse skal så angives i samme rækkefølge som labels:


```R
ess18n <- ess18 %>%
    mutate(health_r = factor(health, levels = c('Very bad', 'Bad', 'Fair', 'Good', 'Very good'), 
                             labels = c('Meget dårligt', 'Dårligt', 'Jævnt', 'Godt', 'Meget godt'), 
                             ordered = TRUE))

unique(ess18n$health_r)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>Godt</li><li>Jævnt</li><li>Meget dårligt</li><li>Meget godt</li><li>Dårligt</li><li>&lt;NA&gt;</li></ol>

<details>
	<summary style=display:list-item;cursor:pointer>
		<strong>Levels</strong>:
	</summary>
	<style>
	.list-inline {list-style: none; margin:0; padding: 0}
	.list-inline>li {display: inline-block}
	.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
	</style>
	<ol class=list-inline><li>'Meget dårligt'</li><li>'Dårligt'</li><li>'Jævnt'</li><li>'Godt'</li><li>'Meget godt'</li></ol>
</details>


At specificere `labels` er principielt en rekodning af værdierne. Man kan derfor bruge denne funktionalitet til at slå kategorier sammen også:


```R
ess18n <- ess18 %>%
    mutate(health_r = factor(health, levels = c('Very bad', 'Bad', 'Fair', 'Good', 'Very good'), 
                             labels = c('Dårligt', 'Dårligt', 'Jævnt', 'Godt', 'Godt'), 
                             ordered = TRUE))

unique(ess18n$health_r)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>Godt</li><li>Jævnt</li><li>Dårligt</li><li>&lt;NA&gt;</li></ol>

<details>
	<summary style=display:list-item;cursor:pointer>
		<strong>Levels</strong>:
	</summary>
	<style>
	.list-inline {list-style: none; margin:0; padding: 0}
	.list-inline>li {display: inline-block}
	.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
	</style>
	<ol class=list-inline><li>'Dårligt'</li><li>'Jævnt'</li><li>'Godt'</li></ol>
</details>


### Strings (tekstværider) vs. factors

Fordelen ved at bruge factors er, at man kan styre hvordan kategorierne skal forstås af R. Factors tillader også at man kan arbejde med kategorier, som muligvis ikke er til stede i data. Dette er fx brugbart i surveystudier, hvor man kan komme ud for, at visse kategorier ikke er besvaret.


```R
ess18n <- ess18 %>%
    mutate(gndr_3 = factor(gndr, levels = c('Female', 'Male', 'Other')))

table(ess18n$gndr_3)
```


    
    Female   Male  Other 
       630    655      0 


## Kodning af kategoriske variable (`recode`, `if_else` og `case_when`)

Vi har tidligere set på hvordan variable kan dannes eller rekodes fra eksisterende variable med brug af simple omregninger (fx `inwtm / 60` for at få interviewtid i timer).

Rekodning af kategoriske data må gøres anderledes. Her står man typisk enten over for at skulle ændre kategorierne, slå kategorier sammen eller danne kategorier ud fra nogle betingelser (fx hvis man skal lave en intervalskaleret variabel om til kategorisk).

### Redkodning af kategorier med `dplyr`

`dplyr` har en række funktioner til rekodning af kategoriske værdier. De tre hovedfunktioner er:
- `recode`: Ændr enkelte kategorier
- `if_else`: Rekodning baseret på ét logisk udtryk
- `case_when`: Rekodning baseret på flere logiske udtryk

Alle disse skal kombineres med `mutate`.

#### `recode`

Herunder bruges `recode()` til at ændre kategorierne for køn til dansk:


```R
ess18n <- ess18 %>%
    mutate(gndr_da = recode(gndr, 'Male' = 'Mand', 'Female' = 'Kvinde')) %>%
    select(idno, gndr, gndr_da)

head(ess18n)
```


{{< rawhtml >}}
<table class="dataframe">
<caption>A tibble: 6 × 3</caption>
<thead>
	<tr><th scope=col>idno</th><th scope=col>gndr</th><th scope=col>gndr_da</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td> 5816</td><td>Male  </td><td>Mand  </td></tr>
	<tr><td> 7251</td><td>Female</td><td>Kvinde</td></tr>
	<tr><td> 7887</td><td>Male  </td><td>Mand  </td></tr>
	<tr><td> 9607</td><td>Female</td><td>Kvinde</td></tr>
	<tr><td>11688</td><td>Female</td><td>Kvinde</td></tr>
	<tr><td>12355</td><td>Male  </td><td>Mand  </td></tr>
</tbody>
</table>
{{< /rawhtml >}}



Ved brug af `.default` argumentet, kan man angive en værdi for alle øvrige værdier (bortset fra missing):


```R
ess18n <- ess18 %>%
    mutate(gndr_da = recode(gndr, 'Male' = 'Mand', .default = 'Ikke mand')) %>%
    select(idno, gndr, gndr_da)

head(ess18n)
```


{{< rawhtml >}}
<table class="dataframe">
<caption>A tibble: 6 × 3</caption>
<thead>
	<tr><th scope=col>idno</th><th scope=col>gndr</th><th scope=col>gndr_da</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td> 5816</td><td>Male  </td><td>Mand     </td></tr>
	<tr><td> 7251</td><td>Female</td><td>Ikke mand</td></tr>
	<tr><td> 7887</td><td>Male  </td><td>Mand     </td></tr>
	<tr><td> 9607</td><td>Female</td><td>Ikke mand</td></tr>
	<tr><td>11688</td><td>Female</td><td>Ikke mand</td></tr>
	<tr><td>12355</td><td>Male  </td><td>Mand     </td></tr>
</tbody>
</table>
{{< /rawhtml >}}



#### `if_else`

`if_else()` bruges til at rekode værdier baseret på ét logisk udtryk.

Opbygningen er: `if_else([logisk udtryk], [værdi for sandt], [værdi for falsk])`


```R
ess18n <- ess18 %>% 
    mutate(health_r = factor(health, levels = c('Very bad', 'Bad', 'Fair', 'Good', 'Very good'), ordered = TRUE)) %>%
    mutate(healthdum = if_else(health_r <= "Fair", "Not good", "Good")) %>%
    select(idno, health_r, healthdum)

head(ess18n)
```


{{< rawhtml >}}
<table class="dataframe">
<caption>A tibble: 6 × 3</caption>
<thead>
	<tr><th scope=col>idno</th><th scope=col>health_r</th><th scope=col>healthdum</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;ord&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td> 5816</td><td>Good    </td><td>Good    </td></tr>
	<tr><td> 7251</td><td>Fair    </td><td>Not good</td></tr>
	<tr><td> 7887</td><td>Fair    </td><td>Not good</td></tr>
	<tr><td> 9607</td><td>Good    </td><td>Good    </td></tr>
	<tr><td>11688</td><td>Very bad</td><td>Not good</td></tr>
	<tr><td>12355</td><td>Fair    </td><td>Not good</td></tr>
</tbody>
</table>
{{< /rawhtml >}}



#### `ifelse` eller `if_else`?

I basis R findes funktionen `ifelse`, som fungerer mere eller mindre præcis på samme måde som `if_else` (som er fra `dplyr`).

Den primære forskel mellem funktionerne er, at `if_else` er mere streng, og forventer at værdierne for sand og falsk er af samme type ("class").

I eksemplet herunder laves en (ubrugelig) rekodning, hvor alle værdier over 5 i `ppltrst` (tillid til andre mennesker fra 0-10) gives værdien "Over 5", mens alle andre beholder deres oprindelige værdi (dette gøres ved bare at specificere den oprindelige variabel under værdien for falsk).

Først med `ifelse()`:


```R
ess18n <- ess18 %>% 
    mutate(ppltrst_n = ifelse(ppltrst > 5, "Over 5", ppltrst)) %>%
    select(idno, ppltrst, ppltrst_n)

head(ess18n)
```


{{< rawhtml >}}
<table class="dataframe">
<caption>A tibble: 6 × 3</caption>
<thead>
	<tr><th scope=col>idno</th><th scope=col>ppltrst</th><th scope=col>ppltrst_n</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td> 5816</td><td>7</td><td>Over 5</td></tr>
	<tr><td> 7251</td><td>5</td><td>5     </td></tr>
	<tr><td> 7887</td><td>8</td><td>Over 5</td></tr>
	<tr><td> 9607</td><td>9</td><td>Over 5</td></tr>
	<tr><td>11688</td><td>5</td><td>5     </td></tr>
	<tr><td>12355</td><td>5</td><td>5     </td></tr>
</tbody>
</table>
{{< /rawhtml >}}



`ifelse()` foretager rekodningen uden problemer, men bemærk at den nye variabel er ændret fra `dbl` (en numerisk type/class) til `chr` ("character" - en string).

Forsøges samme med `if_else()`, gives der en fejl:


```R
ess18n <- ess18 %>% 
    mutate(ppltrst_n = if_else(ppltrst > 5, "Over 5", ppltrst)) %>%
    select(idno, ppltrst, ppltrst_n)

head(ess18n)
```


    Error: Problem with `mutate()` column `ppltrst_n`.
    i `ppltrst_n = if_else(ppltrst > 5, "Over 5", ppltrst)`.
    x `false` must be a character vector, not a double vector.
    Traceback:
    

    1. ess18 %>% mutate(ppltrst_n = if_else(ppltrst > 5, "Over 5", ppltrst)) %>% 
     .     select(idno, ppltrst, ppltrst_n)

    2. select(., idno, ppltrst, ppltrst_n)

    3. mutate(., ppltrst_n = if_else(ppltrst > 5, "Over 5", ppltrst))

    4. mutate.data.frame(., ppltrst_n = if_else(ppltrst > 5, "Over 5", 
     .     ppltrst))

    5. mutate_cols(.data, ..., caller_env = caller_env())

    6. withCallingHandlers({
     .     for (i in seq_along(dots)) {
     .         mask$across_cache_reset()
     .         context_poke("column", old_current_column)
     .         quosures <- expand_across(dots[[i]])
     .         quosures_results <- vector(mode = "list", length = length(quosures))
     .         for (k in seq_along(quosures)) {
     .             quo <- quosures[[k]]
     .             quo_data <- attr(quo, "dplyr:::data")
     .             if (!is.null(quo_data$column)) {
     .                 context_poke("column", quo_data$column)
     .             }
     .             chunks <- NULL
     .             result <- NULL
     .             if (quo_is_symbol(quo)) {
     .                 name <- as_string(quo_get_expr(quo))
     .                 if (name %in% names(new_columns)) {
     .                   result <- new_columns[[name]]
     .                   chunks <- mask$resolve(name)
     .                 }
     .                 else if (name %in% names(.data)) {
     .                   result <- .data[[name]]
     .                   chunks <- mask$resolve(name)
     .                 }
     .                 if (inherits(.data, "rowwise_df") && vec_is_list(result)) {
     .                   sizes <- list_sizes(result)
     .                   wrong <- which(sizes != 1)
     .                   if (length(wrong)) {
     .                     group <- wrong[1L]
     .                     mask$set_current_group(group)
     .                     abort(x_size = sizes[group], class = "dplyr:::mutate_incompatible_size")
     .                   }
     .                 }
     .             }
     .             if (is.null(chunks)) {
     .                 chunks <- mask$eval_all_mutate(quo)
     .             }
     .             if (is.null(chunks)) {
     .                 next
     .             }
     .             if (is.null(result)) {
     .                 if (length(rows) == 1) {
     .                   result <- chunks[[1]]
     .                 }
     .                 else {
     .                   result <- withCallingHandlers(vec_unchop(chunks <- vec_cast_common(!!!chunks), 
     .                     rows), vctrs_error_incompatible_type = function(cnd) {
     .                     abort(class = "dplyr:::error_mutate_incompatible_combine", 
     .                       parent = cnd)
     .                   })
     .                 }
     .             }
     .             quosures_results[[k]] <- list(result = result, chunks = chunks)
     .         }
     .         for (k in seq_along(quosures)) {
     .             quo <- quosures[[k]]
     .             quo_data <- attr(quo, "dplyr:::data")
     .             quo_result <- quosures_results[[k]]
     .             if (is.null(quo_result)) {
     .                 if (quo_data$is_named) {
     .                   name <- quo_data$name_given
     .                   new_columns[[name]] <- zap()
     .                   mask$remove(name)
     .                 }
     .                 next
     .             }
     .             result <- quo_result$result
     .             chunks <- quo_result$chunks
     .             if (!quo_data$is_named && is.data.frame(result)) {
     .                 new_columns[names(result)] <- result
     .                 mask$add_many(result, chunks)
     .             }
     .             else {
     .                 name <- quo_data$name_auto
     .                 new_columns[[name]] <- result
     .                 mask$add_one(name, chunks)
     .             }
     .         }
     .     }
     . }, error = function(e) {
     .     local_call_step(dots = dots, .index = i, .fn = "mutate", 
     .         .dot_data = inherits(e, "rlang_error_data_pronoun_not_found"))
     .     call_step_envir <- peek_call_step()
     .     error_name <- call_step_envir$error_name
     .     error_expression <- call_step_envir$error_expression
     .     show_group_details <- TRUE
     .     if (inherits(e, "dplyr:::mutate_incompatible_size")) {
     .         size <- vec_size(rows[[mask$get_current_group()]])
     .         x_size <- e$x_size
     .         bullets <- c(i = cnd_bullet_column_info(), i = glue("`{error_name}` must be size {or_1(size)}, not {x_size}."), 
     .             i = cnd_bullet_rowwise_unlist())
     .     }
     .     else if (inherits(e, "dplyr:::mutate_mixed_null")) {
     .         show_group_details <- FALSE
     .         bullets <- c(i = cnd_bullet_column_info(), x = glue("`{error_name}` must return compatible vectors across groups."), 
     .             i = "Cannot combine NULL and non NULL results.", 
     .             i = cnd_bullet_rowwise_unlist())
     .     }
     .     else if (inherits(e, "dplyr:::mutate_not_vector")) {
     .         bullets <- c(i = cnd_bullet_column_info(), x = glue("`{error_name}` must be a vector, not {friendly_type_of(e$result)}."), 
     .             i = cnd_bullet_rowwise_unlist())
     .     }
     .     else if (inherits(e, "dplyr:::error_mutate_incompatible_combine")) {
     .         show_group_details <- FALSE
     .         bullets <- c(i = cnd_bullet_column_info(), x = glue("`{error_name}` must return compatible vectors across groups"), 
     .             i = cnd_bullet_combine_details(e$parent$x, e$parent$x_arg), 
     .             i = cnd_bullet_combine_details(e$parent$y, e$parent$y_arg))
     .     }
     .     else {
     .         bullets <- c(i = cnd_bullet_column_info(), x = conditionMessage(e))
     .     }
     .     bullets <- c(cnd_bullet_header(), bullets, i = if (show_group_details) cnd_bullet_cur_group_label())
     .     abort(bullets, class = c("dplyr:::mutate_error", "dplyr_error"), 
     .         error_name = error_name, error_expression = error_expression, 
     .         parent = e, bullets = bullets)
     . }, warning = function(w) {
     .     if (check_muffled_warning(w)) {
     .         maybe_restart("muffleWarning")
     .     }
     .     local_call_step(dots = dots, .index = i, .fn = "mutate")
     .     warn(c(cnd_bullet_header(), i = cnd_bullet_column_info(), 
     .         i = conditionMessage(w), i = cnd_bullet_cur_group_label(what = "warning")))
     .     maybe_restart("muffleWarning")
     . })

    7. mask$eval_all_mutate(quo)

    8. if_else(ppltrst > 5, "Over 5", ppltrst)

    9. replace_with(out, !condition, false, fmt_args(~false), glue("length of {fmt_args(~condition)}"))

    10. check_type(val, x, name)

    11. glubort(header, "must be {friendly_type_of(template)}, not {friendly_type_of(x)}.")

    12. .abort(text)

    13. signal_abort(cnd)

    14. signalCondition(cnd)

    15. (function (e) 
      . {
      .     local_call_step(dots = dots, .index = i, .fn = "mutate", 
      .         .dot_data = inherits(e, "rlang_error_data_pronoun_not_found"))
      .     call_step_envir <- peek_call_step()
      .     error_name <- call_step_envir$error_name
      .     error_expression <- call_step_envir$error_expression
      .     show_group_details <- TRUE
      .     if (inherits(e, "dplyr:::mutate_incompatible_size")) {
      .         size <- vec_size(rows[[mask$get_current_group()]])
      .         x_size <- e$x_size
      .         bullets <- c(i = cnd_bullet_column_info(), i = glue("`{error_name}` must be size {or_1(size)}, not {x_size}."), 
      .             i = cnd_bullet_rowwise_unlist())
      .     }
      .     else if (inherits(e, "dplyr:::mutate_mixed_null")) {
      .         show_group_details <- FALSE
      .         bullets <- c(i = cnd_bullet_column_info(), x = glue("`{error_name}` must return compatible vectors across groups."), 
      .             i = "Cannot combine NULL and non NULL results.", 
      .             i = cnd_bullet_rowwise_unlist())
      .     }
      .     else if (inherits(e, "dplyr:::mutate_not_vector")) {
      .         bullets <- c(i = cnd_bullet_column_info(), x = glue("`{error_name}` must be a vector, not {friendly_type_of(e$result)}."), 
      .             i = cnd_bullet_rowwise_unlist())
      .     }
      .     else if (inherits(e, "dplyr:::error_mutate_incompatible_combine")) {
      .         show_group_details <- FALSE
      .         bullets <- c(i = cnd_bullet_column_info(), x = glue("`{error_name}` must return compatible vectors across groups"), 
      .             i = cnd_bullet_combine_details(e$parent$x, e$parent$x_arg), 
      .             i = cnd_bullet_combine_details(e$parent$y, e$parent$y_arg))
      .     }
      .     else {
      .         bullets <- c(i = cnd_bullet_column_info(), x = conditionMessage(e))
      .     }
      .     bullets <- c(cnd_bullet_header(), bullets, i = if (show_group_details) cnd_bullet_cur_group_label())
      .     abort(bullets, class = c("dplyr:::mutate_error", "dplyr_error"), 
      .         error_name = error_name, error_expression = error_expression, 
      .         parent = e, bullets = bullets)
      . })(structure(list(message = "`false` must be a character vector, not a double vector.", 
      .     trace = structure(list(calls = list(IRkernel::main(), kernel$run(), 
      .         IRkernel:::handle_shell(), executor$execute(msg), base::tryCatch(evaluate(request$content$code, 
      .             envir = .GlobalEnv, output_handler = oh, stop_on_error = 1L), 
      .             interrupt = function(cond) {
      .                 log_debug("Interrupt during execution")
      .                 interrupted <<- TRUE
      .             }, error = .self$handle_error), base:::tryCatchList(expr, 
      .             classes, parentenv, handlers), base:::tryCatchOne(tryCatchList(expr, 
      .             names[-nh], parentenv, handlers[-nh]), names[nh], 
      .             parentenv, handlers[[nh]]), base:::doTryCatch(return(expr), 
      .             name, parentenv, handler), base:::tryCatchList(expr, 
      .             names[-nh], parentenv, handlers[-nh]), base:::tryCatchOne(expr, 
      .             names, parentenv, handlers[[1L]]), base:::doTryCatch(return(expr), 
      .             name, parentenv, handler), evaluate::evaluate(request$content$code, 
      .             envir = .GlobalEnv, output_handler = oh, stop_on_error = 1L), 
      .         evaluate:::evaluate_call(expr, parsed$src[[i]], envir = envir, 
      .             enclos = enclos, debug = debug, last = i == length(out), 
      .             use_try = stop_on_error != 2L, keep_warning = keep_warning, 
      .             keep_message = keep_message, output_handler = output_handler, 
      .             include_timing = include_timing), evaluate:::timing_fn(handle(ev <- withCallingHandlers(withVisible(eval(expr, 
      .             envir, enclos)), warning = wHandler, error = eHandler, 
      .             message = mHandler))), evaluate:::handle(ev <- withCallingHandlers(withVisible(eval(expr, 
      .             envir, enclos)), warning = wHandler, error = eHandler, 
      .             message = mHandler)), base::try(f, silent = TRUE), 
      .         base::tryCatch(expr, error = function(e) {
      .             call <- conditionCall(e)
      .             if (!is.null(call)) {
      .                 if (identical(call[[1L]], quote(doTryCatch))) 
      .                   call <- sys.call(-4L)
      .                 dcall <- deparse(call)[1L]
      .                 prefix <- paste("Error in", dcall, ": ")
      .                 LONG <- 75L
      .                 sm <- strsplit(conditionMessage(e), "\n")[[1L]]
      .                 w <- 14L + nchar(dcall, type = "w") + nchar(sm[1L], 
      .                   type = "w")
      .                 if (is.na(w)) 
      .                   w <- 14L + nchar(dcall, type = "b") + nchar(sm[1L], 
      .                     type = "b")
      .                 if (w > LONG) 
      .                   prefix <- paste0(prefix, "\n  ")
      .             }
      .             else prefix <- "Error : "
      .             msg <- paste0(prefix, conditionMessage(e), "\n")
      .             .Internal(seterrmessage(msg[1L]))
      .             if (!silent && isTRUE(getOption("show.error.messages"))) {
      .                 cat(msg, file = outFile)
      .                 .Internal(printDeferredWarnings())
      .             }
      .             invisible(structure(msg, class = "try-error", condition = e))
      .         }), base:::tryCatchList(expr, classes, parentenv, handlers), 
      .         base:::tryCatchOne(expr, names, parentenv, handlers[[1L]]), 
      .         base:::doTryCatch(return(expr), name, parentenv, handler), 
      .         base::withCallingHandlers(withVisible(eval(expr, envir, 
      .             enclos)), warning = wHandler, error = eHandler, message = mHandler), 
      .         base::withVisible(eval(expr, envir, enclos)), base::eval(expr, 
      .             envir, enclos), base::eval(expr, envir, enclos), 
      .         ess18 %>% mutate(ppltrst_n = if_else(ppltrst > 5, "Over 5", 
      .             ppltrst)) %>% select(idno, ppltrst, ppltrst_n), dplyr::select(., 
      .             idno, ppltrst, ppltrst_n), dplyr::mutate(., ppltrst_n = if_else(ppltrst > 
      .             5, "Over 5", ppltrst)), dplyr:::mutate.data.frame(., 
      .             ppltrst_n = if_else(ppltrst > 5, "Over 5", ppltrst)), 
      .         dplyr:::mutate_cols(.data, ..., caller_env = caller_env()), 
      .         base::withCallingHandlers({
      .             for (i in seq_along(dots)) {
      .                 mask$across_cache_reset()
      .                 context_poke("column", old_current_column)
      .                 quosures <- expand_across(dots[[i]])
      .                 quosures_results <- vector(mode = "list", length = length(quosures))
      .                 for (k in seq_along(quosures)) {
      .                   quo <- quosures[[k]]
      .                   quo_data <- attr(quo, "dplyr:::data")
      .                   if (!is.null(quo_data$column)) {
      .                     context_poke("column", quo_data$column)
      .                   }
      .                   chunks <- NULL
      .                   result <- NULL
      .                   if (quo_is_symbol(quo)) {
      .                     name <- as_string(quo_get_expr(quo))
      .                     if (name %in% names(new_columns)) {
      .                       result <- new_columns[[name]]
      .                       chunks <- mask$resolve(name)
      .                     }
      .                     else if (name %in% names(.data)) {
      .                       result <- .data[[name]]
      .                       chunks <- mask$resolve(name)
      .                     }
      .                     if (inherits(.data, "rowwise_df") && vec_is_list(result)) {
      .                       sizes <- list_sizes(result)
      .                       wrong <- which(sizes != 1)
      .                       if (length(wrong)) {
      .                         group <- wrong[1L]
      .                         mask$set_current_group(group)
      .                         abort(x_size = sizes[group], class = "dplyr:::mutate_incompatible_size")
      .                       }
      .                     }
      .                   }
      .                   if (is.null(chunks)) {
      .                     chunks <- mask$eval_all_mutate(quo)
      .                   }
      .                   if (is.null(chunks)) {
      .                     next
      .                   }
      .                   if (is.null(result)) {
      .                     if (length(rows) == 1) {
      .                       result <- chunks[[1]]
      .                     }
      .                     else {
      .                       result <- withCallingHandlers(vec_unchop(chunks <- vec_cast_common(!!!chunks), 
      .                         rows), vctrs_error_incompatible_type = function(cnd) {
      .                         abort(class = "dplyr:::error_mutate_incompatible_combine", 
      .                           parent = cnd)
      .                       })
      .                     }
      .                   }
      .                   quosures_results[[k]] <- list(result = result, 
      .                     chunks = chunks)
      .                 }
      .                 for (k in seq_along(quosures)) {
      .                   quo <- quosures[[k]]
      .                   quo_data <- attr(quo, "dplyr:::data")
      .                   quo_result <- quosures_results[[k]]
      .                   if (is.null(quo_result)) {
      .                     if (quo_data$is_named) {
      .                       name <- quo_data$name_given
      .                       new_columns[[name]] <- zap()
      .                       mask$remove(name)
      .                     }
      .                     next
      .                   }
      .                   result <- quo_result$result
      .                   chunks <- quo_result$chunks
      .                   if (!quo_data$is_named && is.data.frame(result)) {
      .                     new_columns[names(result)] <- result
      .                     mask$add_many(result, chunks)
      .                   }
      .                   else {
      .                     name <- quo_data$name_auto
      .                     new_columns[[name]] <- result
      .                     mask$add_one(name, chunks)
      .                   }
      .                 }
      .             }
      .         }, error = function(e) {
      .             local_call_step(dots = dots, .index = i, .fn = "mutate", 
      .                 .dot_data = inherits(e, "rlang_error_data_pronoun_not_found"))
      .             call_step_envir <- peek_call_step()
      .             error_name <- call_step_envir$error_name
      .             error_expression <- call_step_envir$error_expression
      .             show_group_details <- TRUE
      .             if (inherits(e, "dplyr:::mutate_incompatible_size")) {
      .                 size <- vec_size(rows[[mask$get_current_group()]])
      .                 x_size <- e$x_size
      .                 bullets <- c(i = cnd_bullet_column_info(), i = glue("`{error_name}` must be size {or_1(size)}, not {x_size}."), 
      .                   i = cnd_bullet_rowwise_unlist())
      .             }
      .             else if (inherits(e, "dplyr:::mutate_mixed_null")) {
      .                 show_group_details <- FALSE
      .                 bullets <- c(i = cnd_bullet_column_info(), x = glue("`{error_name}` must return compatible vectors across groups."), 
      .                   i = "Cannot combine NULL and non NULL results.", 
      .                   i = cnd_bullet_rowwise_unlist())
      .             }
      .             else if (inherits(e, "dplyr:::mutate_not_vector")) {
      .                 bullets <- c(i = cnd_bullet_column_info(), x = glue("`{error_name}` must be a vector, not {friendly_type_of(e$result)}."), 
      .                   i = cnd_bullet_rowwise_unlist())
      .             }
      .             else if (inherits(e, "dplyr:::error_mutate_incompatible_combine")) {
      .                 show_group_details <- FALSE
      .                 bullets <- c(i = cnd_bullet_column_info(), x = glue("`{error_name}` must return compatible vectors across groups"), 
      .                   i = cnd_bullet_combine_details(e$parent$x, 
      .                     e$parent$x_arg), i = cnd_bullet_combine_details(e$parent$y, 
      .                     e$parent$y_arg))
      .             }
      .             else {
      .                 bullets <- c(i = cnd_bullet_column_info(), x = conditionMessage(e))
      .             }
      .             bullets <- c(cnd_bullet_header(), bullets, i = if (show_group_details) cnd_bullet_cur_group_label())
      .             abort(bullets, class = c("dplyr:::mutate_error", 
      .                 "dplyr_error"), error_name = error_name, error_expression = error_expression, 
      .                 parent = e, bullets = bullets)
      .         }, warning = function(w) {
      .             if (check_muffled_warning(w)) {
      .                 maybe_restart("muffleWarning")
      .             }
      .             local_call_step(dots = dots, .index = i, .fn = "mutate")
      .             warn(c(cnd_bullet_header(), i = cnd_bullet_column_info(), 
      .                 i = conditionMessage(w), i = cnd_bullet_cur_group_label(what = "warning")))
      .             maybe_restart("muffleWarning")
      .         }), mask$eval_all_mutate(quo), dplyr::if_else(ppltrst > 
      .             5, "Over 5", ppltrst), dplyr:::replace_with(out, 
      .             !condition, false, fmt_args(~false), glue("length of {fmt_args(~condition)}")), 
      .         dplyr:::check_type(val, x, name), dplyr:::glubort(header, 
      .             "must be {friendly_type_of(template)}, not {friendly_type_of(x)}.")), 
      .         parents = c(0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 6L, 9L, 10L, 
      .         4L, 12L, 13L, 13L, 15L, 16L, 17L, 18L, 19L, 13L, 13L, 
      .         13L, 23L, 0L, 0L, 0L, 0L, 28L, 29L, 29L, 0L, 32L, 33L, 
      .         34L), indices = 1:35), class = "rlang_trace", version = 1L), 
      .     parent = NULL), class = c("rlang_error", "error", "condition"
      . )))

    16. abort(bullets, class = c("dplyr:::mutate_error", "dplyr_error"), 
      .     error_name = error_name, error_expression = error_expression, 
      .     parent = e, bullets = bullets)

    17. signal_abort(cnd)


#### `case_when`

`case_when()` bruges til at rekode baseret på flere logiske udtryk. For hvert udtryk bruges `~` efterfulgt af en værdi for at angive, hvilken værdi observationerne, der opfylder kriteriet, skal have. Hvert logisk udtryk adskilles med komma:

```R
nyvar = case_when(
    betingelse1 ~ "kategori 1",
    betingelse2 ~ "kategori 2",
    betingelse3 ~ "kategori 3"
    )
```

Herunder dannes en kategorisering af selvangivet arbejdstid om ugen (`wkhtot`), hvor respondenter inddeles efter, hvorvidt de arbejder mindre end 37 timer, 37 timer eller mere end 37 timer om ugen:


```R
ess18n <- ess18 %>%
    mutate(wkhtot_cat = case_when(
        wkhtot == 37 ~ "37 timer om ugen",
        wkhtot < 37 ~ "Mindre end 37 timer",
        wkhtot > 37 ~ "Mere end 37 timer")
          ) %>%
    select(idno, wkhtot, wkhtot_cat)

head(ess18n)
```


{{< rawhtml >}}
<table class="dataframe">
<caption>A tibble: 6 × 3</caption>
<thead>
	<tr><th scope=col>idno</th><th scope=col>wkhtot</th><th scope=col>wkhtot_cat</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td> 5816</td><td>37</td><td>37 timer om ugen   </td></tr>
	<tr><td> 7251</td><td>34</td><td>Mindre end 37 timer</td></tr>
	<tr><td> 7887</td><td>39</td><td>Mere end 37 timer  </td></tr>
	<tr><td> 9607</td><td>34</td><td>Mindre end 37 timer</td></tr>
	<tr><td>11688</td><td>37</td><td>37 timer om ugen   </td></tr>
	<tr><td>12355</td><td>37</td><td>37 timer om ugen   </td></tr>
</tbody>
</table>
{{< /rawhtml >}}



## Visualisering i R med `ggplot2`

R (more specifically `ggplot2`) is praised for its visualization capabilities. `ggplot2` allows for a high degree of customization and is incredibly versatile in terms of the kinds of visualization possible.

Cheatsheet: https://raw.githubusercontent.com/rstudio/cheatsheets/master/data-visualization-2.1.pdf

Below is shown how to create a scatterplot with `ggplot2`:


```R
library(ggplot2)
options(repr.plot.width=14, repr.plot.height=10)

ess18_filt <- ess18 %>%
    filter(grspnum < 200000)

ggplot(data = ess18_filt, aes(x = yrbrn, y = grspnum)) + 
    geom_point()
```


    
![png](output_53_0.png)
    


## Structure of a ggplot

As a rule, a ggplot follows this template:

```
ggplot(data = <DATA>, mapping = aes(<MAPPINGS>)) + 
  <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))
```

- **ggplot**: Main function. This functino denotes what should be included in the plot. The function `ggplot` does not in itself contain information about the type of plot. This is specified via a geom funkcion.
    - *data*: The primary argument for ggplot is the data to be plotted. A data frame is expected


- **mapping**: Argument. Here the information is the data is "mapped" (aes: "aesthetics") to the plot. The primary mappings are `x` and `y`. Other mappings include `colour`, `fill`, `shape`, `size`. Mappings are always specified as `aes(MAPPINGS)` (fx `aes(x = 'eduyrs', y = 'grspnum')`). Mappings can both be specified as an argument for the main ggplot function or for the specific geom functinon. The difference is in whether the mapping applies to the whole plot or a specific geom layer.


- **GEOM_FUNCTION (fx geom_point)**: The plotting function. A "geom" is the geometric shape use to represent the data points (bars, lines, boxplots, points etc.). It is possible to have several geom function (several layers) in the same plot.
    - *mapping*: All geom functions in ggplot accept a mapping argument. However, not all aesthetics are compatible with all geoms. A histogram does fx not contain a mapping for y.

### Combining information with multiple aesthetics and layers

The grammar of `ggplot2` makes it relatively easy to combine a myriad information into a single plot (below is meant more as an illustrative example): 


```R
ggplot(data = ess18_filt, mapping = aes(x = eduyrs, y = grspnum)) +
  geom_point(mapping = aes(colour = gndr, shape = vote, size = netustm)) +
  geom_smooth(colour = 'lightgreen')
```

    `geom_smooth()` using method = 'loess' and formula 'y ~ x'
    
    Warning message:
    "Removed 1 rows containing non-finite values (stat_smooth)."
    Warning message:
    "Removed 34 rows containing missing values (geom_point)."
    


    
![png](output_56_1.png)
    


### Other plot types/geoms (histogram and boxplot)

Because the input for the plot is specified before the actual plot (geom) is chosen, it is easy to switch the plot out with something else.


```R
# histogram of monthly income

ggplot(data = ess18_filt, aes(x = grspnum)) + 
    geom_histogram()
```

    `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
    
    


    
![png](output_58_1.png)
    



```R
# boxplot of monthly income - only geom is changed

ggplot(data = ess18_filt, aes(x = grspnum)) + 
    geom_boxplot()
```


    
![png](output_59_0.png)
    


### Inspecting a linear correlation

Combining a scatterplot with a smoothed conditional means plot allows for a quick visualization of a possible linear correlation.

The `geom_smooth` geom accepts the argument `method = "lm"`. This fits a linear regression line on the data:


```R
ggplot(data = ess18_filt, aes(x = yrbrn, y = grspnum)) + 
    geom_point() + 
    geom_smooth(method = "lm")
```

    `geom_smooth()` using formula 'y ~ x'
    
    


    
![png](output_61_1.png)
    


By default the line is fitted with a 95% confidence interval for the line coloured in. This can be disabled with the `se` argument. The confidence level can be changed with the `level` argument.

## Customizing the plot

A ggplot can be customized in a wide variety of ways. Here the most simple changes and additions are covered.

### Labels

Labels can be added for each aesthetic used in the graph with the function `labs`:


```R
ggplot(data = ess18_filt, mapping = aes(x = eduyrs, y = grspnum, colour = gndr, size = netustm)) +
    geom_point() + 
    labs(x = 'Years of education', y = 'Usually monthly gross pay', colour = 'Gender', size = 'Time spent on internet per day')
```

    Warning message:
    "Removed 33 rows containing missing values (geom_point)."
    


    
![png](output_65_1.png)
    


## Title

A title can be added using either `ggtitle()` or with `labs()`.


```R
ggplot(data = ess18_filt, mapping = aes(x = eduyrs, y = grspnum, colour = gndr, size = netustm)) +
    geom_point() + 
    labs(x = 'Years of education', y = 'Usually monthly gross pay', colour = 'Gender', size = 'Time spent on internet per day') + 
     ggtitle('Education and Pay')
```

    Warning message:
    "Removed 33 rows containing missing values (geom_point)."
    


    
![png](output_67_1.png)
    



```R
ggplot(data = ess18_filt, mapping = aes(x = eduyrs, y = grspnum, colour = gndr, size = netustm)) +
    geom_point() + 
    labs(title = 'Education and Pay', x = 'Years of education', y = 'Usually monthly gross pay', colour = 'Gender', size = 'Time spent on internet per day')
```

    Warning message:
    "Removed 33 rows containing missing values (geom_point)."
    


    
![png](output_68_1.png)
    


## Legend

The legend uses values from the data. If one wants to change the legend for the plot, it can be done with the appropriate scale function:


```R
ggplot(data = ess18_filt, mapping = aes(x = eduyrs, y = grspnum, colour = gndr, size = netustm)) +
    geom_point() + 
    labs(title = 'Education and Pay', x = 'Years of education', y = 'Usually monthly gross pay', colour = 'Gender', size = 'Time spent on internet per day') + 
    scale_colour_discrete(labels = c('Kvinde', 'Mand'))
```

    Warning message:
    "Removed 33 rows containing missing values (geom_point)."
    


    
![png](output_70_1.png)
    


## Themes

ggplot contains a wide variety of standard themes (https://ggplot2.tidyverse.org/reference/index.html#section-themes). It is also possible to setup one's own theme. Below the `theme_minimal` is used:


```R
ggplot(data = ess18_filt, mapping = aes(x = eduyrs, y = grspnum, colour = gndr, size = netustm)) +
    geom_point() + 
    labs(title = 'Education and Pay', x = 'Years of education', y = 'Usually monthly gross pay', colour = 'Gender', size = 'Time spent on internet per day') + 
    scale_colour_discrete(labels = c('Kvinde', 'Mand')) + 
    theme_minimal()
```

    Warning message:
    "Removed 33 rows containing missing values (geom_point)."
    


    
![png](output_72_1.png)
    



```R

```
