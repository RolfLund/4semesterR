# Introduktion til R (del 1)

*4. semester sociologi, 2022*

## Hvad er R?

R er et gratis analyseprogram med sit eget kommandosprog.

Programmet egner sig is�r til kvantiative analyser og visualiseringer af kvantitative data.

R kan arbejde med mange forskellige dataformater. Da programmet er "open source", findes ufattelig mange udvidelser til programmet, der tilf�jer funktioner.

## Dagens program

- RStudio milj�et
- At arbejde med R
- Objekter i R 
- Funktioner i R
- Indl�sning af funktioner fra andre pakker
- Introduktion til tabeldata (dataframes)
- Udforskning af tabeldata i R
- Simpel datah�ndtering i R: Subsetting, nye variable og rekodning

## Undervisningsformat

I disse introduktioner vil vi variere mellem pr�sentation, demonstration og �velser. I opfordres til at skrive med, som vi arbejder med R i lektionerne.

- Hj�lp hinanden
- Sig til hvis I sidder fast
- Vi kommer rundt og hj�lper undervejs

## RStudio

R i sig selv er meget begr�nset. RStudio tilf�jer en brugerflade ovenp� R, der g�r det rarere at arbejde med. 

Man arbejder typisk i RStudio, n�r man bruger R.

## At arbejde med R

R har sit eget kodesprog. R fungerer ved at man skriver kommandoer i R sproget, som R derefter "fortolker". 

R (og RStudio) har en meget begr�nset brugerflade. Det betyder, at n�sten alt vi vil i R (statistik, visualisering osv.), skal ske ved at skrive koder i R sproget.

### R som lommeregner
Hvad menes med at R "fortolker" kode?

"Fortolkning" i R er blot et sp�rgsm�l om R forst�r, hvad du fors�ger at g�re. Man f�r R til at g�re ting ved at skrive kommandoer. Hvis R forst�r det, g�r R den ting. Hvis R ikke forst�r det, f�r man en fejl.

R kan fx forst� matematiske operationer:


```R
7 * 6
```


42



```R
912 - 132
```


780


R kan dog ikke forst� tilf�ldige kommandoer:


```R
lav min eksamensopgave
```


    Error in parse(text = x, srcfile = src): <text>:1:5: uventet symbol
    1: lav min
            ^
    Traceback:
    


## Brug af R scripts

Script filer er tekst filer med kode, som R kan forst�/fortolke.

En script-fil kan forst�s som en "analyseopskrift", der indeholder alle kommandoer n�dvendige for at foretage en analyse. Det tillader ogs�, at man nemt kan k�re kommandoer igen.

Man b�r altid skrive de kommandoer, som man bruger, ind i et script. Brug derfor kun konsolvinduet til at finde frem til den rigtige kommando.

- `#` kan bruges til kommentarer (ignoreres n�r man k�rer koden)
- `Ctrl` + `Enter` (Windows), `Command` + `Enter` (Mac): K�rer aktuel linje eller selektion

***BEM�RK!*** Der er ingen fortryd-knap i R! N�r koden er k�rt, er �ndringen sket. Den eneste m�de at "fortryde" er ved at genskabe det, som man har lavet, ved at k�re tidligere kode igen. Netop derfor er scripts vigtige.

## R Sproget: Objekter og funktioner

R fungerer ved at lagre v�rdier og information i "objekter". Disse objekter kan derefter bruges i forskellige funktioner. Funktioner kan v�re alt fra at udregne et gennemsnit, lave en figur, gemme et datas�t osv. 

Forsimplet sagt: Et objekt er en eller anden lagret information, mens en funktion er noget, som kan bearbejde eller g�re noget ved informationen i et objekt.

### Objekter

At arbejde med R involverer kontinuerligt at definere objekter. Objekter er blot et navn til at kalde lagret information frem igen.

Objekter kan v�re mange ting: 
- et ord
- et tal
- en talr�kke
- et datas�t
- en matematisk formel
- et resultat
- en filsti
- en graf
- og s� videre...

N�r et objekt er defineret, er det tilg�ngeligt i det aktuelle arbejdsmilj� (dvs.: tilg�ngeligt indtil vi starter en ny R session eller fjerner det igen).

Der er ingen gr�nser for m�ngden af objekter, som vi kan danne. Dette tillader at vi kan arbejde med meget forskellig information samtidig.

### Defin�r objekter

Objekter dannes ved brug af `<-` (`Alt` + `-`):


```R
year <- 1964
```


```R
year
```


1964


Hvis objektet indeholder et tal, kan R arbejde med det som ethvert andet tal.


```R
year + 10
```


1974


Bem�rk at R behandler store og sm� bogstaver som forskellige:


```R
Year # Findes ikke
```


    Error in eval(expr, envir, enclos): objekt 'Year' blev ikke fundet
    Traceback:
    


N�r man bruger `' '` eller`" "` fort�ller man R, at inputtet skal behandles som tekst. *Dette g�lder ogs� tal!*


```R
name <-  "keenan"
```


```R
name
```


'keenan'



```R
year_now  <- '2021'
```


```R
year_now
```


'2021'


Bem�rk at tal lagret som tekst ogs� har citationstegn om sig. Tal lagret som tekst kan ikke bruges som tal:


```R
year_now - 5
```


    Error in year_now - 5: non-numeric argument to binary operator
    Traceback:
    


Ovenst�ende fejl sker fordi R adskiller mellem forskellige objekter ved at tildele dem en *class*. Objektets *class* bestemmer kort sagt, hvad der er muligt med objektet.

### Navngivning af objekter
Objekter kan hedde n�sten hvad som helst. En god tommelfingerregel er at bruge navne, der indikerer, hvad objektet indeholder.

#### Restriktioner ved navngivning
- De fleste specialtegn kan ikke bruges: `/`, `?`, `*`, `+` (mange af disse betyder noget i R)
- Allerede eksisterende navne i R (overskriver den/det eksisterende funktion/objektet)

#### Tips til navngivning 
- Brug '`_`': `my_object`, `room_number`

Eller:

- Lad hvert ord starte med stort bortset fra det f�rste: `myObject`, `roomNumber`

## Funktioner

Funktioner er kommandoer brugt til at transformere objektet p� en m�de og give et output.

Det, som man s�tter i funktionen, kaldes et "argument" eller "input". Antallet af argumenter varierer mellem funktioner.

Funktioner har alle den samme opbygning: `funktionsnavn(arg1, arg2, arg3)`. (funktionsnavn med argumenterne i parentes adskilt med kommaer).

Nogle argumenter er kr�vet, mens andre er valgfrie.

### Eksempler p� funktioner

G�r tekst til blokbogstaver:


```R
name <- 'kilmister'
toupper(name) 
```


'KILMISTER'


Erstat bogstaver i tekst:


```R
gsub("e", "a", name)
```


'kilmistar'


### Funktioner og output

Bem�rk at funktioner *aldrig* �ndrer et objekt. N�r man bruger en funktion, beder man R om at *se* et output, men ikke om at �ndre noget.

Hvis man vil �ndre et objekt, skal man derfor lagre outputtet i et objekt (et nyt eller eksisterende).


```R
name # u�ndret selvom det er brugt i flere funktioner
```


'kilmister'



```R
name <- gsub("e", "a", name) # overskriv objekt med �ndringen
```


```R
name
```


'kilmistar'


## �VELSE 1: OBJEKTER OG FUNKTIONER

1. Dan f�lgende objekter:

    - `name1`: `"araya"`
    - `name2`: `"townsend"`
    - `year1`: `1961` (uden citationstegn)
    - `year2`: `"1972"` (med citationstegn)

2. Fors�g at udregn alderen for `year1` og `year2` (nuv�rende �r - year-objekt). 

3. Brug funktionen `toupper()` til at �ndre `name1` til blokbogstaver.

## �VELSE 1: DEFINING OBJECTS
*Hvad sker der?*


```R
name1 <- "araya"
name2 <- "townsend"
year1 <- 1961
year2 <- "1972"
```


```R
age1 <- 2021 - year1 # Virker fint

age1
```


60



```R
age2 <- 2021 - year2 # Giver fejl - year2 er tekst
```


    Error in 2021 - year2: non-numeric argument to binary operator
    Traceback:
    



```R
name1 <- toupper(name1)

name1
```


'ARAYA'


## R Libraries (pakker) 

Fordi R er "open source", bliver der konstant tilf�jet nye funktioner til R. Funktioner, som andre har lavet, kan l�ses ind via "R pakker", som kan g�res til del af ens "R bibliotek".

Alle kommandoer indtil videre har v�ret del af `base` pakken (del af R fra starten). 

Pakker kan installeres enten gennem konsolen eller gennem peg-og-klik.


R adskiller mellem installation og indl�sning. Dette for at undg� konflikter mellem pakker.

Funktioner fra en pakke l�ses ind i arbejdsmilj�et p� f�lgende m�de (pakkenavn *uden* citationstegn!):

`library(packagename)` 

### Installation gennem konsol

Pakker kan installere p� f�lgende m�de (pakkenavn *med* citationstegn!): 

`install.packages('packagename')` 

### Installation med peg og klik

G� i "Packages"-fanen i vinduet med "Files, Plots, Packages, Help, Viewer":

![pckwin](./img/pckwin.png)

Tryk "Install". Skriv navnet p� pakkerne i andet felt adskilt med mellemrum og tryk "Install":

![pckinst](./img/pckinst.png)

## Indl�sning af data med `readr` (tidyverse)

`readr` er en pakke til at indl�se forskellige datafiler i R.

R har ogs� basisfunktioner til dette, men `readr` er mere effektiv.

`readr` er del af pakkesamlingen `tidyverse`: https://www.tidyverse.org/

I koden herunder indl�ser vi data ind fra en csv-fil og gemmer i objektet `ess18`:


```R
library(readr)

ess18 <- read_csv("https://github.com/RolfLund/4semesterR/raw/master/teaching-materials/r-intro/datasets/ESS2018DK_subset.csv")
```

    Warning message:
    "pakke 'readr' blev bygget under R version 4.1.2"
    [1mRows: [22m[34m1285[39m [1mColumns: [22m[34m17[39m
    
    [36m--[39m [1mColumn specification[22m [36m------------------------------------------------------------------------------------------------[39m
    [1mDelimiter:[22m ","
    [31mchr[39m  (7): vote, prtvtddk, health, lvpntyr, tygrtr, gndr, edlvddk
    [32mdbl[39m (10): idno, netustm, ppltrst, yrbrn, eduyrs, wkhct, wkhtot, grspnum, frl...
    
    
    [36mi[39m Use [30m[47m[30m[47m`spec()`[47m[30m[49m[39m to retrieve the full column specification for this data.
    [36mi[39m Specify the column types or set [30m[47m[30m[47m`show_col_types = FALSE`[47m[30m[49m[39m to quiet this message.
    
    

### Indl�sning med peg og klik

Data kan ogs� indl�ses med peg-og-klik under "File"->"Import dataset". Her hj�lper RStudio med importen af data:

![impdat](./img/impdat.png)

## Tabeldata i R: Data Frames

`ess18` er nu et objekt, der indeholder et datas�t. Bem�rk at m�den vi danner objektet ikke er anderledes end andre m�der, som vi har dannet objekter: `objectname <- somefunction(something)`.

`ess18` er en "data frame". En "data frame" er m�den R lagrer tabeldata (data struktureret i r�kker og kolonner).

### Data brugt i undervisningen: European Social Survey 2018

Til R introduktionerne bruger vi et udsnit af European Social Survey fra 2018 (https://www.europeansocialsurvey.org/). Data indeholder kun den danske del af data, nogle udvalgte variable samt nogle f� filtreringer.

- Kodebog kan findes her: https://www.europeansocialsurvey.org/docs/round9/survey/ESS9_appendix_a7_e03_1.pdf
- Sp�rgeskeamet brugt i unders�gelsen kan findes her: https://www.europeansocialsurvey.org/docs/round9/fieldwork/source/ESS9_source_questionnaires.pdf

Datas�ttet indeholder f�lgende variable:

|variabel | beskrivelse |
|----|---|
|idno|Respondent's identification number|
|netustm |Internet use, how much time on typical day, in minutes|
|ppltrst|Most people can be trusted or you can't be too careful|
|vote|Voted last national election|
|prtvtddk|Party voted for in last national election, Denmark|
|health|Subjective general health|
|lvpntyr|Year first left parents for living separately for 2 months or more|
|tygrtr|Retire permanently, age too young. SPLIT BALLOT|
|gndr|Gender|
|yrbrn|Year of birth|
|edlvddk|Highest level of education, Denmark|
|eduyrs|Years of full-time education completed|
|wkhct|Total contracted hours per week in main job overtime excluded|
|wkhtot|Total hours normally worked per week in main job overtime included|
|grspnum|What is your usual [weekly/monthly/annual] gross pay|
|frlgrsp|Fair level of [weekly/monthly/annual] gross pay for you|
|inwtm|Interview length in minutes, main questionnaire|


## Udforskning af data frames
For at f� et overblik over data, kan man bruge funktionen `head()`:


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



`head()` viser de f�rste seks r�kker af data, og er god til at tjekke, om data ser ud, som det skal.

Vi kan tjekke kolonnenavnene (variabelnavnene) med `colnames`. `dim` returnerer antallet af r�kker og kolonner/variable.


```R
colnames(ess18)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>'idno'</li><li>'netustm'</li><li>'ppltrst'</li><li>'vote'</li><li>'prtvtddk'</li><li>'health'</li><li>'lvpntyr'</li><li>'tygrtr'</li><li>'gndr'</li><li>'yrbrn'</li><li>'edlvddk'</li><li>'eduyrs'</li><li>'wkhct'</li><li>'wkhtot'</li><li>'grspnum'</li><li>'frlgrsp'</li><li>'inwtm'</li></ol>




```R
dim(ess18)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>1285</li><li>17</li></ol>



`summary()` bruges til at se deskriptive m�l for variable i data (antal, middelv�rdi, standardafvigelse, minimum, maksimum, kvartiler).


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


## Data frames og "vectors"

Data frames best�r af r�kker og kolonner. R forventer typisk at r�kkerne indeholder "observationer" (fx personer), mens kolonner indeholder variable (information omkring observationerne).

R behandler en enkelt kolonne/variabel som en "vector". En "vector" er en samling af v�rdier af den samme *class* (fx tal eller tekster).

Man udpeger en enkelt kolonne i en data frame med `$` (en "vector").


```R
head(ess18$yrbrn) # f�rste seks v�rdier i yrbrn
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>1974</li><li>1975</li><li>1958</li><li>1964</li><li>1952</li><li>1963</li></ol>



Hver v�rdi i en variabel har et indeks, som afspejler r�kkenummeret i data.

Man udpeger et specifikt r�kkenummer med `[]`:


```R
ess18$yrbrn[10] # Giver 10. v�rdi (r�kke 10) af yrbrn variabel
```


1958



```R
ess18$yrbrn[2:10] # Giver r�kke 2 til 10 af yrbrn (begge inkluderet)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>1975</li><li>1958</li><li>1964</li><li>1952</li><li>1963</li><li>1991</li><li>1984</li><li>1966</li><li>1958</li></ol>



R indeholder en r�kke funktioner til at regne specifikke deskriptive m�l, fx `min()` (minimum), `max()` (maksimum), `mean()` (middelv�rdi), `sd()` (standardafvigelse) og `length()` (antal v�rdier/r�kker).


```R
min(ess18$yrbrn) # Mindste v�rdi
max(ess18$yrbrn) # St�rste v�rdi
mean(ess18$yrbrn) # Middelv�rdi
sd(ess18$yrbrn) # Standardafvigelse
length(ess18$yrbrn) # Antal v�rdier i variabel (svarer til antal r�kker)
```


1929



2003



1967.04747081712



18.2944100607406



1285


Husk at vi med R kan lagre hvad som helst som et objekt. Hvis vi fx l�bende f�r brug for at kalde et m�l frem, kan vi lagre det som et objekt for sig:


```R
mean_yrbrn <- mean(ess18$yrbrn)
```


```R
mean_yrbrn
```


1967.04747081712


`unique()` giver de unikke v�rdier i en variabel:


```R
unique(ess18$health)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>'Good'</li><li>'Fair'</li><li>'Very bad'</li><li>'Very good'</li><li>'Bad'</li><li>NA</li></ol>



## Missing-v�rdier

Data vil ofte indeholde missing-v�rdier. Missing-v�rdier angiver ikke-gyldige v�rdier; fx et manglende svar, ugyldigt svar, information der ikke kunne skaffes eller lignende.

Missing-v�rdier bruges til at give en v�rdi uden at give en v�rdi (cellerne skal indeholde *noget*). Missing-v�rdier angives som `NA` i R.

BEM�RK: Det er ikke givet at missing-v�rdier er kodet som missing p� forh�nd i et datas�t. Hvordan missing-v�rdier kodes varierer mellem programmer. Derfor bruger man ofte specifikke talv�rdier (fx 777777 eller 888888) til at indikere missing-v�rdier. Man kan ogs� st� i situationer, hvor visse kategorier er irrelevante for analysen, hvor man s� koder disse til missing.

`summary()`-funktionen inkluderer antallet af missing-v�rdier i variablen:


```R
summary(ess18$inwtm)
```


       Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
      18.00   51.00   59.00   63.32   70.00  613.00       5 


Missing-v�rdier er hverken h�je eller lave i R. Dette betyder at det ikke er muligt at lave beregninger med missing-v�rdier.


```R
min(ess18$inwtm) # NA is neither high or low - returns NA
max(ess18$inwtm) # NA is neither high or low - returns NA
mean(ess18$inwtm) # NA is neither high or low - returns NA
```


&lt;NA&gt;



&lt;NA&gt;



&lt;NA&gt;


Ofte er man n�dt til at h�ndtere missing-v�rdier i sit analysearbejde; enten ved at erstatte dem eller ved at fjerne r�kker, som har missing-v�rdier.

Nogle funktioner har indbyggede argumenter til at h�ndtere missing-v�rdier.

## Brug af hj�lpe-funktionen

Alle R funktioner og kommandoer er dokumenteret, s� du beh�ver ikke at huske hvordan hver enkelt funktion fungerer.

Alle funktioner har sin egen "hj�lpefil". Hj�lpefilen beskriver hvordan funktionen bruges, og hvad de forskellige argumenter g�r.

Man �bner hj�lpefilen for en funktion ved at skrive `?` foran.

### Kan vi fjerne missing i vores beregning?

Ved at kigge p� hj�lpefilen for `max()`, kan vi finde argumentet `na.rm`. Dette argument bruges til at fjerne missing, n�r R laver beregningen.

Bem�rk at argumentet i hj�lpefilen er skrevet `na.rm = FALSE`. Dette angiver standardindstillingen for funktionen. Det vil sige, at hvis ikke man specificerer andet, s� er det den m�de, som funktionen k�res. I dette tilf�lde er argumentet som standard sat til `FALSE` (missing-v�rdier fjernes ikke).

Ved at �ndre argumentet, n�r vi bruger funktionen, fjernes missing-v�rdierne inden beregning:


```R
max(ess18$inwtm, na.rm = TRUE)
```


613


## �VELSE 2: DESKRIPTIVE M�L

Brug forskellige funktioner til at udregne f�lgende:

- Middelv�rdien (`mean()`) for tid brugt p� internettet om dagen (`netustm`)
- Den h�jeste v�rdi (`max()`) for tid brugt p� internettet om dagen (`netustm`)
- Medianen (`median()`) for brutto m�nedsl�n (`grspnum`)

BEM�RK! Variablene indeholder muligvis missing-v�rdier. Tjek hj�lpefilerne for at se, hvordan man tager h�jde for dette.

## �VELSE 2: DESKRIPTIVE M�L


```R
mean(ess18$netustm, na.rm = TRUE)
max(ess18$netustm, na.rm = TRUE)
median(ess18$grspnum, na.rm = TRUE)
```


227.431216931217



1020



32000


## Datah�ndtering i R

N�r man arbejder med data, er man n�ste altid n�dt til at foretage visse �ndringer i data, f�r at de er egnet til analyse. Dette kaldes "datah�ndtering".

Datah�ndtering inkluderer blandt andet:
- Udv�lge specifikke observationer og variable (kaldes ogs� subsetting)
- Danne nye variables
- Rekode v�rdier

R underst�tter datah�ndtering med "basis"-kommandoer, men funktionerne tilg�ngelige gennem tidyverse (https://www.tidyverse.org/) er langt mere intuitive.

### Subset data med `dplyr` 

`dplyr` indeholder blandt andet funktionerne `filter` og `select`, som kan bruges til at subsette data.

`filter()` tager et datas�t og kriterier i form af "logiske udtryk" (mere om dette senere) med brug af variable. Funktionen returnerer de r�kker, som opfylder kriterierne.

`select()` tager et datas�t efterfulgt af de variable, som skal bevares. Funktionen returnerer de valgte variable.

BEM�RK: Basis R har ogs� en `filter()` funktion. Denne funktion overskrives, n�r man importerer `dplyr`.

### Udv�lg r�kker med `filter`

`filter` funktionen tager mindst to input: et datas�t (en dataframe) og et kriterie.


```R
library(dplyr)

ess18_male <- filter(ess18, gndr == 'Male') # Subset kun med m�nd

head(ess18_male)
```

    
    Vedh�fter pakke: 'dplyr'
    
    
    De f�lgende objekter er maskerede fra 'package:stats':
    
        filter, lag
    
    
    De f�lgende objekter er maskerede fra 'package:base':
    
        intersect, setdiff, setequal, union
    
    
    


<table class="dataframe">
<caption>A tibble: 6 � 17</caption>
<thead>
	<tr><th scope=col>idno</th><th scope=col>netustm</th><th scope=col>ppltrst</th><th scope=col>vote</th><th scope=col>prtvtddk</th><th scope=col>health</th><th scope=col>lvpntyr</th><th scope=col>tygrtr</th><th scope=col>gndr</th><th scope=col>yrbrn</th><th scope=col>edlvddk</th><th scope=col>eduyrs</th><th scope=col>wkhct</th><th scope=col>wkhtot</th><th scope=col>grspnum</th><th scope=col>frlgrsp</th><th scope=col>inwtm</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td> 5816</td><td> 90</td><td>7</td><td>Yes</td><td>SF Socialistisk Folkeparti - Socialist People's Party</td><td>Good     </td><td>1994</td><td>60                             </td><td>Male</td><td>1974</td><td>Mellemlang videreg�ende uddannelse af 3-4 �rs varighed. Professionsbachelorer,</td><td>35</td><td>37</td><td>37</td><td>37000</td><td>35000</td><td>61</td></tr>
	<tr><td> 7887</td><td>360</td><td>8</td><td>Yes</td><td>Socialdemokratiet - The Social democrats             </td><td>Fair     </td><td>1983</td><td>55                             </td><td>Male</td><td>1958</td><td>Lang videreg�ende uddannelse. Kandidatuddannelser af 5.-6. �rs varighed, F.eks</td><td>25</td><td>39</td><td>39</td><td>36000</td><td>42000</td><td>89</td></tr>
	<tr><td>12355</td><td>120</td><td>5</td><td>Yes</td><td>Socialdemokratiet - The Social democrats             </td><td>Fair     </td><td>1987</td><td>60                             </td><td>Male</td><td>1963</td><td>Faglig uddannelse (h�ndv�rk, handel, landbrug mv.), F.eks. Fagl�rte, Social-  </td><td>14</td><td>38</td><td>37</td><td>36000</td><td>38000</td><td>48</td></tr>
	<tr><td>16357</td><td>488</td><td>5</td><td>Yes</td><td>Dansk Folkeparti - Danish People's Party             </td><td>Very good</td><td>2013</td><td>50                             </td><td>Male</td><td>1991</td><td>Mellemlang videreg�ende uddannelse af 3-4 �rs varighed. Professionsbachelorer,</td><td> 4</td><td>37</td><td>37</td><td>40000</td><td>   NA</td><td>50</td></tr>
	<tr><td>20724</td><td> 60</td><td>5</td><td>Yes</td><td>Venstre, Danmarks Liberale Parti - The Liberal Party </td><td>Good     </td><td>1981</td><td>Never too young                </td><td>Male</td><td>1958</td><td>Faglig uddannelse (h�ndv�rk, handel, landbrug mv.), F.eks. Fagl�rte, Social-  </td><td>14</td><td>37</td><td>40</td><td>28000</td><td>34000</td><td>65</td></tr>
	<tr><td>24928</td><td>120</td><td>8</td><td>Yes</td><td>Venstre, Danmarks Liberale Parti - The Liberal Party </td><td>Very good</td><td>1984</td><td>Should never retire permanently</td><td>Male</td><td>1965</td><td>Mellemlang videreg�ende uddannelse af 3-4 �rs varighed. Professionsbachelorer,</td><td>19</td><td>NA</td><td>80</td><td>50000</td><td>   NA</td><td>77</td></tr>
</tbody>
</table>




```R
ess18_edusub <- filter(ess18, eduyrs > 15) # Subset med folk med mere end 15 �rs uddannelse

head(ess18_edusub)
```


<table class="dataframe">
<caption>A tibble: 6 � 17</caption>
<thead>
	<tr><th scope=col>idno</th><th scope=col>netustm</th><th scope=col>ppltrst</th><th scope=col>vote</th><th scope=col>prtvtddk</th><th scope=col>health</th><th scope=col>lvpntyr</th><th scope=col>tygrtr</th><th scope=col>gndr</th><th scope=col>yrbrn</th><th scope=col>edlvddk</th><th scope=col>eduyrs</th><th scope=col>wkhct</th><th scope=col>wkhtot</th><th scope=col>grspnum</th><th scope=col>frlgrsp</th><th scope=col>inwtm</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td> 5816</td><td> 90</td><td>7</td><td>Yes</td><td>SF Socialistisk Folkeparti - Socialist People's Party</td><td>Good     </td><td>1994</td><td>60                             </td><td>Male  </td><td>1974</td><td>Mellemlang videreg�ende uddannelse af 3-4 �rs varighed. Professionsbachelorer,</td><td>35</td><td>37</td><td>37</td><td>37000</td><td>35000</td><td>61</td></tr>
	<tr><td> 7887</td><td>360</td><td>8</td><td>Yes</td><td>Socialdemokratiet - The Social democrats             </td><td>Fair     </td><td>1983</td><td>55                             </td><td>Male  </td><td>1958</td><td>Lang videreg�ende uddannelse. Kandidatuddannelser af 5.-6. �rs varighed, F.eks</td><td>25</td><td>39</td><td>39</td><td>36000</td><td>42000</td><td>89</td></tr>
	<tr><td>19970</td><td>240</td><td>9</td><td>Yes</td><td>Liberal Alliance - Liberal Alliance                  </td><td>Very good</td><td>1984</td><td>60                             </td><td>Female</td><td>1966</td><td>Lang videreg�ende uddannelse. Kandidatuddannelser af 5.-6. �rs varighed, F.eks</td><td>21</td><td>36</td><td>36</td><td>85000</td><td>   NA</td><td>42</td></tr>
	<tr><td>22248</td><td>121</td><td>9</td><td>Yes</td><td>Socialdemokratiet - The Social democrats             </td><td>Good     </td><td>1970</td><td>Never too young                </td><td>Female</td><td>1950</td><td>Mellemlang videreg�ende uddannelse af 3-4 �rs varighed. Professionsbachelorer,</td><td>19</td><td>37</td><td>37</td><td>   NA</td><td>   NA</td><td>62</td></tr>
	<tr><td>24928</td><td>120</td><td>8</td><td>Yes</td><td>Venstre, Danmarks Liberale Parti - The Liberal Party </td><td>Very good</td><td>1984</td><td>Should never retire permanently</td><td>Male  </td><td>1965</td><td>Mellemlang videreg�ende uddannelse af 3-4 �rs varighed. Professionsbachelorer,</td><td>19</td><td>NA</td><td>80</td><td>50000</td><td>   NA</td><td>77</td></tr>
	<tr><td>27211</td><td>120</td><td>7</td><td>Yes</td><td>Kristendemokraterne - Christian Democrats            </td><td>Fair     </td><td>1983</td><td>60                             </td><td>Male  </td><td>1969</td><td>Mellemlang videreg�ende uddannelse af 3-4 �rs varighed. Professionsbachelorer,</td><td>16</td><td>15</td><td>17</td><td>26000</td><td>   NA</td><td>99</td></tr>
</tbody>
</table>



{{% notice note %}}
Bem�rk! Ved brug af `filter` beh�ves kun at skrive navnet p� variablen (`eduyrs`), og ikke b�de navn p� variabel og datas�t, som man ellers typisk g�r for at referere til enkeltkolonner i R (`ess18$eduyrs`). 

Dette beh�ves ikke, da `filter` antager, at variabelnavnet kommer fra det datas�t, som er angivet. Dette er gennemg�ende for de fleste `tidyverse` pakker og kommandoer (`filter`, `select`, `mutate` osv.)

{{% /notice %}}

### Logiske udtryk og logiske v�rdier

I R skrives kriterier som "logiske udtryk". Logiske udtryk er kommandoer, som altid returnere logiske v�rdier. Disse er altid enten `TRUE` eller `FALSE` (eller `NA`).

En r�kke operationer i R returnerer altid logiske v�rdier:

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


`filter()` forventer et logisk udtryk som kriterie, og bevarer s� alle de observationer, som opfylder kriteriet.

### V�lg kolonner/variable med `select`

`select` tager mindst to input: et datas�t (en dataframe) og en eller flere variable fra det datas�t, som kan beholdes/gemmes i et nyt datas�t. 

Datas�ttet er altid f�rste input, hvorefter variable listes i den r�kkef�lge, som man gerne vil have dem, adskilt med mellemrum.


```R
ess18_male_subset <- select(ess18_male, idno, gndr, yrbrn, edlvddk) # Udv�lg specifikke variable

head(ess18_male_subset)
```


<table class="dataframe">
<caption>A tibble: 6 � 4</caption>
<thead>
	<tr><th scope=col>idno</th><th scope=col>gndr</th><th scope=col>yrbrn</th><th scope=col>edlvddk</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td> 5816</td><td>Male</td><td>1974</td><td>Mellemlang videreg�ende uddannelse af 3-4 �rs varighed. Professionsbachelorer,</td></tr>
	<tr><td> 7887</td><td>Male</td><td>1958</td><td>Lang videreg�ende uddannelse. Kandidatuddannelser af 5.-6. �rs varighed, F.eks</td></tr>
	<tr><td>12355</td><td>Male</td><td>1963</td><td>Faglig uddannelse (h�ndv�rk, handel, landbrug mv.), F.eks. Fagl�rte, Social-  </td></tr>
	<tr><td>16357</td><td>Male</td><td>1991</td><td>Mellemlang videreg�ende uddannelse af 3-4 �rs varighed. Professionsbachelorer,</td></tr>
	<tr><td>20724</td><td>Male</td><td>1958</td><td>Faglig uddannelse (h�ndv�rk, handel, landbrug mv.), F.eks. Fagl�rte, Social-  </td></tr>
	<tr><td>24928</td><td>Male</td><td>1965</td><td>Mellemlang videreg�ende uddannelse af 3-4 �rs varighed. Professionsbachelorer,</td></tr>
</tbody>
</table>



`select` kan ogs� bruges til at frav�lge bestemte variable ved at s�tte et `-` foran variabel-navnet:


```R
ess18_male_subset <- select(ess18_male, -edlvddk) # Alle variable undtagen edlvddk

head(ess18_male_subset)
```


<table class="dataframe">
<caption>A tibble: 6 � 16</caption>
<thead>
	<tr><th scope=col>idno</th><th scope=col>netustm</th><th scope=col>ppltrst</th><th scope=col>vote</th><th scope=col>prtvtddk</th><th scope=col>health</th><th scope=col>lvpntyr</th><th scope=col>tygrtr</th><th scope=col>gndr</th><th scope=col>yrbrn</th><th scope=col>eduyrs</th><th scope=col>wkhct</th><th scope=col>wkhtot</th><th scope=col>grspnum</th><th scope=col>frlgrsp</th><th scope=col>inwtm</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td> 5816</td><td> 90</td><td>7</td><td>Yes</td><td>SF Socialistisk Folkeparti - Socialist People's Party</td><td>Good     </td><td>1994</td><td>60                             </td><td>Male</td><td>1974</td><td>35</td><td>37</td><td>37</td><td>37000</td><td>35000</td><td>61</td></tr>
	<tr><td> 7887</td><td>360</td><td>8</td><td>Yes</td><td>Socialdemokratiet - The Social democrats             </td><td>Fair     </td><td>1983</td><td>55                             </td><td>Male</td><td>1958</td><td>25</td><td>39</td><td>39</td><td>36000</td><td>42000</td><td>89</td></tr>
	<tr><td>12355</td><td>120</td><td>5</td><td>Yes</td><td>Socialdemokratiet - The Social democrats             </td><td>Fair     </td><td>1987</td><td>60                             </td><td>Male</td><td>1963</td><td>14</td><td>38</td><td>37</td><td>36000</td><td>38000</td><td>48</td></tr>
	<tr><td>16357</td><td>488</td><td>5</td><td>Yes</td><td>Dansk Folkeparti - Danish People's Party             </td><td>Very good</td><td>2013</td><td>50                             </td><td>Male</td><td>1991</td><td> 4</td><td>37</td><td>37</td><td>40000</td><td>   NA</td><td>50</td></tr>
	<tr><td>20724</td><td> 60</td><td>5</td><td>Yes</td><td>Venstre, Danmarks Liberale Parti - The Liberal Party </td><td>Good     </td><td>1981</td><td>Never too young                </td><td>Male</td><td>1958</td><td>14</td><td>37</td><td>40</td><td>28000</td><td>34000</td><td>65</td></tr>
	<tr><td>24928</td><td>120</td><td>8</td><td>Yes</td><td>Venstre, Danmarks Liberale Parti - The Liberal Party </td><td>Very good</td><td>1984</td><td>Should never retire permanently</td><td>Male</td><td>1965</td><td>19</td><td>NA</td><td>80</td><td>50000</td><td>   NA</td><td>77</td></tr>
</tbody>
</table>



`select` indeholder en r�kke funktioner til at v�lge variable forskellige kriterier, herunder:
- `starts_with()`: V�lger alle variable, hvis navne starter med tekststrengen angivet i funktionen
- `contains()`: V�lger alle variable, hvis navn indeholder tekststrengen angivet i funktionen.

Se mere her: https://dplyr.tidyverse.org/reference/select.html

## H�ndtering af missingv�rdier

Missingv�rdier er som bekendt angivet med `NA` i R. 

Som vist ved beregning af deskriptive m�l (middelv�rdi, standardafvigelse osv.), s� kan R ikke lave beregninger p� missingv�rdier. Ved nogle beregninger frasorterer R missingv�rdierne automatisk inden beregning, men andre gange skal man selv specificerer, hvad der skal ske med missingv�rdierne.

Man har derfor typisk brug for at kunne identificere hvilke v�rdier i datas�ttet, der er missing. `NA` er dog en speciel v�rdi, s� den kan ikke bruges i et filter lig andre v�rdier.

I nedenst�ende fors�ges at udv�lge de respondenter fra `ess18_male` subsettet, som *ikke* er missing i `grspnum` (selvangivet m�nedlig indkomst):


```R
ess18_male_filter <- filter(ess18_male, grspnum != NA)

head(ess18_male_filter)
```


<table class="dataframe">
<caption>A tibble: 0 � 17</caption>
<thead>
	<tr><th scope=col>idno</th><th scope=col>netustm</th><th scope=col>ppltrst</th><th scope=col>vote</th><th scope=col>prtvtddk</th><th scope=col>health</th><th scope=col>lvpntyr</th><th scope=col>tygrtr</th><th scope=col>gndr</th><th scope=col>yrbrn</th><th scope=col>edlvddk</th><th scope=col>eduyrs</th><th scope=col>wkhct</th><th scope=col>wkhtot</th><th scope=col>grspnum</th><th scope=col>frlgrsp</th><th scope=col>inwtm</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
</tbody>
</table>



Ovenst�ende returnerer ingen r�kker, da man ikke kan arbejde med missingv�rdier p� den m�de i R. 

For at identificere missingv�rdier bruges funktionen `is.na()`. Funktionen sp�rger "er v�rdien missing?" og returner `TRUE`/`FALSE` (`TRUE` hvis missing; ellers `FALSE`):


```R
head(is.na(ess18_male$grspnum)) # Er de f�rste seks v�rdier i grspnum missing?
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>FALSE</li><li>FALSE</li><li>FALSE</li><li>FALSE</li><li>FALSE</li><li>FALSE</li></ol>



Funktionen kan bruges til at finde de observationer, som *er* missing, s� hvordan v�lges de, som *ikke* er missing?

En simpel m�de at v�lge de observationer, som *ikke* er missing, er ved at "vende" kommandoen om, s�dan at der gives `TRUE`, hvis de *ikke* er missing. 

I R kan logiske udtryk vendes om ved at bruge `!` foran udtrykket (ved at "vende om" menes, at `TRUE` bliver til `FALSE`, og `FALSE` bliver til `TRUE`:


```R
!(2 < 4) # 2 er mindre end fire, men giver FALSE, da det vendes om med !
```


FALSE


`!` kan ogs� bruges i kombination med `is.na()`:


```R
head(!(is.na(ess18_male$grspnum))) # Er de f�rste seks v�rdier i grspnum ikke missing?
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>TRUE</li><li>TRUE</li><li>TRUE</li><li>TRUE</li><li>TRUE</li><li>TRUE</li></ol>



Med ovenst�ende kan man udelukkende v�lge de respondenter, som ikke er missing:


```R
ess18_male_filter <- filter(ess18_male, !(is.na(grspnum)))

head(ess18_male_filter)
```


<table class="dataframe">
<caption>A tibble: 6 � 17</caption>
<thead>
	<tr><th scope=col>idno</th><th scope=col>netustm</th><th scope=col>ppltrst</th><th scope=col>vote</th><th scope=col>prtvtddk</th><th scope=col>health</th><th scope=col>lvpntyr</th><th scope=col>tygrtr</th><th scope=col>gndr</th><th scope=col>yrbrn</th><th scope=col>edlvddk</th><th scope=col>eduyrs</th><th scope=col>wkhct</th><th scope=col>wkhtot</th><th scope=col>grspnum</th><th scope=col>frlgrsp</th><th scope=col>inwtm</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td> 5816</td><td> 90</td><td>7</td><td>Yes</td><td>SF Socialistisk Folkeparti - Socialist People's Party</td><td>Good     </td><td>1994</td><td>60                             </td><td>Male</td><td>1974</td><td>Mellemlang videreg�ende uddannelse af 3-4 �rs varighed. Professionsbachelorer,</td><td>35</td><td>37</td><td>37</td><td>37000</td><td>35000</td><td>61</td></tr>
	<tr><td> 7887</td><td>360</td><td>8</td><td>Yes</td><td>Socialdemokratiet - The Social democrats             </td><td>Fair     </td><td>1983</td><td>55                             </td><td>Male</td><td>1958</td><td>Lang videreg�ende uddannelse. Kandidatuddannelser af 5.-6. �rs varighed, F.eks</td><td>25</td><td>39</td><td>39</td><td>36000</td><td>42000</td><td>89</td></tr>
	<tr><td>12355</td><td>120</td><td>5</td><td>Yes</td><td>Socialdemokratiet - The Social democrats             </td><td>Fair     </td><td>1987</td><td>60                             </td><td>Male</td><td>1963</td><td>Faglig uddannelse (h�ndv�rk, handel, landbrug mv.), F.eks. Fagl�rte, Social-  </td><td>14</td><td>38</td><td>37</td><td>36000</td><td>38000</td><td>48</td></tr>
	<tr><td>16357</td><td>488</td><td>5</td><td>Yes</td><td>Dansk Folkeparti - Danish People's Party             </td><td>Very good</td><td>2013</td><td>50                             </td><td>Male</td><td>1991</td><td>Mellemlang videreg�ende uddannelse af 3-4 �rs varighed. Professionsbachelorer,</td><td> 4</td><td>37</td><td>37</td><td>40000</td><td>   NA</td><td>50</td></tr>
	<tr><td>20724</td><td> 60</td><td>5</td><td>Yes</td><td>Venstre, Danmarks Liberale Parti - The Liberal Party </td><td>Good     </td><td>1981</td><td>Never too young                </td><td>Male</td><td>1958</td><td>Faglig uddannelse (h�ndv�rk, handel, landbrug mv.), F.eks. Fagl�rte, Social-  </td><td>14</td><td>37</td><td>40</td><td>28000</td><td>34000</td><td>65</td></tr>
	<tr><td>24928</td><td>120</td><td>8</td><td>Yes</td><td>Venstre, Danmarks Liberale Parti - The Liberal Party </td><td>Very good</td><td>1984</td><td>Should never retire permanently</td><td>Male</td><td>1965</td><td>Mellemlang videreg�ende uddannelse af 3-4 �rs varighed. Professionsbachelorer,</td><td>19</td><td>NA</td><td>80</td><td>50000</td><td>   NA</td><td>77</td></tr>
</tbody>
</table>



## Kombin�r datah�ndteringsfunktioner med pipe (%>%)

Det bliver hurtigt omst�ndeligt at foretage flere datah�ndteringsoperationer, hvis man skal specificere navnet p� datas�ttet hver gang. Dette kan forsimples ved brug af "pipe"-operatoren (`%>%`).

"pipe"-operatoren er en del af `tidyverse` og er derfor kompatibel med n�sten alle funktioner fra de `tidyverse` pakkerne. 

Et "pipe" fungerer kort sagt ved at tage outputtet p� en kodelinje videre til kodelinjen under, og bruge dette output som input i funktionen p� den nye linje. Man bruger for det meste "pipe" i forbindelse med datah�ndtering, da ideen her er, at outputtet af en kodelinje/kommando er en dataframe, som s� kan bruges som input p� kodelinjen/kommandoen p� n�ste linje.

Herunder dannes et subet af ESS18, der indeholder alle m�nd og variablene `idno`, `gndr`, `yrbrn`, `edlvddk`:


```R
ess18_male_subset <- filter(ess18, gndr == 'Male')
ess18_male_subset <- select(ess18, idno, gndr, yrbrn, edlvddk)

head(ess18_male_subset)
```


<table class="dataframe">
<caption>A tibble: 6 � 4</caption>
<thead>
	<tr><th scope=col>idno</th><th scope=col>gndr</th><th scope=col>yrbrn</th><th scope=col>edlvddk</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td> 5816</td><td>Male  </td><td>1974</td><td>Mellemlang videreg�ende uddannelse af 3-4 �rs varighed. Professionsbachelorer,</td></tr>
	<tr><td> 7251</td><td>Female</td><td>1975</td><td>Faglig uddannelse (h�ndv�rk, handel, landbrug mv.), F.eks. Fagl�rte, Social-  </td></tr>
	<tr><td> 7887</td><td>Male  </td><td>1958</td><td>Lang videreg�ende uddannelse. Kandidatuddannelser af 5.-6. �rs varighed, F.eks</td></tr>
	<tr><td> 9607</td><td>Female</td><td>1964</td><td>Mellemlang videreg�ende uddannelse af 3-4 �rs varighed. Professionsbachelorer,</td></tr>
	<tr><td>11688</td><td>Female</td><td>1952</td><td>Faglig uddannelse (h�ndv�rk, handel, landbrug mv.), F.eks. Fagl�rte, Social-  </td></tr>
	<tr><td>12355</td><td>Male  </td><td>1963</td><td>Faglig uddannelse (h�ndv�rk, handel, landbrug mv.), F.eks. Fagl�rte, Social-  </td></tr>
</tbody>
</table>



Ovenst�ende kode er omst�ndelig af flere grunde: For det f�rste skal navnet p� det endelige subset `ess18_male_subset` gentages for hver datah�ndteringskommando. For det andet skal inputdatas�ttet (`ess18`) ogs� gentages hver gang.

Med et pipe kan dette undg�s:


```R
ess18_male_subset <- ess18 %>% # subset skal tage udgangspunkt i ess18
    filter(gndr == 'Male') %>% # filter for m�nd - datainput er output af ovenst�ende (en kopi af ess18)
    select(idno, gndr, yrbrn, edlvddk) # udv�lg variable - datainput er output af ovenst�ende (ess18 filtreret for m�nd)

head(ess18_male_subset)
```


<table class="dataframe">
<caption>A tibble: 6 � 4</caption>
<thead>
	<tr><th scope=col>idno</th><th scope=col>gndr</th><th scope=col>yrbrn</th><th scope=col>edlvddk</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td> 5816</td><td>Male</td><td>1974</td><td>Mellemlang videreg�ende uddannelse af 3-4 �rs varighed. Professionsbachelorer,</td></tr>
	<tr><td> 7887</td><td>Male</td><td>1958</td><td>Lang videreg�ende uddannelse. Kandidatuddannelser af 5.-6. �rs varighed, F.eks</td></tr>
	<tr><td>12355</td><td>Male</td><td>1963</td><td>Faglig uddannelse (h�ndv�rk, handel, landbrug mv.), F.eks. Fagl�rte, Social-  </td></tr>
	<tr><td>16357</td><td>Male</td><td>1991</td><td>Mellemlang videreg�ende uddannelse af 3-4 �rs varighed. Professionsbachelorer,</td></tr>
	<tr><td>20724</td><td>Male</td><td>1958</td><td>Faglig uddannelse (h�ndv�rk, handel, landbrug mv.), F.eks. Fagl�rte, Social-  </td></tr>
	<tr><td>24928</td><td>Male</td><td>1965</td><td>Mellemlang videreg�ende uddannelse af 3-4 �rs varighed. Professionsbachelorer,</td></tr>
</tbody>
</table>



## �VELSE 3: SUBSETTING

1. Dan et subset af data, der *kun* indeholder kvinder f�dt efter 1980 og med f�lgende variable: `idno`, `gndr`, `yrbrn`, `netustm`

2. Brug `head()` til at tjekke om subsettet ser rigtigt ud.

3. Beregn middelv�rdien for tid brugt p� internettet om dagen (`netustm`) for subsettet.

### Ekstra �velse

1. Dan et subset for m�nd f�dt efter 1980
2. Beregn middelv�rdien for tid brugt p� internettet om dagen (`netustm`) for subsettet. Er middelv�rdien h�jere eller lavere end det for kvinderne?

## �VELSE 3: SUBSETTING


```R
ess18_female_subset <- filter(ess18, gndr == 'Female', yrbrn > 1980)
ess18_female_subset <- select(ess18_female_subset, idno, gndr, yrbrn, netustm)


ess18_male_subset <- filter(ess18, gndr == 'Male', yrbrn > 1980)
ess18_male_subset <- select(ess18_male_subset, idno, gndr, yrbrn, netustm)
```


```R
mean(ess18_female_subset$netustm, na.rm = TRUE)
```


305.27950310559



```R
mean(ess18_male_subset$netustm, na.rm = TRUE) # Bonus
```


322.831460674157



```R
mean(ess18_male_subset$netustm, na.rm = TRUE) > mean(ess18_female_subset$netustm, na.rm = TRUE)
```


TRUE


## Rekodning og nye variable

At lave nye variable og (simple) rekodninger er typisk gjort p� samme m�de. Den eneste forskel er blot, om �ndringerne skrives til ny variabel, eller om �ndringerne overskriver en eksisterende variabel (rekodning).

I denne sektion ser vi kun p� rekodning som "omregninger" af eksisterende variable. For at se rekodning af kategorier, s� se under materialet til "Intro til R II".


### Rekodning samt at danne nye variable med `dplyr`

Funktionen `mutate()` i `dplyr` bruges til at rekode samt til at danne nye variable.

Funktionen mindst to input: 
1. Et datas�t, hvor der skal dannes/�ndres en variabel
2. Et udtryk for, hvad den �ndrede/nye variabel skal indeholde. Dette skrives som `nyvar` = `[variabelindhold]`.

I nedenst�ende dannes en variabel for interviewtid i timer. Denne dannes ved at tage `inwtm` (interviewtid i minutter) og dividere med 60:


```R
ess18 <- mutate(ess18, inwth = inwtm / 60)

head(ess18$inwth)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>1.01666666666667</li><li>1.13333333333333</li><li>1.48333333333333</li><li>0.833333333333333</li><li>1.28333333333333</li><li>0.8</li></ol>



Ovenst�ende danner en ny variabel for interviewtid i timer: `inwth`. 

Det er typisk bedst at danne nye variable, hvis indholdet i variablen er �ndret. Hvis man dog blot ville �ndre den oprindelige variabel, skulle man blot specificere det oprindelige variabelnavn i stedet for et nyt:

```R
ess18 <- mutate(ess18, inwtm = inwtm / 60) # Overskriver variabel
```

## �VELSE 4: DAN NYE VARIABLE

1. Dan en aldersvariabel (datas�ttet er fra 2018)

2. Dan en overtids-variabel, der indeholder forskellen mellem faktiske arbejdstimer om ugen (`wkhtot`) og arbejdstimer ansat til om ugen (`wkhct`).

3. Hvad er den h�jeste overtidsv�rdi? (brug enten `summary()` eller `max()`

## �VELSE 4: DAN NYE VARIABLE


```R
ess18 <- mutate(ess18, age = 2018 - yrbrn,
           overthrs = wkhtot - wkhct)

max(ess18$overthrs, na.rm = TRUE)
```


43


## "Classes" i R (�ndring af variabeltype)

Som n�vnt tidligere, adskiller R mellem objekter via deres "class".

Funktionen `class()` bruges til at tjekke hvilken "class" objektet har:


```R
name = "keenan"
year = 1964
```


```R
class(name)
```


'character'



```R
class(year)
```


'numeric'


Enkelte variable(/"vectors") kan *kun* indeholde v�rdier med samme class. Funktionen `class()` virker derfor ogs� p� variable.

Variablen `tygrtr` (i hvilken alder er man for ung til at g� p� pension) ligner en variabel, der b�r indeholde numeriske v�rdier (en alder). Ser vi n�rmere p� variablen, kan vi dog se, at den ogs� indeholder tekst-v�rdier:


```R
head(ess18$tygrtr)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>'60'</li><li>'40'</li><li>'55'</li><li>'64'</li><li>'50'</li><li>'60'</li></ol>



Unders�ger vi variablens "class", kan vi se, at variablen er lagret som tekst (ogs� kaldt "string" i programmeringssprog):


```R
class(ess18$tygrtr)
```


'character'


Dette betyder at vi ikke kan lave beregninger med variablen:


```R
max(ess18$tygrtr, na.rm = TRUE) # Viser h�jeste v�rdi alfabetisk
```


'Should never retire permanently'


### "Class coercion" - tving en variabel til en anden type

I de fleste tilf�lde kan R tvinge v�rdier fra en type/class til en anden. Ved at g�re dette, bliver inkompatible v�rdier til missing (`NA`). 

V�rdier kan tvinges til tekst v�rdier med `as.character()`

V�rdier kan tvinges til numeriske v�rdier med `as.numeric()`

Herunder dannes en numerisk version af `tygrtr` (bem�rk advarslen):


```R
ess18 <- mutate(ess18, tygrtr_num = as.numeric(tygrtr))
```

    Warning message in mask$eval_all_mutate(quo):
    "NAs introduced by coercion"
    

Nu kan variablen bruges i beregninger:


```R
max(ess18$tygrtr_num, na.rm = TRUE)
```


88


## �VELSE 5: CLASS COERCION

Dan en variabel, der indeholder antal �r respondenten boede hjemme, inden de flyttede hjemmefra (`lvpntyr`: first time living separately for 2 months). 

Bem�rk at variablen `lvpntyr` muligvis ikke er klar til beregninger med det samme.

Husk at `as.numeric()` tvinger v�rdier om til tal.

## �VELSE 5: CLASS COERCION


```R
ess18 <- mutate(ess18, lvpntyr_num = as.numeric(lvpntyr),
                yrhome = lvpntyr_num - yrbrn)

head(ess18)
```

    Warning message in mask$eval_all_mutate(quo):
    "NAs introduced by coercion"
    


<table class="dataframe">
<caption>A tibble: 6 � 23</caption>
<thead>
	<tr><th scope=col>idno</th><th scope=col>netustm</th><th scope=col>ppltrst</th><th scope=col>vote</th><th scope=col>prtvtddk</th><th scope=col>health</th><th scope=col>lvpntyr</th><th scope=col>tygrtr</th><th scope=col>gndr</th><th scope=col>yrbrn</th><th scope=col>?</th><th scope=col>wkhtot</th><th scope=col>grspnum</th><th scope=col>frlgrsp</th><th scope=col>inwtm</th><th scope=col>inwth</th><th scope=col>age</th><th scope=col>overthrs</th><th scope=col>tygrtr_num</th><th scope=col>lvpntyr_num</th><th scope=col>yrhome</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>?</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td> 5816</td><td> 90</td><td>7</td><td>Yes</td><td>SF Socialistisk Folkeparti - Socialist People's Party</td><td>Good    </td><td>1994</td><td>60</td><td>Male  </td><td>1974</td><td>?</td><td>37</td><td>37000</td><td>35000</td><td>61</td><td>1.0166667</td><td>44</td><td> 0</td><td>60</td><td>1994</td><td>20</td></tr>
	<tr><td> 7251</td><td>300</td><td>5</td><td>Yes</td><td>Dansk Folkeparti - Danish People's Party             </td><td>Fair    </td><td>1993</td><td>40</td><td>Female</td><td>1975</td><td>?</td><td>34</td><td>22000</td><td>30000</td><td>68</td><td>1.1333333</td><td>43</td><td> 2</td><td>40</td><td>1993</td><td>18</td></tr>
	<tr><td> 7887</td><td>360</td><td>8</td><td>Yes</td><td>Socialdemokratiet - The Social democrats             </td><td>Fair    </td><td>1983</td><td>55</td><td>Male  </td><td>1958</td><td>?</td><td>39</td><td>36000</td><td>42000</td><td>89</td><td>1.4833333</td><td>60</td><td> 0</td><td>55</td><td>1983</td><td>25</td></tr>
	<tr><td> 9607</td><td>540</td><td>9</td><td>Yes</td><td>Alternativet - The Alternative                       </td><td>Good    </td><td>1982</td><td>64</td><td>Female</td><td>1964</td><td>?</td><td>34</td><td>32000</td><td>   NA</td><td>50</td><td>0.8333333</td><td>54</td><td> 2</td><td>64</td><td>1982</td><td>18</td></tr>
	<tr><td>11688</td><td> NA</td><td>5</td><td>Yes</td><td>Socialdemokratiet - The Social democrats             </td><td>Very bad</td><td>1968</td><td>50</td><td>Female</td><td>1952</td><td>?</td><td>37</td><td>   NA</td><td>   NA</td><td>77</td><td>1.2833333</td><td>66</td><td> 0</td><td>50</td><td>1968</td><td>16</td></tr>
	<tr><td>12355</td><td>120</td><td>5</td><td>Yes</td><td>Socialdemokratiet - The Social democrats             </td><td>Fair    </td><td>1987</td><td>60</td><td>Male  </td><td>1963</td><td>?</td><td>37</td><td>36000</td><td>38000</td><td>48</td><td>0.8000000</td><td>55</td><td>-1</td><td>60</td><td>1987</td><td>24</td></tr>
</tbody>
</table>



## Gem dit arbejde 

Det vigtigste at gemme, er at gemme sit R script.

Brug gem-ikonet til at gemme dit script.

![save](./img/save-script.png)
