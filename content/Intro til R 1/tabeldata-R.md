---
title: "Tabeldata i R"
date: 2021-12-20T08:08:52+01:00
draft: false
weight: 4
---

## Indlæsning af data med `readr` (tidyverse)

`readr` er en pakke til at indlæse forskellige datafiler i R.

R har også basisfunktioner til dette, men `readr` er mere effektiv.

`readr` er del af pakkesamlingen `tidyverse`: https://www.tidyverse.org/

I koden herunder indlæser vi data ind fra en csv-fil og gemmer i objektet `ess18`:


```R
library(readr)

ess18 <- read_csv("https://github.com/RolfLund/4semesterR/raw/master/teaching-materials/r-intro/datasets/ESS2018DK_subset.csv")
```



### Indlæsning med peg og klik

Data kan også indlæses med peg-og-klik under "File"->"Import dataset". Her hjælper RStudio med importen af data:

![impdat](/impdat.png)



## Tabeldata i R: Data Frames

`ess18` er nu et objekt, der indeholder et datasæt. Bemærk at måden vi danner objektet ikke er anderledes end andre måder, som vi har dannet objekter: `objectname <- somefunction(something)`.

`ess18` er en "data frame". En "data frame" er måden R lagrer tabeldata (data struktureret i rækker og kolonner).

### Data brugt i undervisningen: European Social Survey 2018

Til R introduktionerne bruger vi et udsnit af European Social Survey fra 2018 (https://www.europeansocialsurvey.org/). Data indeholder kun den danske del af data, nogle udvalgte variable samt nogle få filtreringer.

- Kodebog kan findes her: https://www.europeansocialsurvey.org/docs/round9/survey/ESS9_appendix_a7_e03_1.pdf
- Spørgeskeamet brugt i undersøgelsen kan findes her: https://www.europeansocialsurvey.org/docs/round9/fieldwork/source/ESS9_source_questionnaires.pdf

Datasættet indeholder følgende variable:

| variabel | beskrivelse                                                  |
| -------- | ------------------------------------------------------------ |
| idno     | Respondent's identification number                           |
| netustm  | Internet use, how much time on typical day, in minutes       |
| ppltrst  | Most people can be trusted or you can't be too careful       |
| vote     | Voted last national election                                 |
| prtvtddk | Party voted for in last national election, Denmark           |
| health   | Subjective general health                                    |
| lvpntyr  | Year first left parents for living separately for 2 months or more |
| tygrtr   | Retire permanently, age too young. SPLIT BALLOT              |
| gndr     | Gender                                                       |
| yrbrn    | Year of birth                                                |
| edlvddk  | Highest level of education, Denmark                          |
| eduyrs   | Years of full-time education completed                       |
| wkhct    | Total contracted hours per week in main job overtime excluded |
| wkhtot   | Total hours normally worked per week in main job overtime included |
| grspnum  | What is your usual [weekly/monthly/annual] gross pay         |
| frlgrsp  | Fair level of [weekly/monthly/annual] gross pay for you      |
| inwtm    | Interview length in minutes, main questionnaire              |


## Udforskning af data frames
For at få et overblik over data, kan man bruge funktionen `head()`:


```R
head(ess18)
```

{{< rawhtml >}}
<table class="dataframe">
<caption>A tibble: 6 × 17</caption>
<thead>
	<tr><th scope=col>idno</th><th scope=col>netustm</th><th scope=col>ppltrst</th><th scope=col>vote</th><th scope=col>prtvtddk</th><th scope=col>health</th><th scope=col>lvpntyr</th><th scope=col>tygrtr</th><th scope=col>gndr</th><th scope=col>yrbrn</th><th scope=col>edlvddk</th><th scope=col>eduyrs</th><th scope=col>wkhct</th><th scope=col>wkhtot</th><th scope=col>grspnum</th><th scope=col>frlgrsp</th><th scope=col>inwtm</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
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


`head()` viser de første seks rækker af data, og er god til at tjekke, om data ser ud, som det skal.

Vi kan tjekke kolonnenavnene (variabelnavnene) med `colnames`. `dim` returnerer antallet af rækker og kolonner/variable.


```R
colnames(ess18)
```

{{< rawhtml >}}
<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>'idno'</li><li>'netustm'</li><li>'ppltrst'</li><li>'vote'</li><li>'prtvtddk'</li><li>'health'</li><li>'lvpntyr'</li><li>'tygrtr'</li><li>'gndr'</li><li>'yrbrn'</li><li>'edlvddk'</li><li>'eduyrs'</li><li>'wkhct'</li><li>'wkhtot'</li><li>'grspnum'</li><li>'frlgrsp'</li><li>'inwtm'</li></ol>
{{< /rawhtml >}}



```R
dim(ess18)
```

{{< rawhtml >}}
<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>1285</li><li>17</li></ol>
{{< /rawhtml >}}


`summary()` bruges til at se deskriptive mål for variable i data (antal, middelværdi, standardafvigelse, minimum, maksimum, kvartiler).


```R
summary(ess18)
```


          idno           netustm          ppltrst          vote          
     Min.   :  5816   Min.   :   0.0   Min.   : 0.00   Length:1285       
     1st Qu.: 93707   1st Qu.:  90.0   1st Qu.: 6.00   Class :character  
     Median :112877   Median : 150.0   Median : 7.00   Mode  :character  
     Mean   :110980   Mean   : 227.4   Mean   : 7.08                     
     3rd Qu.:131072   3rd Qu.: 300.0   3rd Qu.: 8.00                     
     Max.   :150446   Max.   :1020.0   Max.   :10.00                     
                      NA's   :151      NA's   :3                         
     
     	prtvtddk            health            lvpntyr             tygrtr         
     Length:1285        Length:1285        Length:1285        Length:1285       
     Class :character   Class :character   Class :character   Class :character  
     Mode  :character   Mode  :character   Mode  :character   Mode  :character  
     
     	gndr               yrbrn        edlvddk              eduyrs  
     Length:1285        Min.   :1929   Length:1285        Min.   : 0  
     Class :character   1st Qu.:1952   Class :character   1st Qu.:11  
     Mode  :character   Median :1966   Mode  :character   Median :14  
    					Mean   :1967                      Mean   :14  
     					3rd Qu.:1982                      3rd Qu.:17  
     					Max.   :2003                      Max.   :40  
                                                          NA's   :7   
    
             wkhct           wkhtot         grspnum           frlgrsp      
     Min.   : 0.00   Min.   : 0.00   Min.   :      0   Min.   :     0  
     1st Qu.:35.00   1st Qu.:35.00   1st Qu.:  26000   1st Qu.: 28375  
     Median :37.00   Median :37.00   Median :  32000   Median : 35000  
     Mean   :33.81   Mean   :36.44   Mean   :  43686   Mean   : 37255  
     3rd Qu.:37.00   3rd Qu.:41.00   3rd Qu.:  41000   3rd Qu.: 40000  
     Max.   :80.00   Max.   :90.00   Max.   :3000000   Max.   :500000  
     NA's   :68      NA's   :27      NA's   :570       NA's   :1033    
    
    	inwtm       
     Min.   : 18.00  
     1st Qu.: 51.00  
     Median : 59.00  
     Mean   : 63.32  
     3rd Qu.: 70.00  
     Max.   :613.00  
     NA's   :5       

​    
