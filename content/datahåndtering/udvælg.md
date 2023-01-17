---
title: Udvælg rækker med filter
weight: 2
---
filter` funktionen tager mindst to input: et datasæt (en dataframe) og
et kriterie.

``` r
library(tidyverse)

ess18_male <- filter(ess18, gndr == 'Male') # Subset kun med mænd

head(ess18_male)
```

    # A tibble: 6 × 17
       idno netustm ppltrst vote  prtvtddk health lvpntyr tygrtr gndr  yrbrn edlvddk
      <dbl>   <dbl>   <dbl> <chr> <chr>    <chr>  <chr>   <chr>  <chr> <dbl> <chr>  
    1  5816      90       7 Yes   SF Soci… Good   1994    60     Male   1974 Mellem…
    2  7887     360       8 Yes   Sociald… Fair   1983    55     Male   1958 Lang v…
    3 12355     120       5 Yes   Sociald… Fair   1987    60     Male   1963 Faglig…
    4 16357     488       5 Yes   Dansk F… Very … 2013    50     Male   1991 Mellem…
    5 20724      60       5 Yes   Venstre… Good   1981    Never… Male   1958 Faglig…
    6 24928     120       8 Yes   Venstre… Very … 1984    Shoul… Male   1965 Mellem…
    # … with 6 more variables: eduyrs <dbl>, wkhct <dbl>, wkhtot <dbl>,
    #   grspnum <dbl>, frlgrsp <dbl>, inwtm <dbl>

``` r
ess18_edusub <- filter(ess18, eduyrs > 15) # Subset med folk med mere end 15 års uddannelse

head(ess18_edusub)
```

    # A tibble: 6 × 17
       idno netustm ppltrst vote  prtvtddk health lvpntyr tygrtr gndr  yrbrn edlvddk
      <dbl>   <dbl>   <dbl> <chr> <chr>    <chr>  <chr>   <chr>  <chr> <dbl> <chr>  
    1  5816      90       7 Yes   SF Soci… Good   1994    60     Male   1974 Mellem…
    2  7887     360       8 Yes   Sociald… Fair   1983    55     Male   1958 Lang v…
    3 19970     240       9 Yes   Liberal… Very … 1984    60     Fema…  1966 Lang v…
    4 22248     121       9 Yes   Sociald… Good   1970    Never… Fema…  1950 Mellem…
    5 24928     120       8 Yes   Venstre… Very … 1984    Shoul… Male   1965 Mellem…
    6 27211     120       7 Yes   Kristen… Fair   1983    60     Male   1969 Mellem…
    # … with 6 more variables: eduyrs <dbl>, wkhct <dbl>, wkhtot <dbl>,
    #   grspnum <dbl>, frlgrsp <dbl>, inwtm <dbl>

{{% notice note %}} Bemærk! Ved brug af `filter` behøves kun at skrive
navnet på variablen (`eduyrs`), og ikke både navn på variabel og
datasæt, som man ellers typisk gør for at referere til enkeltkolonner i
R (`ess18$eduyrs`).

Dette behøves ikke, da `filter` antager, at variabelnavnet kommer fra
det datasæt, som er angivet. Dette er gennemgående for de fleste
`tidyverse` pakker og kommandoer (`filter`, `select`, `mutate` osv.)

{{% /notice %}}

**Logiske udtryk og logiske værdier**

I R skrives kriterier som logiske udtryk. Husk at logiske udtryk altid
returnerer en logisk værdi (`TRUE`, `FALSE` eller `NA`).

En række operationer i R returnerer altid logiske værdier:

- `>`
- `>=`
- `<`
- `<=`
- `==`
- `!=`

`filter()` forventer et logisk udtryk som kriterie, og bevarer så alle
de observationer, som opfylder kriteriet.

# \#{#Afsnit}Udvælg variable med select

`select` tager mindst to input: et datasæt (en dataframe) og en eller
flere variable fra det datasæt, som kan beholdes/gemmes i et nyt
datasæt.

Datasættet er altid første input, hvorefter variable listes i den
rækkefølge, som man gerne vil have dem, adskilt med mellemrum.

``` r
ess18_male_subset <- select(ess18_male, idno, gndr, yrbrn, edlvddk) # Udvælg specifikke variable

head(ess18_male_subset)
```

    # A tibble: 6 × 4
       idno gndr  yrbrn edlvddk                                                     
      <dbl> <chr> <dbl> <chr>                                                       
    1  5816 Male   1974 Mellemlang videregående uddannelse af 3-4 års varighed. Pro…
    2  7887 Male   1958 Lang videregående uddannelse. Kandidatuddannelser af 5.-6. …
    3 12355 Male   1963 Faglig uddannelse (håndværk, handel, landbrug mv.), F.eks. …
    4 16357 Male   1991 Mellemlang videregående uddannelse af 3-4 års varighed. Pro…
    5 20724 Male   1958 Faglig uddannelse (håndværk, handel, landbrug mv.), F.eks. …
    6 24928 Male   1965 Mellemlang videregående uddannelse af 3-4 års varighed. Pro…

`select` kan også bruges til at fravælge bestemte variable ved at sætte
et `-` foran variabel-navnet:

``` r
ess18_male_subset <- select(ess18_male, -edlvddk) # Alle variable undtagen edlvddk
```

`select` indeholder en række funktioner til at vælge variable
forskellige kriterier, herunder: - `starts_with()`: Vælger alle
variable, hvis navne starter med tekststrengen angivet i funktionen -
`contains()`: Vælger alle variable, hvis navn indeholder tekststrengen
angivet i funktionen.

Se mere her: https://dplyr.tidyverse.org/reference/select.html
