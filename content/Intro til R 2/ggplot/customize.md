---
title: "Customizing a ggplot"
draft: false
weight: 6
---

## Customizing the plot

A ggplot can be customized in a wide variety of ways. Here the most simple changes and additions are covered.

### Labels

Labels can be added for each aesthetic used in the graph with the function `labs`:


```R
ggplot(data = ess18_filt, mapping = aes(x = eduyrs, y = grspnum, colour = gndr, size = netustm)) +
    geom_point() + 
    labs(x = 'Years of education', y = 'Usually monthly gross pay', colour = 'Gender', size = 'Time spent on internet per day')
```

    Warning message:
    "Removed 33 rows containing missing values (geom_point)."




![png](/output_64_1.png)
    


### Title

A title can be added using either `ggtitle()` or with `labs()`.


```R
ggplot(data = ess18_filt, mapping = aes(x = eduyrs, y = grspnum, colour = gndr, size = netustm)) +
    geom_point() + 
    labs(x = 'Years of education', y = 'Usually monthly gross pay', colour = 'Gender', size = 'Time spent on internet per day') + 
     ggtitle('Education and Pay')
```

    Warning message:
    "Removed 33 rows containing missing values (geom_point)."




![png](/output_66_1.png)
    



```R
ggplot(data = ess18_filt, mapping = aes(x = eduyrs, y = grspnum, colour = gndr, size = netustm)) +
    geom_point() + 
    labs(title = 'Education and Pay', x = 'Years of education', y = 'Usually monthly gross pay', colour = 'Gender', size = 'Time spent on internet per day')
```

    Warning message:
    "Removed 33 rows containing missing values (geom_point)."




![png](/output_67_1.png)
    


### Legend

The legend uses values from the data. If one wants to change the legend for the plot, it can be done with the appropriate scale function:


```R
ggplot(data = ess18_filt, mapping = aes(x = eduyrs, y = grspnum, colour = gndr, size = netustm)) +
    geom_point() + 
    labs(title = 'Education and Pay', x = 'Years of education', y = 'Usually monthly gross pay', colour = 'Gender', size = 'Time spent on internet per day') + 
    scale_colour_discrete(labels = c('Kvinde', 'Mand'))
```

    Warning message:
    "Removed 33 rows containing missing values (geom_point)."




![png](/output_69_1.png)
    


### Themes

ggplot contains a wide variety of standard themes (https://ggplot2.tidyverse.org/reference/index.html#section-themes). It is also possible to setup one's own theme. Below the `theme_minimal` is used:


```R
ggplot(data = ess18_filt, mapping = aes(x = eduyrs, y = grspnum, colour = gndr, size = netustm)) +
    geom_point() + 
    labs(title = 'Education and Pay', x = 'Years of education', y = 'Usually monthly gross pay', colour = 'Gender', size = 'Time spent on internet per day') + 
    scale_colour_discrete(labels = c('Kvinde', 'Mand')) + 
    theme_minimal()
```

    Warning message:
    "Removed 33 rows containing missing values (geom_point)."




![png](/output_71_1.png)