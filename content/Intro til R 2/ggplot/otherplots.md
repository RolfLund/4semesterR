---
title: "Other plot types/geoms (histogram and boxplot)"
draft: false
weight: 4
---

## Other plot types/geoms (histogram and boxplot)

Because the input for the plot is specified before the actual plot (geom) is chosen, it is easy to switch the plot out with something else.


```R
# histogram of monthly income

ggplot(data = ess18_filt, aes(x = grspnum)) + 
    geom_histogram()
```

    `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.


​    


​    
![png](/output_57_1.png)
​    



```R
# boxplot of monthly income - only geom is changed

ggplot(data = ess18_filt, aes(x = grspnum)) + 
    geom_boxplot()
```


​    
![png](/output_58_0.png)
​    