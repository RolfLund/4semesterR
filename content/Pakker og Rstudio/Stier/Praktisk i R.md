---

title: "Praktisk i R"
date: 2021-12-20T19:08:52+01:00
draft: false
weight: 8

---



## Hvad gør vi i praksis?

Fordelen ved at vælge working directory gennem menuerne i R er, at vi kan reproducere det i vores script. Kommandoen ```setwd()``` bliver genereret når vi er gået igennem menuerne og det kan tilføjes vores script. Output i mit eksempel er som nedenfor:

![r_wd5](https://i.postimg.cc/G21ZRbrK/R-WD5.jpg)

Hvis man skal bruge det aktivt i sit script kan man kopiere det output ind i ens script sådan at man fremadrettet ikke skal definere et nyt working directory indtil man har brug for at starte et nyt projekt med en ny mappe. Som eksempel kunne et script se sådan ud i begyndelsen:

```R
# Vi henter nogle biblioteker først
library(tidyverse)
library(stargazer)

# Vi sætter vores working directory og indlæser vores data
setwd("C:/Users/Admin/Desktop/Eksempel_mappe")
data <- read_csv("value99.csv")
```

