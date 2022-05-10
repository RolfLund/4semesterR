```R
library(readr)
library(dplyr)

ess18 <- read_csv("https://github.com/RolfLund/4semesterR/raw/master/teaching-materials/r-intro/datasets/ESS2018DK_subset.csv")
```

    
    Vedh�fter pakke: 'dplyr'
    
    
    De f�lgende objekter er maskerede fra 'package:stats':
    
        filter, lag
    
    
    De f�lgende objekter er maskerede fra 'package:base':
    
        intersect, setdiff, setequal, union
    
    
    [1mRows: [22m[34m1285[39m [1mColumns: [22m[34m17[39m
    
    [36m--[39m [1mColumn specification[22m [36m------------------------------------------------------------------------------------------------[39m
    [1mDelimiter:[22m ","
    [31mchr[39m  (7): vote, prtvtddk, health, lvpntyr, tygrtr, gndr, edlvddk
    [32mdbl[39m (10): idno, netustm, ppltrst, yrbrn, eduyrs, wkhct, wkhtot, grspnum, frl...
    
    
    [36mi[39m Use [30m[47m[30m[47m`spec()`[47m[30m[49m[39m to retrieve the full column specification for this data.
    [36mi[39m Specify the column types or set [30m[47m[30m[47m`show_col_types = FALSE`[47m[30m[49m[39m to quiet this message.
    
    


```R
head(ess18)
```


<table class="dataframe">
<caption>A tibble: 6 � 17</caption>
<thead>
	<tr><th scope=col>idno</th><th scope=col>netustm</th><th scope=col>ppltrst</th><th scope=col>vote</th><th scope=col>prtvtddk</th><th scope=col>health</th><th scope=col>lvpntyr</th><th scope=col>tygrtr</th><th scope=col>gndr</th><th scope=col>yrbrn</th><th scope=col>edlvddk</th><th scope=col>eduyrs</th><th scope=col>wkhct</th><th scope=col>wkhtot</th><th scope=col>grspnum</th><th scope=col>frlgrsp</th><th scope=col>inwtm</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td> 5816</td><td> 90</td><td>7</td><td>Yes</td><td>SF Socialistisk Folkeparti - Socialist People's Party</td><td>Good    </td><td>1994</td><td>60</td><td>Male  </td><td>1974</td><td>Mellemlang videreg�ende uddannelse af 3-4 �rs varighed. Professionsbachelorer,</td><td>35</td><td>37</td><td>37</td><td>37000</td><td>35000</td><td>61</td></tr>
	<tr><td> 7251</td><td>300</td><td>5</td><td>Yes</td><td>Dansk Folkeparti - Danish People's Party             </td><td>Fair    </td><td>1993</td><td>40</td><td>Female</td><td>1975</td><td>Faglig uddannelse (h�ndv�rk, handel, landbrug mv.), F.eks. Fagl�rte, Social-  </td><td>13</td><td>32</td><td>34</td><td>22000</td><td>30000</td><td>68</td></tr>
	<tr><td> 7887</td><td>360</td><td>8</td><td>Yes</td><td>Socialdemokratiet - The Social democrats             </td><td>Fair    </td><td>1983</td><td>55</td><td>Male  </td><td>1958</td><td>Lang videreg�ende uddannelse. Kandidatuddannelser af 5.-6. �rs varighed, F.eks</td><td>25</td><td>39</td><td>39</td><td>36000</td><td>42000</td><td>89</td></tr>
	<tr><td> 9607</td><td>540</td><td>9</td><td>Yes</td><td>Alternativet - The Alternative                       </td><td>Good    </td><td>1982</td><td>64</td><td>Female</td><td>1964</td><td>Mellemlang videreg�ende uddannelse af 3-4 �rs varighed. Professionsbachelorer,</td><td>13</td><td>32</td><td>34</td><td>32000</td><td>   NA</td><td>50</td></tr>
	<tr><td>11688</td><td> NA</td><td>5</td><td>Yes</td><td>Socialdemokratiet - The Social democrats             </td><td>Very bad</td><td>1968</td><td>50</td><td>Female</td><td>1952</td><td>Faglig uddannelse (h�ndv�rk, handel, landbrug mv.), F.eks. Fagl�rte, Social-  </td><td> 2</td><td>37</td><td>37</td><td>   NA</td><td>   NA</td><td>77</td></tr>
	<tr><td>12355</td><td>120</td><td>5</td><td>Yes</td><td>Socialdemokratiet - The Social democrats             </td><td>Fair    </td><td>1987</td><td>60</td><td>Male  </td><td>1963</td><td>Faglig uddannelse (h�ndv�rk, handel, landbrug mv.), F.eks. Fagl�rte, Social-  </td><td>14</td><td>38</td><td>37</td><td>36000</td><td>38000</td><td>48</td></tr>
</tbody>
</table>



# Introduktion til R (del 3)

## Program
- Statistiske modeller i R
- Output af model
- Visualisering med `ggplot2`

## Statistiske modeller i R

Der er to dele i at f� resultaterne af en statistisk model frem i R:

1. Specific�r modellen (fx med en funktion som `lm()` for line�re modeller) 
2. F� koefficienter og resultater fra modellen (med brug af funktionen `summary()`) 

### Specific�r modellen

R indeholder flere funktioner til at lave statistiske modeller. Hvilken model der skal bruges, afh�nger af, hvilken type af statistisk model, som man skal lave.

Funktionen `lm()` bruges fx til at specificere en line�r model (line�re sammenh�nge - line�r og multipel line�r regression). Man specificerer en model ved at angive formlen for den sammenh�ng, som man vil modellere.

Formlen for en multipel line�r regression med tre uafh�ngige variable er fx:

$y = \beta_{0} + \beta_{1} x_{1} + \beta_{2}x_{2} + \beta_{3}x_{3}$

I R skrives denne formel som (l�g m�rke til at sk�ringspunktet med y-aksen ($\beta_{0}$) ikke skal skrives ind, da denne bestemmes af modellen):

`y ~ x1 + x2 + x3`

N�r man specificerer modellen i R, bruges variabelnavne/kolonnenavne fra data i formlen. Derudover specificeres det, hvilken dataframe, som variablerne tages fra.

I nedenst�ende specificeres en model med selvrapporteret m�nedsl�n (`grspnum`) som afh�ngig variabel og antal �rs uddannelse (`eduyrs`) og arbejdstimer om ugen (`wkhtot`) som uafh�ngige variable:


```R
grsp_model <- lm(grspnum ~ eduyrs + wkhtot, data = ess18)
```

### Resultater fra model

L�g m�rke til at man kun f�r begr�nsede resultater ved at blot at kalde modellen:


```R
grsp_model
```


    
    Call:
    lm(formula = grspnum ~ eduyrs + wkhtot, data = ess18)
    
    Coefficients:
    (Intercept)       eduyrs       wkhtot  
        -3668.7        891.1        888.4  
    


For at f� alle relevante resultater fra modellen (koefficienter, $R^2$, osv.) bruges funktionen `summary()`:


```R
summary(grsp_model)
```


    
    Call:
    lm(formula = grspnum ~ eduyrs + wkhtot, data = ess18)
    
    Residuals:
        Min      1Q  Median      3Q     Max 
     -64614  -16639  -10324   -1448 2955649 
    
    Coefficients:
                Estimate Std. Error t value Pr(>|t|)  
    (Intercept)  -3668.7    20645.3  -0.178   0.8590  
    eduyrs         891.1      856.4   1.041   0.2984  
    wkhtot         888.4      458.2   1.939   0.0529 .
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    
    Residual standard error: 121600 on 707 degrees of freedom
      (575 observations deleted due to missingness)
    Multiple R-squared:  0.007698,	Adjusted R-squared:  0.004891 
    F-statistic: 2.742 on 2 and 707 DF,  p-value: 0.06511
    


## Kategoriske variable (factors) i modeller

Som standard vil R behandle tekstvariable som *unordered factors*; alts� nominalt skalerede variable.

I nedenst�ende tilf�jes variablen `vote` (hvorvidt man stemte til sidste folketingsvalg) til modellen fra f�r. `vote` er ikke kodet til factor: 


```R
grsp_vote_model <- lm(grspnum ~ eduyrs + wkhtot + vote, data = ess18)
summary(grsp_vote_model)
```


    
    Call:
    lm(formula = grspnum ~ eduyrs + wkhtot + vote, data = ess18)
    
    Residuals:
        Min      1Q  Median      3Q     Max 
     -62657  -17091  -10043   -1996 2954310 
    
    Coefficients:
                             Estimate Std. Error t value Pr(>|t|)
    (Intercept)              -11421.9    29407.5  -0.388    0.698
    eduyrs                      796.2      867.1   0.918    0.359
    wkhtot                      788.2      481.1   1.638    0.102
    voteNot eligible to vote   2542.6    28612.8   0.089    0.929
    voteYes                   14414.7    23405.2   0.616    0.538
    
    Residual standard error: 121800 on 704 degrees of freedom
      (576 observations deleted due to missingness)
    Multiple R-squared:  0.0087,	Adjusted R-squared:  0.003068 
    F-statistic: 1.545 on 4 and 704 DF,  p-value: 0.1875
    


*N�r man ikke har defineret en kategorisk som en factor, tager R kategorien, der kommer f�rst alfabetisk, som referencekategori!*

Dette kan �ndres ved at definere variablen som factor og s�tte referencekategorien. Herunder s�ttes "Yes" som referencekategori ved brug af funktionen `relevel`. Derefter dannes modellen igen:


```R
ess18 <- ess18 %>%
    mutate(vote = as.factor(vote),
           vote = relevel(vote, ref = "Yes")
           )
```


```R
grsp_vote_model <- lm(grspnum ~ eduyrs + wkhtot + vote, data = ess18)
summary(grsp_vote_model)
```


    
    Call:
    lm(formula = grspnum ~ eduyrs + wkhtot + vote, data = ess18)
    
    Residuals:
        Min      1Q  Median      3Q     Max 
     -62657  -17091  -10043   -1996 2954310 
    
    Coefficients:
                             Estimate Std. Error t value Pr(>|t|)
    (Intercept)                2992.8    22232.6   0.135    0.893
    eduyrs                      796.2      867.1   0.918    0.359
    wkhtot                      788.2      481.1   1.638    0.102
    voteNo                   -14414.7    23405.2  -0.616    0.538
    voteNot eligible to vote -11872.2    18477.7  -0.643    0.521
    
    Residual standard error: 121800 on 704 degrees of freedom
      (576 observations deleted due to missingness)
    Multiple R-squared:  0.0087,	Adjusted R-squared:  0.003068 
    F-statistic: 1.545 on 4 and 704 DF,  p-value: 0.1875
    


## Output af model (med `stargazer`)

Outputtet i R konsollen af en model er ikke k�nt og egner sig d�rligt til at fremstille. Der findes dog en r�kke m�der at lave p�ne outputs af modeller fra R. En god pakke til dette er pakken `stargazer` (https://cran.r-project.org/web/packages/stargazer/stargazer.pdf).

`stargazer` kan tage forskellige R objekter (herunder modeller) og lave op til outputs, hvor de enkelte dele kan tilpasses. `stargazer` tillader bl.a. at eksportere output fra en model til en HTML fil. Indholdet af en HTML-fil kan kopieres direkte over i programmer som Microsoft Word.

For at danne en output-fil af en model med `stargazer` kr�ves som minimum: 
- En model (det objekt hvor modellen er gemt - ikke outputtet af `summary()`)
- Bestemme filtype (`stargazer` kan danne forskellige filtyper, som kan styres med argumentet `type`. `type = "HTML"` danner et HTML-output)
- Angive filnavn, som outputtet skal gemmes til (dette g�res med argumentet `out = <filnavn>`)

**OBS! Output-filer fra `stargazer` gemmes i din arbejdssti**

`stargazer` gemmer filen i den nuv�rende arbejdssti (se sektion om [filstier](https://rolflund.github.io/4semesterR/pakker-og-rstudio/stier/)). Tjek evt. den nuv�rende arbejdssti med `getwd()`, inden du bruger `stargazer`.

### Eksempel p� brug af `stargazer`

Herunder dannes output af en af ovenst�ende model med `stargazer()`:

```R
stargazer(grsp_model, type = "html", out = "grsp_model.html")
```

Outputtet ser ud som nedenst�ende, n�r �bnet i et andet program:

{{< rawhtml >}}
<table style="text-align:center"><tr><td colspan="2" style="border-bottom: 1px solid black"></td></tr><tr><td style="text-align:left"></td><td><em>Dependent variable:</em></td></tr>
<tr><td></td><td colspan="1" style="border-bottom: 1px solid black"></td></tr>
<tr><td style="text-align:left"></td><td>grspnum</td></tr>
<tr><td colspan="2" style="border-bottom: 1px solid black"></td></tr><tr><td style="text-align:left">eduyrs</td><td>891.145</td></tr>
<tr><td style="text-align:left"></td><td>(856.409)</td></tr>
<tr><td style="text-align:left"></td><td></td></tr>
<tr><td style="text-align:left">wkhtot</td><td>888.389<sup>*</sup></td></tr>
<tr><td style="text-align:left"></td><td>(458.219)</td></tr>
<tr><td style="text-align:left"></td><td></td></tr>
<tr><td style="text-align:left">Constant</td><td>-3,668.748</td></tr>
<tr><td style="text-align:left"></td><td>(20,645.310)</td></tr>
<tr><td style="text-align:left"></td><td></td></tr>
<tr><td colspan="2" style="border-bottom: 1px solid black"></td></tr><tr><td style="text-align:left">Observations</td><td>710</td></tr>
<tr><td style="text-align:left">R<sup>2</sup></td><td>0.008</td></tr>
<tr><td style="text-align:left">Adjusted R<sup>2</sup></td><td>0.005</td></tr>
<tr><td style="text-align:left">Residual Std. Error</td><td>121,581.200 (df = 707)</td></tr>
<tr><td style="text-align:left">F Statistic</td><td>2.742<sup>*</sup> (df = 2; 707)</td></tr>
<tr><td colspan="2" style="border-bottom: 1px solid black"></td></tr><tr><td style="text-align:left"><em>Note:</em></td><td style="text-align:right"><sup>*</sup>p<0.1; <sup>**</sup>p<0.05; <sup>***</sup>p<0.01</td></tr>
</table>
{{< /rawhtml >}}


**Tilpasning af output**

Outputtet kan tilpasses p� mange m�der. Herunder ses blot nogen af eksemplerne:

```R
stargazer(grsp_model, type = "html",
          title = "Effekt af �rs uddannelse og arbejdstid p� l�n",
          covariate.labels = c("�rs uddannelse", "Arbejdstimer om ugen"),
          dep.var.labels.include = FALSE, dep.var.caption = "Model 1", star.cutoffs = c(0.05, 0.01, 0.001),
          out = "grsp_model.html")
```

{{< rawhtml >}}

<table style="text-align:center"><caption><strong>Effekt af �rs uddannelse og arbejdstid p� l�n</strong></caption>
<tr><td colspan="2" style="border-bottom: 1px solid black"></td></tr><tr><td style="text-align:left"></td><td>Model 1</td></tr>
<tr><td></td><td colspan="1" style="border-bottom: 1px solid black"></td></tr>
<tr><td colspan="2" style="border-bottom: 1px solid black"></td></tr><tr><td style="text-align:left">�rs uddannelse</td><td>891.145</td></tr>
<tr><td style="text-align:left"></td><td>(856.409)</td></tr>
<tr><td style="text-align:left"></td><td></td></tr>
<tr><td style="text-align:left">Arbejdstimer om ugen</td><td>888.389</td></tr>
<tr><td style="text-align:left"></td><td>(458.219)</td></tr>
<tr><td style="text-align:left"></td><td></td></tr>
<tr><td style="text-align:left">Constant</td><td>-3,668.748</td></tr>
<tr><td style="text-align:left"></td><td>(20,645.310)</td></tr>
<tr><td style="text-align:left"></td><td></td></tr>
<tr><td colspan="2" style="border-bottom: 1px solid black"></td></tr><tr><td style="text-align:left">Observations</td><td>710</td></tr>
<tr><td style="text-align:left">R<sup>2</sup></td><td>0.008</td></tr>
<tr><td style="text-align:left">Adjusted R<sup>2</sup></td><td>0.005</td></tr>
<tr><td style="text-align:left">Residual Std. Error</td><td>121,581.200 (df = 707)</td></tr>
<tr><td style="text-align:left">F Statistic</td><td>2.742 (df = 2; 707)</td></tr>
<tr><td colspan="2" style="border-bottom: 1px solid black"></td></tr><tr><td style="text-align:left"><em>Note:</em></td><td style="text-align:right"><sup>*</sup>p<0.05; <sup>**</sup>p<0.01; <sup>***</sup>p<0.001</td></tr>
</table>

{{< /rawhtml >}}
