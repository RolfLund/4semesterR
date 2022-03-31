---
title: "Datahåndtering og visualisering i R: Et eksempel"
draft: false
weight: 2
---

## Datahåndtering og visualisering i R: Et eksempel

Herunder foretages en række datahåndteringer på European Social Survey 2018 delsættet. Vi bruger dagen i dag på at forstå de forskellige datahåndteringsfunktioner (primært fra `tidyverse` - specifikt pakken `dplyr`).


```R
library(dplyr)

ess18_wh <- ess18 %>%
    mutate(age = 2018 - yrbrn) %>%
    filter(age >= 25) %>%
    filter(!(is.na(wkhtot))) %>%
    mutate(wkhtot_cat = case_when(
        wkhtot == 37 ~ "37 timer om ugen",
        wkhtot < 37 ~ "Mindre end 37 timer",
        wkhtot > 37 ~ "Mere end 37 timer")
          ) %>%
    mutate(wkhtot_cat = factor(wkhtot_cat, levels = c("Mindre end 37 timer", "37 timer om ugen", "Mere end 37 timer"), 
                               ordered = TRUE)) %>%
    mutate(gndr = factor(gndr, levels = c("Male", "Female"), labels = c("Mand", "Kvinde"))) %>%
    select(gndr, age, wkhtot, wkhtot_cat, netustm)
```

Herunder dannes et barplot baseret på det sæt, som blev dannet i ovenstående kode. Vi vil ligeledes bruge dagen i dag på at forstå, hvordan denne visualisering er dannet (med brug af `ggplot2` - også en del af `tidyverse`)


```R
library(ggplot2)

ggplot(ess18_wh, aes(x = wkhtot_cat, y = (..count..)/sum(..count..), fill = gndr)) + 
    geom_bar(position = "dodge") + 
    scale_y_continuous(labels = scales::percent) + 
    labs(title = "Arbejdstid fordelt på køn",
         x = "Arbejdstid",
         y = "Procent", 
         fill = "Køn")
```



![barplot](/output_7_0.png)