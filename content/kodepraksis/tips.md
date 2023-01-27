---
title: "Tips til god kodepraksis"
date: 2023-01-27T08:26:22+01:00
draft: false
---



Herunder ses eksempler på hhv. god og dårlig kodepraksis. Koderne gør i princippet fuldstændig det samme (skift mellem eksemplerne bed brug af fane-knapperne).

{{< tabs >}}
{{% tab name="God" %}}
```R
library(tidyverse)

setwd('./data') # Arbejdssti til datamappe

# Indlæs data
ess18_df <- read_csv('ESS18DK_subset.csv')


# Datahåndtering
overtime_df <- ess18_df |> 
  mutate(overtime = wkhtot - wkhct) |> # variabel for overtid
  filter(yrbrn > 1980, # Vælger folk født efter 1980
         overtime > 0, # Vælger kun folk, som arbejder mere end ansat til
         !is.na(grspnum)) # Må ikke være missing i månedsløn


# Visualisering
ggplot(overtime_df, aes(x = overtime, y = grspnum, colour = gndr)) + 
  geom_point() # Laver punktdiagram
```
{{% /tab %}}
{{% tab name="Dårlig" %}}
```R
data1<-read_csv('c:/bruger/brugernavn/meget langt mappenavn som er meget specifikt for denne pc/studie/studie2/sociologi/4sem/kvant/r/data/ESS18DK_subset.csv')
install.packages('tidyverse')
library(tidyverse)
data2  <-read_csv('c:/bruger/brugernavn/meget langt mappenavn som er meget specifikt for denne pc/studie/studie2/sociologi/4sem/kvant/r/data/ESS18DK_subset.csv')
head(data1)
      head(data2)
colnmes(data2)
colnames(data2)
  data3<-data1
Data3<-data2
Data3$overtid<-data2$wkhtot-data$wkhct
print(Data3)
print(data3$overtid)
print(Data3$overtid[1:10])

filter(Data3,overtid >0)
data.4<-filter(Data3,overtid>0)
data.4<-filter(data.4,yrbrn<1980) # filter
head(data.4$yrbrn)
data.4<-filter(data3,overtid>0)
data.4<-filter(data.4,yrbrn>1980)
is.na(grspnum)
is.na(data.4$grspnum)
data_5<-filter(data.4,    
              !(is.na(grspnum)))
ggplot(data_5)
ggplot(data_5,aes(x=overtid,y=grspnum,colour=gndr))+
  geom_point()
```
{{% /tab %}}
{{< /tabs >}}



God kodepraksis er ikke blot et spørgsmål om, at koden virker. Det er i lige så høj grad et spørgsmål om, hvorvidt koden kan læses og forstås af andre.



## Tips til god kodepraksis

1. Brug kommentarer!
2. Brug sigende navne til objekter (fx `_df` for at angive at det er en data frame)
3. Behold kun kode der er relevant for at foretage analysen (fjern fx prints og linjer, der ikke har konsekvens for analysen)
4. Vær konsistent i navngivning af objekter (skift ikke mellem brug af `_`, `.` og brug af versaler)
5. Brug mellemrum og linjeskift for at gøre koden mere overskuelig (men vær konsistent!)



## Brug af kommentarer

God kode er kode med *masser* af kommentarer!

*Kommentarer kan bruges til:*

- Give kodeblokke overskrifter
- Skrive forklaringer
- Notere kritiske valg i koden (hvorfor fx et specifikt argument i funktion bruges)
- Skrive relevante henvisninger ind
- Skrive ting ind at være opmærksom på (fx hvis noget tager lang tid at køre)

Er du i tvivl? *Skriv en kommentar!*
