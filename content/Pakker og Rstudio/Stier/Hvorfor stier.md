---

title: "Hvorfor stier?"
date: 2021-12-20T19:08:52+01:00
draft: false
weight: 7

---



## Det smarte ved stier

Et spørgsmål man ofte kunne have på dette tidspunkt er, hvorfor er stier smart? Og hvorfor er det vi i det hele taget skal døje med det? Det smarte ved stier og særligt ved "working directory" er, at vi nu kan referere meget nemt til de filer der eksisterer i vores working directory. I mit eksempel tidligere, fik jeg sat mappen: "Eksempel_mappe" som mit working directory. Det betyder, at jeg nu nemt kan bede R om at åbne filer fra den mappe, fordi det er her R "kigger". Jeg kunne have lyst til at åbne den fil der ligger i min mappe. Filen, i det her eksempel, hedder "value99.csv". Det er den eneste fil i min mappe, men der kunne potentielt være en masse forskellige filer i min mappe. Hvis jeg skulle åbne filen uden først at sætte et working directory, så ville jeg være nødt til at bruge den fulde sti til min csv-fil sådan her:

```R
library(tidyverse)
data <- read_csv("C:/Users/Admin/Desktop/Eksempel_mappe/value99.csv")
```

Bemærk, at min sti nu er længere. Det er ikke længere nok at fortælle R hvilken mappe det er i, jeg skal forlænge min sti så den nu inkluderer selve filen (value99.csv) som er mit datasæt. Det vil sige, at den er gået fra at være ```C:/Users/Admin/Desktop/Eksempel_mappe``` til nu af være ```C:/Users/Admin/Desktop/Eksempel_mappe/value99.csv```. Fordi jeg har sat mit working directory som den mappe hvor mit datasæt er placeret, så kan jeg nu referere til min fil i den mappe markant nemmere. Så kan jeg gøre sådan her fremadrettet:

```R
library(tidyverse)
setwd("C:/Users/Admin/Desktop/Eksempel_mappe")
data <- read_csv("value99.csv")
```

Ved at definere mit working directory ved R nu, at så snart jeg beder den om at åbne filer, gemme filer eller gøre noget som helst der har med det jeg laver at gøre, så skal den kigge i den mappe og KUN i den mappe. Hvis jeg har flere datasæt i samme mappe kan jeg nu nemt referere til dem alle sammen udelukkende med navnet på selve datasættet og ikke med den fulde sti her gang.

Jeg kan også nemt tjekke, hvilke filer der er i mit working directory ved at skrive: ```dir()```. Det giver følgende output:

![r_wd5](https://i.postimg.cc/G21ZRbrK/R-WD5.jpg)

Som I kan se, så skriver R, at den har én fil i mappen og at den fil hedder "value99.csv"

