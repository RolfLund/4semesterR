---
title: Udvælg variable med select
weight: 3
---
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
