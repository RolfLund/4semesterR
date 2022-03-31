---
title: "Strings (tekstværdier) vs. factors"
draft: false
weight: 4
---

## Strings (tekstværdier) vs. factors

Fordelen ved at bruge factors er, at man kan styre hvordan kategorierne skal forstås af R. Factors tillader også at man kan arbejde med kategorier, som muligvis ikke er til stede i data. Dette er fx brugbart i surveystudier, hvor man kan komme ud for, at visse kategorier ikke er besvaret.


```R
ess18n <- ess18 %>%
    mutate(gndr_3 = factor(gndr, levels = c('Female', 'Male', 'Other')))

table(ess18n$gndr_3)
```


|Female|Male| Other |
|--|--|--|
|630|655|0 |