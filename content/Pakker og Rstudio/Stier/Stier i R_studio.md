---

title: "Stier i R-studio"
date: 2021-12-20T19:08:52+01:00
draft: false
weight: 6

---



## Hvordan refererer vi til stier?

{{% notice info %}}
Hvis i sidder på en Windows-computer og forsøger manuelt at gøre det første i denne beskrivelse vil i opleve, at i nok får en fejl. Lad derfor være med at manuelt begynde at kopiere stier endnu, men følg guiden som den skrider fremad. Hvis i senere manuelt vil kopiere en sti (når i ved hvor de er), så se punktet: "Skråstregerne vender forkert?" under "Troubleshooting".
{{% /notice %}}

Hvis jeg har lavet en mappe på mit skrivebord der hedder "Eksempel_mappe" og jeg ved hvad stien til mappen er, så skal jeg ende ud med en kommando der hedder:

```setwd("C:/Users/Admin/Desktop/Eksempel_mappe")```

Her bruger jeg kommandoen ```setwd```, der står for "set working directory" til at pege på det sted min mappe eksisterer. Den ligger på C-drevet, hvor der findes en mappe der hedder "Users". I "Users" er der en mappe der hedder "Admin". I mappen "Admin" er der en mappe der hedder "Desktop" og endeligt i mappen "Desktop" er der en mappe der hedder "Eksempel_mappe". Men hvad gør man, hvis man ikke ved hvad stien til den mappe man leder efter hedder?

Den nemmeste løsning er at bruge R-studio til at finde stien. I R kan i trykke på menuen "Session" -> "Set working directory" -> "Choose directory" som vist her:

![WD1](https://i.postimg.cc/V6HZhbB0/R-WD.png)

Når vi trykker på det menupunkt kommer der et lille vindue op. Her skal vi navigere til det sted vi har lagt vores mappe. I mit tilfælde åbner vinduet det sidste sted jeg har været således:

![WD2](https://i.postimg.cc/yxMQ14GV/R-WD2.png)

Når jeg navigerer rundt ender jeg med at finde den mappe jeg har lagt min fil i. Klik på mappen én gang uden at gå ind i mappen. Vi skal ikke vælge filen i mappen, men blot mappen og trykke "open":

![WD3](https://i.postimg.cc/VsJzkqhT/R-WD3.png)

Når vi har valg mappen, kommer vi tilbage til R, som viser følgende i konsollen:

![WD4](https://i.postimg.cc/C5BrpLmP/R-WD4.jpg)

