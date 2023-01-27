---
title: R Libraries (pakker)
weight: 7
---
Fordi R er “open source”, bliver der konstant tilføjet nye funktioner
til R. Funktioner, som andre har lavet, kan læses ind via “R pakker”,
som kan gøres til del af ens “R bibliotek”.

Alle kommandoer indtil videre har været del af `base` pakken (del af R
fra starten).

Pakker kan installeres enten gennem konsolen eller gennem peg-og-klik.

R adskiller mellem installation og indlæsning. Dette for at undgå
konflikter mellem pakker.

Funktioner fra en pakke læses ind i arbejdsmiljøet på følgende måde
(pakkenavn *uden* citationstegn!):

`library(packagename)`

### Installation gennem konsol

Pakker kan installere på følgende måde (pakkenavn *med* citationstegn!):

`install.packages('packagename')`

### Installation med peg og klik

Gå i “Packages”-fanen i vinduet med “Files, Plots, Packages, Help,
Viewer”:

![pckwin](/pckwin.png)

Tryk “Install”. Skriv navnet på pakkerne i andet felt adskilt med
mellemrum og tryk “Install”:

![pckinst](/pckinst.png)
