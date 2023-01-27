---
title: Håndtering af missingværdier
weight: 4
---
Missingværdier er angivet med `NA` i R.

Som vist ved beregning af deskriptive mål (middelværdi,
standardafvigelse osv.), så kan R ikke lave beregninger på
missingværdier. Ved nogle beregninger frasorterer R missingværdierne
automatisk inden beregning, men andre gange skal man selv specificerer,
hvad der skal ske med missingværdierne.

Man har derfor typisk brug for at kunne identificere hvilke værdier i
datasættet, der er missing. `NA` er dog en speciel værdi, så den kan
ikke bruges i et filter på samme måde som andre værdier.

I nedenstående forsøges at udvælge de respondenter fra `ess18_male`
subsettet, som *ikke* er missing i `grspnum` (selvangivet månedlig
indkomst):

``` r
ess18_male_filter <- filter(ess18_male, grspnum != NA)

head(ess18_male_filter)
```

    # A tibble: 0 × 17
    # … with 17 variables: idno <dbl>, netustm <dbl>, ppltrst <dbl>, vote <chr>,
    #   prtvtddk <chr>, health <chr>, lvpntyr <chr>, tygrtr <chr>, gndr <chr>,
    #   yrbrn <dbl>, edlvddk <chr>, eduyrs <dbl>, wkhct <dbl>, wkhtot <dbl>,
    #   grspnum <dbl>, frlgrsp <dbl>, inwtm <dbl>

Ovenstående returnerer ingen rækker, da man ikke kan arbejde med
missingværdier på den måde i R.

For at identificere missingværdier bruges funktionen `is.na()`.
Funktionen spørger “er værdien missing?” og returner `TRUE`/`FALSE`
(`TRUE` hvis missing; ellers `FALSE`):

``` r
head(is.na(ess18_male$grspnum)) # Er de første seks værdier i grspnum missing?
```

    [1] FALSE FALSE FALSE FALSE FALSE FALSE

Funktionen kan bruges til at finde de observationer, som *er* missing.
Hvordan vælges så dem, som *ikke* er missing?

En simpel måde at vælge de observationer, som *ikke* er missing, er ved
at “vende” udtrykket om, sådan at det evaluerer til `TRUE`, hvis de
*ikke* er missing.

I R kan logiske udtryk vendes om ved at bruge `!` foran udtrykket (ved
at “vende om” menes, at `TRUE` bliver til `FALSE`, og `FALSE` bliver til
`TRUE`:

``` r
!(2 < 4) # 2 er mindre end fire, men giver FALSE, da det vendes om med !
```

    [1] FALSE

`!` kan også bruges i kombination med `is.na()`:

``` r
head(!(is.na(ess18_male$grspnum))) # Er de første seks værdier i grspnum ikke missing?
```

    [1] TRUE TRUE TRUE TRUE TRUE TRUE

Med ovenstående kan man udelukkende vælge de respondenter, som ikke er
missing:

``` r
ess18_male_filter <- filter(ess18_male, !(is.na(grspnum)))

head(ess18_male_filter)
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
