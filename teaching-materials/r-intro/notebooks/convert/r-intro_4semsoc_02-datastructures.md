
# {#Kapitel}Datastrukturer i R

R har forskellige måder at lagre data på. Vi har hidtil set på, hvordan
R håndterer enkelte værdier. I det følgende ser vi på, hvordan R
arbejder med flere værdier. Objekter til at holde på flere værdier
refereres også til som “datastrukturer”.

Den mest centrale datastruktur i R er en såkaldt “data frame”, hvor data
er struktureret i rækker og kolonner.

# {#Afsnit}Tidyverse

[Tidyverse](https://www.tidyverse.org/) er en samling af pakker til R,
der letter arbejdet med at indlæse, håndtere og arbejde med data.

Pakkerne fra Tidyverse har den fordel, at de alle følger den samme
designfilosofi og opbygning i deres funktioner.

Vi vil i dette materiale primært bruge funktioner fra tidyverse til
data- og variabelhåndtering. Inden du fortsætter kan du derfor med
fordel installere denne pakkesamling.

**Installation og brug af tidyverse**

Alle pakker i tidyverse kan installeres med følgende kommando:

``` r
install.packages('tidyverse')
```

Når tidyverse er installeret, kan alle pakker fra tidyverse indlæses
blot ved én library-kommando:

``` r
library(tidyverse)
```

### Supplerende materiale om datahåndtering med `tidyverse`

Bogen “R for Data Science” introducerer til datahåndtering og
visualiseirng med `tidyverse`, og kan tilgås gratis online:
https://r4ds.had.co.nz/

<center>
<a href = "https://r4ds.had.co.nz/">
<img src="https://d33wubrfki0l68.cloudfront.net/b88ef926a004b0fce72b2526b0b5c4413666a4cb/24a30/cover.png" width="200"/></a>
</center>

Derudover har `tidyverse` også en fast side med vejledninger og guides
til deres pakker og funktioner: https://www.tidyverse.org/

# {#Afsnit}Indlæsning af data

I koden herunder indlæses data fra en csv-fil og gemmes i objektet
`ess18`:

``` r
library(tidyverse)

ess18 <- read_csv("https://github.com/RolfLund/4semesterR/raw/master/teaching-materials/r-intro/datasets/ESS2018DK_subset.csv")
```

`read_csv` er en del af tidyverse (mere specifikt pakken `readr`).

R har også en basisfunktion til at indlæse csv-filer (`read.csv`), men
`read_csv` er mere effektiv.

### Indlæsning med peg og klik

Data kan også indlæses med peg-og-klik under “File”-\>“Import dataset”.
Her hjælper RStudio med importen af data:

![impdat](./img/impdat.png)

### Data brugt i undervisningen: European Social Survey 2018

Til R introduktionerne bruger vi et udsnit af European Social Survey fra
2018 (https://www.europeansocialsurvey.org/). Data indeholder kun den
danske del af data, nogle udvalgte variable samt nogle få filtreringer.

- Kodebog kan findes her:
  https://www.europeansocialsurvey.org/docs/round9/survey/ESS9_appendix_a7_e03_1.pdf
- Spørgeskeamet brugt i undersøgelsen kan findes her:
  https://www.europeansocialsurvey.org/docs/round9/fieldwork/source/ESS9_source_questionnaires.pdf

**Datasættet indeholder følgende variable:**

| variabel | beskrivelse                                                        |
|----------|--------------------------------------------------------------------|
| idno     | Respondent’s identification number                                 |
| netustm  | Internet use, how much time on typical day, in minutes             |
| ppltrst  | Most people can be trusted or you can’t be too careful             |
| vote     | Voted last national election                                       |
| prtvtddk | Party voted for in last national election, Denmark                 |
| health   | Subjective general health                                          |
| lvpntyr  | Year first left parents for living separately for 2 months or more |
| tygrtr   | Retire permanently, age too young. SPLIT BALLOT                    |
| gndr     | Gender                                                             |
| yrbrn    | Year of birth                                                      |
| edlvddk  | Highest level of education, Denmark                                |
| eduyrs   | Years of full-time education completed                             |
| wkhct    | Total contracted hours per week in main job overtime excluded      |
| wkhtot   | Total hours normally worked per week in main job overtime included |
| grspnum  | What is your usual \[weekly/monthly/annual\] gross pay             |
| frlgrsp  | Fair level of \[weekly/monthly/annual\] gross pay for you          |
| inwtm    | Interview length in minutes, main questionnaire                    |

# {#Afsnit}Data Frames (Tabeldata i R)

`ess18` er nu et objekt, der indeholder et datasæt. Bemærk at måden vi
danner objektet ikke er anderledes end andre måder, som vi har dannet
objekter: `objectname <- somefunction(something)`.

`ess18` er en “data frame”. En “data frame” er måden R lagrer tabeldata
(data struktureret i rækker og kolonner).

## Udforskning af data frames

For at få et overblik over data, kan man bruge funktionen `head()`:

``` r
head(ess18)
```

    # A tibble: 6 × 17
       idno netustm ppltrst vote  prtvtddk health lvpntyr tygrtr gndr  yrbrn edlvddk
      <dbl>   <dbl>   <dbl> <chr> <chr>    <chr>  <chr>   <chr>  <chr> <dbl> <chr>  
    1  5816      90       7 Yes   SF Soci… Good   1994    60     Male   1974 Mellem…
    2  7251     300       5 Yes   Dansk F… Fair   1993    40     Fema…  1975 Faglig…
    3  7887     360       8 Yes   Sociald… Fair   1983    55     Male   1958 Lang v…
    4  9607     540       9 Yes   Alterna… Good   1982    64     Fema…  1964 Mellem…
    5 11688      NA       5 Yes   Sociald… Very … 1968    50     Fema…  1952 Faglig…
    6 12355     120       5 Yes   Sociald… Fair   1987    60     Male   1963 Faglig…
    # … with 6 more variables: eduyrs <dbl>, wkhct <dbl>, wkhtot <dbl>,
    #   grspnum <dbl>, frlgrsp <dbl>, inwtm <dbl>

`head()` viser de første seks rækker af data, og er god til at tjekke,
om data ser ud, som det skal.

Vi kan tjekke kolonnenavnene (variabelnavnene) med `colnames`.

``` r
colnames(ess18)
```

     [1] "idno"     "netustm"  "ppltrst"  "vote"     "prtvtddk" "health"  
     [7] "lvpntyr"  "tygrtr"   "gndr"     "yrbrn"    "edlvddk"  "eduyrs"  
    [13] "wkhct"    "wkhtot"   "grspnum"  "frlgrsp"  "inwtm"   

`dim` returnerer antallet af rækker og kolonner/variable.

``` r
dim(ess18)
```

    [1] 1285   17

`summary()` bruges til at se deskriptive mål for variable i data (antal,
middelværdi, standardafvigelse, minimum, maksimum, kvartiler).

``` r
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

## Data frames og variable

Data frames består af rækker og kolonner. R forventer typisk at rækkerne
indeholder “observationer” (fx personer), mens kolonner indeholder
variable (information omkring observationerne).

R behandler en enkelt kolonne/variabel som en “vector”. En “vector” er
en samling af værdier af den samme *class* (fx tal eller tekster).

Man udpeger en enkelt kolonne i en data frame med `$` (en “vector”).

``` r
head(ess18$yrbrn) # første seks værdier i yrbrn
```

    [1] 1974 1975 1958 1964 1952 1963

Hver værdi i en variabel har et indeks, som afspejler rækkenummeret i
data.

Man udpeger et specifikt rækkenummer med `[]`:

``` r
ess18$yrbrn[10] # Giver 10. værdi (række 10) af yrbrn variabel
```

    [1] 1958

``` r
ess18$yrbrn[2:10] # Giver række 2 til 10 af yrbrn (begge inkluderet)
```

    [1] 1975 1958 1964 1952 1963 1991 1984 1966 1958

`unique()` giver de unikke værdier i en variabel:

``` r
unique(ess18$health)
```

    [1] "Good"      "Fair"      "Very bad"  "Very good" "Bad"       NA         

# {#Afsnit}Enkeltvarialbe (vectors)

En basal datastruktur i R er en *vector*.

En *vector* er en række af værdier af den samme type (fx en række tal,
en række ord osv.).

En *vector* svarer til en enkelt variabel/kolonne i en dataframe, og man
arbejder med vectors på samme måde, som man arbejder med enkelte
kolonner (samme funktioner kan bruges).

*Vectors* dukker op i mange forskellige sammenhænge i R, da de bruges
hver gang, at man skal specificere en samling af flere værdier.

**Dan en vector**

En vector dannes med `c()`, hvor værdierne adskilles med `,`:

``` r
numbers <- c(2, 9, 11, 7, 12, 14, 4)
```

`numbers` er nu en talrække, som der kan laves beregninger på, ligesom
med en variabel i en dataframe:

``` r
mean(numbers)
```

    [1] 8.428571

``` r
sd(numbers)
```

    [1] 4.353433

# {#Afsnit}Deskriptive mål

R indeholder en række funktioner til at regne specifikke deskriptive
mål, fx `min()` (minimum), `max()` (maksimum), `mean()` (middelværdi),
`sd()` (standardafvigelse) og `length()` (antal værdier/rækker).

``` r
min(ess18$yrbrn) # Mindste værdi
```

    [1] 1929

``` r
max(ess18$yrbrn) # Største værdi
```

    [1] 2003

``` r
mean(ess18$yrbrn) # Middelværdi
```

    [1] 1967.047

``` r
sd(ess18$yrbrn) # Standardafvigelse
```

    [1] 18.29441

``` r
length(ess18$yrbrn) # Antal værdier i variabel (svarer til antal rækker)
```

    [1] 1285

Husk at vi med R kan lagre hvad som helst som et objekt. Hvis vi fx
løbende får brug for at kalde et mål frem, kan vi lagre det som et
objekt for sig:

``` r
mean_yrbrn <- mean(ess18$yrbrn)

print(mean_yrbrn)
```

    [1] 1967.047

# {#Afsnit}Missing-værdier

Data vil ofte indeholde missing-værdier. Missing-værdier angiver
ikke-gyldige værdier; fx et manglende svar, ugyldigt svar, information
der ikke kunne skaffes eller lignende.

Missing-værdier bruges til at give en værdi uden at give en værdi
(cellerne skal indeholde *noget*). Missing-værdier angives som `NA` i R.

BEMÆRK: Det er ikke givet at missing-værdier er kodet som missing på
forhånd i et datasæt. Hvordan missing-værdier kodes varierer mellem
programmer. Derfor bruger man ofte specifikke talværdier (fx 777777
eller 888888) til at indikere missing-værdier. Man kan også stå i
situationer, hvor visse kategorier er irrelevante for analysen, hvor man
så koder disse til missing.

`summary()`-funktionen inkluderer antallet af missing-værdier i
variablen:

``` r
summary(ess18$inwtm)
```

       Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
      18.00   51.00   59.00   63.32   70.00  613.00       5 

Missing-værdier er hverken høje eller lave i R. Dette betyder at det
ikke er muligt at lave beregninger med missing-værdier.

``` r
min(ess18$inwtm) # NA is neither high or low - returns NA
```

    [1] NA

``` r
max(ess18$inwtm) # NA is neither high or low - returns NA
```

    [1] NA

``` r
mean(ess18$inwtm) # NA is neither high or low - returns NA
```

    [1] NA

Ofte er man nødt til at håndtere missing-værdier i sit analysearbejde;
enten ved at erstatte dem eller ved at fjerne rækker, som har
missing-værdier.

Nogle funktioner har indbyggede argumenter til at håndtere
missing-værdier.

### Kan vi fjerne missing i vores beregning?

Ved at kigge på hjælpefilen for `max()`, kan vi finde argumentet
`na.rm`. Dette argument bruges til at fjerne missing, når R laver
beregningen.

Bemærk at argumentet i hjælpefilen er skrevet `na.rm = FALSE`. Dette
angiver standardindstillingen for funktionen. Det vil sige, at hvis ikke
man specificerer andet, så er det den måde, som funktionen køres. I
dette tilfælde er argumentet som standard sat til `FALSE`
(missing-værdier fjernes *ikke*).

Ved at ændre argumentet, når vi bruger funktionen, fjernes
missing-værdierne inden beregning:

``` r
max(ess18$inwtm, na.rm = TRUE)
```

    [1] 613

# {#END} end
