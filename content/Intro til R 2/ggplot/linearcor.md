---
title: "Inspecting a linear correlation"
draft: false
weight: 5
---

## Inspecting a linear correlation

Combining a scatterplot with a smoothed conditional means plot allows for a quick visualization of a possible linear correlation.

The `geom_smooth` geom accepts the argument `method = "lm"`. This fits a linear regression line on the data:


```R
ggplot(data = ess18_filt, aes(x = yrbrn, y = grspnum)) + 
    geom_point() + 
    geom_smooth(method = "lm")
```

    `geom_smooth()` using formula 'y ~ x'


​    


​    
![png](/output_60_1.png)
​    

By default the line is fitted with a 95% confidence interval for the line coloured in. This can be disabled with the `se` argument. The confidence level can be changed with the `level` argument.