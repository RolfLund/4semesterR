---
title: Labels i en factor
weight: 3
---
`factor()` funktionen har også et `labels` argument. Denne bruges til at
angive, hvad værdierne i factoren skal hedde. Som standard antager R, at
`labels` skal være det samme som `levels`, men man kan vælge at
specificere andre labels. Disse skal så angives i samme rækkefølge som
labels:

``` r
ess18n <- ess18 |>
    mutate(health_r = factor(health, levels = c('Very bad', 'Bad', 'Fair', 'Good', 'Very good'), 
                             labels = c('Meget dårligt', 'Dårligt', 'Jævnt', 'Godt', 'Meget godt'), 
                             ordered = TRUE))

unique(ess18n$health_r)
```

    [1] Godt          Jævnt         Meget dårligt Meget godt    Dårligt      
    [6] <NA>         
    Levels: Meget dårligt < Dårligt < Jævnt < Godt < Meget godt

At specificere `labels` er principielt en rekodning af værdierne. Man
kan derfor bruge denne funktionalitet til at slå kategorier sammen også:

``` r
ess18n <- ess18 |>
    mutate(health_r = factor(health, levels = c('Very bad', 'Bad', 'Fair', 'Good', 'Very good'), 
                             labels = c('Dårligt', 'Dårligt', 'Jævnt', 'Godt', 'Godt'), 
                             ordered = TRUE))

unique(ess18n$health_r)
```

    [1] Godt    Jævnt   Dårligt <NA>   
    Levels: Dårligt < Jævnt < Godt