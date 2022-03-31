---
title: "Visualisering i R med ggplot2"
draft: false
weight: 7
---

## Visualisering i R med `ggplot2`

{{% notice info %}}
Denne sektion er på engelsk, men bliver senere oversat til dansk.
{{% /notice %}}

R (more specifically `ggplot2`) is praised for its visualization capabilities. `ggplot2` allows for a high degree of customization and is incredibly versatile in terms of the kinds of visualization possible.

Cheatsheet: https://raw.githubusercontent.com/rstudio/cheatsheets/master/data-visualization-2.1.pdf

Below is shown how to create a scatterplot with `ggplot2`:


```R
library(ggplot2)

ess18_filt <- ess18 %>%
    filter(grspnum < 200000)

ggplot(data = ess18_filt, aes(x = yrbrn, y = grspnum)) + 
    geom_point()
```


​    
![png](/output_53_0.png)
​    