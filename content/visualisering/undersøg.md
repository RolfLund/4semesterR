---
title: Undersøg lineær sammenhæng
weight: 3
---
Ved at kombinere et scatterplot med et plot, der fitter en linje til at
passe på data (`geom_smooth`) kan man visuelt inspicere den umiddelbare
sammenhæng mellem to variable.

`geom_smooth` har et `method` argument, hvor man angiver, hvordan linjen
skal fittes. `method = "lm"` fitter den bedste rette linje mellem x og
y:

``` r
ggplot(data = ess18_filt, aes(x = yrbrn, y = grspnum)) + 
    geom_point() + 
    geom_smooth(method = "lm")
```

![png](/output_60_1.png)

Som standard fittes linjen med et 95% konfidensinterval for linjen.
Dette kan slås fra med argumentet `se`. Konfidensniveauet kan ændres med
argumentet `level`.
