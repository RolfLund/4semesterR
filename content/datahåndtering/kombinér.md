---
title: Kombinér datahåndteringsfunktioner med pipe (|>)
weight: 5
---
Det bliver hurtigt omstændeligt at foretage flere
datahåndteringsoperationer, hvis man skal specificere navnet på
datasættet hver gang. Dette kan forsimples ved brug af “pipe”-operatoren
(`|>`).

Et “pipe” fungerer kort sagt ved at erstatte det første argument i
funktionen til højre for pipet med outputtet på venstre side af pipet
(typisk opbrudt med linjeskift for at gøre det nemmere at læse).

Man bruger for det meste pipe i forbindelse med datahåndtering, da man
på den måde undgår at skulle lave midlertidige data frame objekter
undervejs, men blot kan sammenkæde datahåndteringer i et langt pipe.

**Flere datahåndteringsudtryk uden pipe**

Herunder dannes et subet af ESS18, der indeholder alle mænd og
variablene `idno`, `gndr`, `yrbrn`, `edlvddk`:

``` r
ess18_male_subset <- filter(ess18, gndr == 'Male')
ess18_male_subset <- select(ess18, idno, gndr, yrbrn, edlvddk)

head(ess18_male_subset)
```

    # A tibble: 6 × 4
       idno gndr   yrbrn edlvddk                                                    
      <dbl> <chr>  <dbl> <chr>                                                      
    1  5816 Male    1974 Mellemlang videregående uddannelse af 3-4 års varighed. Pr…
    2  7251 Female  1975 Faglig uddannelse (håndværk, handel, landbrug mv.), F.eks.…
    3  7887 Male    1958 Lang videregående uddannelse. Kandidatuddannelser af 5.-6.…
    4  9607 Female  1964 Mellemlang videregående uddannelse af 3-4 års varighed. Pr…
    5 11688 Female  1952 Faglig uddannelse (håndværk, handel, landbrug mv.), F.eks.…
    6 12355 Male    1963 Faglig uddannelse (håndværk, handel, landbrug mv.), F.eks.…

Ovenstående kode er omstændelig af flere grunde: For det første skal
navnet på det endelige subset `ess18_male_subset` gentages for hver
datahåndteringsudtryk. For det andet skal input data frame (`ess18`)
også gentages hver gang.

**Flere datahåndteringsudtryk med pipe**

Med et pipe kan flere udtryk kædes sammen, så man undgår at lave
midlertidige data frame objekter samt at skulle skrive navn på input
data frame:

``` r
ess18_male_subset <- ess18 |> # subset skal tage udgangspunkt i ess18
    filter(gndr == 'Male') |> # filter for mænd - datainput er output af ovenstående (en kopi af ess18)
    select(idno, gndr, yrbrn, edlvddk) # udvælg variable - datainput er output af ovenstående (ess18 filtreret for mænd)

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
