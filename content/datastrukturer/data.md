---
title: Data Frames (Tabeldata i R)
weight: 3
---
ess18` er nu et objekt, der indeholder et datasæt. Bemærk at måden vi
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
