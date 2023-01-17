---
title: Andre plots/geoms (histogram og boxplot)
weight: 2
---
Fordi data, som skal visualiseres (data, aesthetics), specificeres inden
typen af visualiering (geom), kan man nemt udskifte denne:

``` r
# histogram over månedlig

ggplot(data = ess18_filt, aes(x = grspnum)) + 
    geom_histogram()
```

![png](/output_57_1.png)

``` r
# boxplot of monthly income - only geom is changed

ggplot(data = ess18_filt, aes(x = grspnum)) + 
    geom_boxplot()
```

![png](/output_58_0.png)

Bemærk at første linje af kodestykkerne til at lave de to plots er
identiske. Det eneste, som skiftes ud, er geom-funktionen.
