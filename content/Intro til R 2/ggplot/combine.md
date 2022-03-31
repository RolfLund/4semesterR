---
title: "Combining information in a plot"
draft: false
weight: 3
---

## Combining information with multiple aesthetics and layers

The grammar of `ggplot2` makes it relatively easy to combine a myriad information into a single plot (below is meant more as an illustrative example): 


```R
ggplot(data = ess18_filt, mapping = aes(x = eduyrs, y = grspnum)) +
  geom_point(mapping = aes(colour = gndr, shape = vote, size = netustm)) +
  geom_smooth(colour = 'lightgreen')
```

    `geom_smooth()` using method = 'loess' and formula 'y ~ x'
    
    Warning message:
    "Removed 1 rows containing non-finite values (stat_smooth)."
    Warning message:
    "Removed 34 rows containing missing values (geom_point)."




![png](/output_55_1.png)