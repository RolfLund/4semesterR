##--## Introduktion til R II - Datahåndtering i R ##-##
# Kodefil til introduktion til R II, 4. semester sociologi, 7. februar 2023


# INDLÆS PAKKER OG DATA ---------------------------------------------------
## Indlæs pakker
library(tidyverse)

## Indlæs data
ess18 <- read_csv('datasets/ESS2018DK_subset.csv')


# SUBSETTING ------------------------------------------------------------------
# Følgende indeholder kodeeksempler for at subsette data med tidyverse (udvælge rækker og kolonner)
# Der dannes for det meste nye dataframes, da de fleste eksempler tager udgangspunkt i data, som det læses ind
# BEMÆRK: Det er ikke normal praksis at lave nye dataframes for hver ændring


## Udvælg rækker med filter (bruger logiske betingelser)
ess18_male <- filter(ess18, gndr == 'Male') # Subset kun med mænd

ess18_edusub <- filter(ess18, eduyrs > 15) # Subset med folk med mere end 15 års uddannelse


## Udvælg kolonner med select
ess18_subset <- select(ess18, idno, gndr, yrbrn, edlvddk) # Udvælg specifikke variable

ess18_subset <- select(ess18, -edlvddk) # Alle variable undtagen edlvddk



# BRUG AF PIPE ------------------------------------------------------------
# Pipe tillader at man kan kombinere datahåndteringsudtryk. 
# På den måde slipper man for, at skulle lave midlertidige dataframes.


## Eksempel uden pipe
ess18_male_subset <- filter(ess18, gndr == 'Male')
ess18_male_subset <- select(ess18, idno, gndr, yrbrn, edlvddk)

## Eksempel med pipe (gør præcis det samme som ovenstående)
ess18_male_subset <- ess18 |> # subset skal tage udgangspunkt i ess18
  filter(gndr == 'Male') |>  # filter data til at indeholde værdier, hvor køn (gndr) er mænd (== 'Male')
  select(idno, gndr, yrbrn, edlvddk) # Udvælg (select) variable idno, gndr, yrbrn, edlvddk



# VARIABELÆNDRINGER -------------------------------------------------------
# Følgende indeholder kodeeksempler for at rekode variable i data med tidyverse
# Der dannes for det meste nye dataframes, da de fleste eksempler tager udgangspunkt i data, som det læses ind
# BEMÆRK: Det er ikke normal praksis at lave nye dataframes for hver ændring


## Variabelændringer med mutate
ess18n <- mutate(ess18, inwth = inwtm / 60) # Regner interviewtid om til timer i ny variabel

ess18n <- mutate(ess18, inwtm = inwtm / 60) # Overskriver eksisterende variabel


## Rekodning af enkelte værdier (recode)
ess18n <- ess18 |>
  mutate(gndr_da = recode(gndr, 'Male' = 'Mand', 'Female' = 'Kvinde')) |>
  select(idno, gndr, gndr_da) # Variable udvælges for nemmere at kunne se forskel


## Rekodning baseret på enkelt betingelse (ifelse)
ess18n <- ess18 |> 
  mutate(lives_home = ifelse(lvpntyr == 'Still in parental home, never left 2 months', 1, 0)) |>
  select(idno, lvpntyr, lives_home) # Variable udvælges for nemmere at kunne se forskel


## Rekod flere værdier (ifelse og %in%)
ess18n <- ess18 |> 
  mutate(healthdum = ifelse(health %in% c('Very bad', 'Bad', 'Fair'), 'Not good', 'Good')) |>
  select(idno, health, healthdum)

### Rekod nogle værdier, men behold andre
ess18n <- ess18 |> 
  mutate(health_r = ifelse(health %in% c('Very bad', 'Bad', 'Fair'), 'Not good', health)) |>
  select(idno, health, health_r)


## Rekod baseret på flere udtryk (case_when)

### Rekoder wkhtot (arbejdstid) til tre kategorier - værdier ikke fanget af betingelser bliver missing
ess18n <- ess18 |>
  mutate(
    wkhtot_cat = case_when(
      wkhtot == 37 ~ '37 timer om ugen',
      wkhtot < 37 ~ 'Mindre end 37 timer',
      wkhtot > 37 ~ 'Mere end 37 timer'
    )
  ) |>
  select(idno, wkhtot, wkhtot_cat)


### Rekoder wkhtot (arbejdstid) til tre kategorier - værdier ikke fanget af betingelser kopieres over
ess18n <- ess18 |>
  mutate(
    wkhtot_cat = case_when(
      wkhtot == 37 ~ '37 timer om ugen',
      wkhtot < 37 ~ 'Mindre end 37 timer',
      wkhtot > 37 ~ 'Mere end 37 timer',
      TRUE ~ as.character(wkhtot)
    )
  ) |>
  select(idno, wkhtot, wkhtot_cat)


### Rekoder wkhtot (arbejdstid) til tre kategorier - værdier ikke fanget af betingelser bliver til missing
ess18n <- ess18 |>
  mutate(
    wkhtot_cat = case_when(
      wkhtot == 37 ~ '37 timer om ugen',
      wkhtot < 37 ~ 'Mindre end 37 timer',
      wkhtot > 37 ~ 'Mere end 37 timer',
      TRUE ~ as.character(NA)
    )
  ) |>
  select(idno, wkhtot, wkhtot_cat)



# HÅNDTERING AF MISSING ---------------------------------------------------------
# Følgende indeholder kodeeksempler for at håndtere missing (kod til missing eller fjern) med tidyverse
# Der dannes for det meste nye dataframes, da de fleste eksempler tager udgangspunkt i data, som det læses ind
# BEMÆRK: Det er ikke normal praksis at lave nye dataframes for hver ændring


## Simpel rekodning til missing med na_if
ess18n <- ess18 |> 
  mutate(vote = na_if(vote, "Not eligible to vote"))


## Rekod til missing baseret på betingelser
ess18n <- ess18 |> 
  mutate(grspnum = ifelse(grspnum > 200000, NA, grspnum))


## Fjern missing med filter (! vender logisk værdi om - is.na() funktion giver TRUE, hvis værdi er missing)
ess18_filter <- filter(ess18, !(is.na(grspnum))) 



# ÆNDRING AF VARIABELTYPE -------------------------------------------------
# R vil tvinge alle værdier til at være samme class/datatype
# Her vises eksempel på at tvinge class/datatype om

ess18n <- mutate(ess18, tygrtr_num = as.numeric(tygrtr)) # tvinger tygrtr til numerisk (alder for ung til at gå på pension)



# VISUALISERING I R MED GGPLOT2 -------------------------------------------------------
ess18_filt <- ess18 |> # Filtrering af data for at undgå ekstreme værdier
  filter(grspnum < 200000)

# Dan scatterplot
ggplot(data = ess18_filt, aes(x = yrbrn, y = grspnum)) + 
  geom_point()