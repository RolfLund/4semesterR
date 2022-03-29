```R
library(readr)

ess18 <- read_csv("https://github.com/RolfLund/4semesterR/raw/master/teaching-materials/r-intro/datasets/ESS2018DK_subset.csv")
```

    [1mRows: [22m[34m1285[39m [1mColumns: [22m[34m17[39m
    
    [36m--[39m [1mColumn specification[22m [36m------------------------------------------------------------------------------------------------[39m
    [1mDelimiter:[22m ","
    [31mchr[39m  (7): vote, prtvtddk, health, lvpntyr, tygrtr, gndr, edlvddk
    [32mdbl[39m (10): idno, netustm, ppltrst, yrbrn, eduyrs, wkhct, wkhtot, grspnum, frl...
    
    
    [36mi[39m Use [30m[47m[30m[47m`spec()`[47m[30m[49m[39m to retrieve the full column specification for this data.
    [36mi[39m Specify the column types or set [30m[47m[30m[47m`show_col_types = FALSE`[47m[30m[49m[39m to quiet this message.
    
    

# Introduktion til R (del 2)

*4. semester sociologi, 2022*

## Program

- Hvorfor er datahåndtering så vigtigt?
- Datahåndtering og visualisering i R: Et eksempel
- Subsetting (`filter` og `select`)
- Nye variable og rekodning (`mutate`)
- Kategoriske variable ("factors" i R)
- Visualisering i R med `ggplot`

#### Hvis vi når det
- Lav dine egne funktioner i R
- Opsummeringer af data med `group_by()` 

## HUSK!

Al materiale fra i dag kan findes på kursussiden: https://rolflund.github.io/4semesterR/ (sektionerne "Intro til R I" og "Intro til R II")

Bogen "R for Data Science" introducerer til datahåndtering og visualiseirng, og kan tilgås gratis online: https://r4ds.had.co.nz/

<center><a href = "https://r4ds.had.co.nz/"> <img src="https://d33wubrfki0l68.cloudfront.net/b88ef926a004b0fce72b2526b0b5c4413666a4cb/24a30/cover.png" width="200"/></a></center>

Brug Google (eller anden søgemaskine)!

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


    
![png](output_7_0.png)
    

