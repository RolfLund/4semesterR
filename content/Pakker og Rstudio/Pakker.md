---

title: "Pakker"
date: 2021-12-20T19:08:52+01:00
draft: false
weight: 3

---



## Hvad er pakker?

R er anderledes end de programmer i normalt bruger på jeres computer. Når i åbner Word, Excel, Chrome, Firefox eller måske Sims, så er antagelsen at "hele" programmet er der per automatik. Vi behøver ikke nødvendigvis installere ekstra ting for, at det virker som det skal. Nogle gange henter vi et tilføjelsesprogram som f.eks. add-blocker eller en mod til et spil der gør oplevelsen en lille smule bedre, men for det meste er grundessensen af programmet der ved installation.

I R fungerer det anderledes. R er open source hvilket vil sige, at der er et stort fællesskab omkring udviklingen af metoder og programmer, der løser meget specifikke opgaver. For ikke at gøre R uendeligt stort med et utal af ekstra funktioner kommer R (og RStudio) kun med de ting der er en del af "Base R" - hvilket vil sige, at programmet i udgangspunktet kun kan det, som R selv kan løse. Ved at installere pakker åbner man op for nye kommandoer, nye metoder og nye analyseredskaber. Man kan derfor se pakker som en udvidelse af den funktionalitet som R har i sig selv.



## Hvor er pakkerne?

For at installere en pakke kan man gøre det på to måder. Oftest lærer i langsomt, at det er hurtigere at installere pakkerne via kommando-linjen, men til at starte med kan i navigere hen til R's "package manager" i menuen "Tools":

![Pack_man](https://i.postimg.cc/GtSRj8hv/pack-man.png)

Når i trykker på det markerede vil i se denne lille boks:

![pack_ins1](https://i.postimg.cc/PJqhZzht/pack1.jpg)

I kan lade alt være som det er, men i skal bruge det felt der hedder "Packages" til at søge i. Her kan i f.eks. skrive stargazer. I vil se, at som i begynder at skrive, så kommer der valgmuligheder op af pakker der har samme startbogstaver. Lad være med at installere i vildskab - der kan opstå konflikter mellem pakker. Når i har fundet stargazer kan i trykke på "Install". I vil kunne se i konsollen, at den installerer og ser sådan her ud, når den er færdig:

![pack_inst](https://i.postimg.cc/FRpN7CMW/pack-inst.png)

R's måde at sige, at pakken er installeret på korrekt er ved at skrive: "Package XXX succssefully unpacked and MD5 sums checked".

## Installation gennem kommado-vinduet

En nemmere måde at installere pakker på, som i senere bliver fortrolig med er gennem kommando-vinduet. Her kan i simpelt skrive:

``install.packages('stargazer')``

Og trykke enter. Hvis i allerede har gjort det gennem pakkehåndteringsværktøjet ovenfor med stargazer kan i nu forsøge at installere pakken ``tidyr`` som vi kommer til at bruge en del gennem kurset. I installerer ``tidyr`` ved at skrive:

``install.packages('tidyr')``
