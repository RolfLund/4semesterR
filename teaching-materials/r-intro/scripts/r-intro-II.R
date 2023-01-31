##--## Introduktion til R II - Datahåndtering i R ##-##
# Kodefil til introduktion til R II, 4. semester sociologi, 7. februar 2023


# Indlæs pakker
library(tidyverse)

# Indlæs data
ess18_df <- read_csv('datasets/ESS2018DK_subset.csv')



# SUBSETTING ------------------------------------------------------------------
# Følgende indeholder kodeeksempler for at subsette data med tidyverse (udvælge rækker og kolonner)
# Der dannes for det meste nye dataframes, da de fleste eksempler tager udgangspunkt i data, som det læses ind
# BEMÆRK: Det er ikke normal praksis at lave nye dataframes for hver ændring


## Udvælg rækker med filter (bruger logiske betingelser)
ess18_male <- filter(ess18_df, gndr == 'Male') # Subset kun med mænd

ess18_edusub <- filter(ess18_df, eduyrs > 15) # Subset med folk med mere end 15 års uddannelse


## Udvælg kolonner med select
ess18_subset <- select(ess18_df, idno, gndr, yrbrn, edlvddk) # Udvælg specifikke variable

ess18_subset <- select(ess18_df, -edlvddk) # Alle variable undtagen edlvddk


# BRUG AF PIPE ------------------------------------------------------------
# Pipe tillader at man kan kombinere datahåndteringsudtryk. 
# På den måde slipper man for, at skulle lave midlertidige data frames.


## Eksempel uden pipe
ess18_male_subset <- filter(ess18_df, gndr == 'Male')
ess18_male_subset <- select(ess18_df, idno, gndr, yrbrn, edlvddk)

## Eksempel med pipe (gør præcis det samme som ovenstående)
ess18_male_subset <- ess18_df |> # subset skal tage udgangspunkt i ess18_df
  filter(gndr == 'Male') |>  # filter data til at indeholde værdier, hvor køn (gndr) er mænd (== 'Male')
  select(idno, gndr, yrbrn, edlvddk) # Udvælg (select) variable idno, gndr, yrbrn, edlvddk


#