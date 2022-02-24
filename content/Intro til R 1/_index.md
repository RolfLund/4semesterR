---
title: "Intro til R 1"
date: 2021-12-20T08:08:52+01:00
draft: false
weight: 7
---

## Første intro til R

Til denne undervisningsgang introduceres I til R. Undervisningsgangen kombinerer præsentation, demonstration og øvelser.



### Pakker brugt i undervisningsgangen

Vi bruger forskellige pakker fra samlingen "tidyverse": https://www.tidyverse.org/. Alle pakker kan installeres ved blot at installere "tidyverse" (`install.packages("tidyverse")`). Specifikt bruges følgende pakker:

- `readr`: https://readr.tidyverse.org/
- `dplyr`: https://dplyr.tidyverse.org/

I kan med fordel installere pakkerne før undervisningsgangen. Se yderligere forklaring om installation af pakker [her]({{< relref "../Pakker og Rstudio/Pakker" >}}).

Hvis I har pakkerne installeret, bør I kunne køre nedenstående kode uden fejl (I får muligvis advarsler/warnings, men det er forventet):

```R
library(readr)
library(dplyr)
```



### Data brugt i undervisningen

Til R introduktionerne bruger vi et udsnit af European Social Survey fra 2018 (https://www.europeansocialsurvey.org/). Udsnittet indeholder nogle udvalgte variable fra den danske del af data med nogle få filtreringer.

- Kodebog for hele datasættet kan findes her: https://www.europeansocialsurvey.org/docs/round9/survey/ESS9_appendix_a7_e03_1.pdf
- Spørgeskemaet brugt i undersøgelsen kan findes her: https://www.europeansocialsurvey.org/docs/round9/fieldwork/source/ESS9_source_questionnaires.pdf



#### Link til data

I vil i løbet af undervisningsgangen blive bedt om at indlæse data. Hertil bruges et direkte link til data.

- Brug dette link, når I skal læse data ind: https://github.com/RolfLund/4semesterR/raw/master/teaching-materials/r-intro/datasets/ESS2018DK_subset.csv (I skal ikke klikke på det, men bruge det i R-kode).

Data læses ind i R med følgende kode:

```R
library(readr)

ess18 <- read_csv("https://github.com/RolfLund/4semesterR/raw/master/teaching-materials/r-intro/datasets/ESS2018DK_subset.csv")
```



#### Indhold i data

Datasættet indeholder følgende variable:

| variabel | beskrivelse                                                  |
| -------- | ------------------------------------------------------------ |
| idno     | Respondent's identification number                           |
| netustm  | Internet use, how much time on typical day, in minutes       |
| ppltrst  | Most people can be trusted or you can't be too careful       |
| vote     | Voted last national election                                 |
| prtvtddk | Party voted for in last national election, Denmark           |
| health   | Subjective general health                                    |
| lvpntyr  | Year first left parents for living separately for 2 months or more |
| tygrtr   | Retire permanently, age too young. SPLIT BALLOT              |
| gndr     | Gender                                                       |
| yrbrn    | Year of birth                                                |
| edlvddk  | Highest level of education, Denmark                          |
| eduyrs   | Years of full-time education completed                       |
| wkhct    | Total contracted hours per week in main job overtime excluded |
| wkhtot   | Total hours normally worked per week in main job overtime included |
| grspnum  | What is your usual [weekly/monthly/annual] gross pay         |
| frlgrsp  | Fair level of [weekly/monthly/annual] gross pay for you      |
| inwtm    | Interview length in minutes, main questionnaire              |

