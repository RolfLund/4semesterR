library(tidyverse)
library(stargazer)

# Indlæs data
ess18 <- read_csv("https://github.com/RolfLund/4semesterR/raw/master/teaching-materials/r-intro/datasets/ESS2018DK_subset.csv")

# Specificer model
grsp_model <- lm(grspnum ~ eduyrs + wkhtot, data = ess18)
# Se resultat med summary
summary(grsp_model)


# Samme som ovenstående i et pipe
ess18 |> 
  lm(formula = grspnum ~ eduyrs + wkhtot) |> 
  summary()


# Sæt bestemt referencekategori for kategorisk variabel
ess18 <- ess18 |> 
  mutate(health = as.factor(health), # laver health om til factor (R's måde at håndtere kategoriske variable)
         health = relevel(health, ref = "Very bad")) # Ændrer referencekategorien, når den bruges i regressionsmodel

# Model med nominalskaleret variabel (health behandlet som nominalskaleret)
grsp_model2 <- lm(grspnum ~ eduyrs + wkhtot + health, data = ess18)
summary(grsp_model2)

## STARGAZER

# Simpelt output med stargazer: model, type af output, filnavn 
stargazer(grsp_model, 
          type = "html", # det anbefales at bruge HTML, da denne filtype kan kopieres over i Word (åben fil, marker alt, kopier over i Word) 
          out = "modeloutput.html") # filnavn som output skal gemmes som - husk at filendelse skal svare til type (.html for type = "html")

# Eksport af én model med tilpasninger
stargazer(grsp_model,   # hvilken model skal ud?
          type = "html",  # hvilken filtype skal modellen ud som?
          out = "grsp_model2.html", # hvad skal filen med modellen gemmes som? (husk arbejdssti/working directory)
          star.cutoffs = c(0.05, 0.01, 0.001), # sæt skæringsværdier for stjernemarkeringer for p-værdier
          decimal.mark = ",", # ændr decimal-adskiller
          digit.separator = ".", # ændr tusinde-adskiller
          covariate.labels = c("Antal års uddannelse", "Arbejdstimer om ugen"), # mærkater for uafhængige variable (obs på rækkefølge - samme som i model)
          dep.var.labels.include = FALSE, # udelad mærkat for afhængig variabel
          dep.var.caption = "", # udelad overskrift for afhængig variabel
          digits = 2, # Antal decimaler
          title = "Effekt af års uddannelse og arbejdstid på løn") # titel





