---
title: Rekodning af enkelte kategorier (recode)
weight: 4
---
Funktionen `recode()` tager mindst to input:

- Variabel der skal rekodes
- Værdi der skal ændres (i format \[gammel\] = \[ny\]) Herunder bruges
  `recode()` til at ændre kategorierne for køn til dansk:

``` r
ess18n <- ess18 |>
    mutate(gndr_da = recode(gndr, 'Male' = 'Mand', 'Female' = 'Kvinde')) |>
    select(idno, gndr, gndr_da) # Variable udvælges for nemmere at kunne se forskel

head(ess18n)
```

    # A tibble: 6 × 3
       idno gndr   gndr_da
      <dbl> <chr>  <chr>  
    1  5816 Male   Mand   
    2  7251 Female Kvinde 
    3  7887 Male   Mand   
    4  9607 Female Kvinde 
    5 11688 Female Kvinde 
    6 12355 Male   Mand   

Ved brug af `.default` argumentet, kan man angive en værdi for alle
øvrige værdier (bortset fra missing):

``` r
ess18n <- ess18 |>
    mutate(gndr_da = recode(gndr, 'Male' = 'Mand', .default = 'Ikke mand')) |>
    select(idno, gndr, gndr_da)

head(ess18n)
```

    # A tibble: 6 × 3
       idno gndr   gndr_da  
      <dbl> <chr>  <chr>    
    1  5816 Male   Mand     
    2  7251 Female Ikke mand
    3  7887 Male   Mand     
    4  9607 Female Ikke mand
    5 11688 Female Ikke mand
    6 12355 Male   Mand     

`recode()` er en meget simpel funktion og kan *kun* bruges til at omkode
enkelte værdier. Hvis man skal omkode mange kategorier, bør man derfor
overveje, om variablen kan rekode med betingelser i stedet.
