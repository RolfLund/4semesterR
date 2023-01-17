---
title: Indlæsning af data
weight: 2
---
I koden herunder indlæses data fra en csv-fil og gemmes i objektet
`ess18`:

``` r
library(tidyverse)

ess18 <- read_csv("https://github.com/RolfLund/4semesterR/raw/master/teaching-materials/r-intro/datasets/ESS2018DK_subset.csv")
```

`read_csv` er en del af tidyverse (mere specifikt pakken `readr`).

R har også en basisfunktion til at indlæse csv-filer (`read.csv`), men
`read_csv` er mere effektiv.

### Indlæsning med peg og klik

Data kan også indlæses med peg-og-klik under “File”-\>“Import dataset”.
Her hjælper RStudio med importen af data:

![impdat](/impdat.png)

### Data brugt i undervisningen: European Social Survey 2018

Til R introduktionerne bruger vi et udsnit af European Social Survey fra
2018 (https://www.europeansocialsurvey.org/). Data indeholder kun den
danske del af data, nogle udvalgte variable samt nogle få filtreringer.

- Kodebog kan findes her:
  https://www.europeansocialsurvey.org/docs/round9/survey/ESS9_appendix_a7_e03_1.pdf
- Spørgeskeamet brugt i undersøgelsen kan findes her:
  https://www.europeansocialsurvey.org/docs/round9/fieldwork/source/ESS9_source_questionnaires.pdf

**Datasættet indeholder følgende variable:**

| variabel | beskrivelse                                                        |
|----------|--------------------------------------------------------------------|
| idno     | Respondent’s identification number                                 |
| netustm  | Internet use, how much time on typical day, in minutes             |
| ppltrst  | Most people can be trusted or you can’t be too careful             |
| vote     | Voted last national election                                       |
| prtvtddk | Party voted for in last national election, Denmark                 |
| health   | Subjective general health                                          |
| lvpntyr  | Year first left parents for living separately for 2 months or more |
| tygrtr   | Retire permanently, age too young. SPLIT BALLOT                    |
| gndr     | Gender                                                             |
| yrbrn    | Year of birth                                                      |
| edlvddk  | Highest level of education, Denmark                                |
| eduyrs   | Years of full-time education completed                             |
| wkhct    | Total contracted hours per week in main job overtime excluded      |
| wkhtot   | Total hours normally worked per week in main job overtime included |
| grspnum  | What is your usual \[weekly/monthly/annual\] gross pay             |
| frlgrsp  | Fair level of \[weekly/monthly/annual\] gross pay for you          |
| inwtm    | Interview length in minutes, main questionnaire                    |
