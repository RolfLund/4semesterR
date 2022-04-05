---

title: "Stier"
date: 2021-12-20T19:08:52+01:00
draft: false
weight: 5

---



## Hvad er stier?

En "sti" er en måde at referere til, hvor "ting" eksisterer på en computer. Samtlige computere (Windows, Mac, Linux, Chromebooks) benytter sig af stier for at kunne finde elementer den skal bruge når man klikker på et ikon, billede eller andet. Når i f.eks. trykker på et program eller en app som er på skrivebordet eller i jeres menu-linje nederst på skærmen, så kan computeren kun forholde sig til hvad det ikon er, fordi ikonet indeholder information om, hvad det skal gøre når i klikker der. En genvej på skrivebordet er derfor, helt simpelt, bare en funktion til at finde hen til det sted hvor en bestemt fil eller mappe ligger. På de fleste Windows-computere er stistrukturen ret ens. F.eks. er mappestrukturen til den bruger jeg sidder på nu:

```C:\Users\Rolf```

Det refererer til, at min Windows-bruger er placeret på C-drevet (den primære harddisk på min computer). For hvert element der kommer efter "C:\" taler vi om mapper. Hvis man skulle beskrive ovenstående sti i menneskeord, så kunne man sige, at i min harddisk ("C:") findes der en mappe der hedder "Users" og i mappen "Users" er der en mappe der hedder "Rolf". Stier kan enten være generelle, som i første eksempel, eller de kan være enormt specifikke, hvor de refererer til en enkelt fil der ligger i tonsvis af undermapper. F.eks. kan jeg referere til en enkelt fil i mange undermapper ved stien:

```C:\Users\Admin\Jedi\Jedi\CPython-37-33\a86889ca0\d5efe8caf92ebc20d\f9ce4ba22ff117\a9fc16bd81614.pkl```

Men hvad har det med R at gøre? R, som alle andre programmer, har brug for at vide, hvordan den skal finde specifikke elementer på jeres computer. Hvis vi smadder gerne vil have den til at bruge et bestemt datasæt som ikke ligger på nettet, så skal vi vide hvor det datasæt er på vores computer. Det kan vi gøre på mange forskellige måder og denne side viser jer et par eksempler på, hvordan vi gør det nemmest.



## Vi laver en mappe

R, om det er på Windows eller Mac, har samme måde den forstår hvor filer ligger. Generelt er det en fordel at have styr på, hvor i placerer jeres data når i får det udleveret, før i giver jer til at specificere noget i R. Som eksempel kan i starte med at lave en mappe på jeres skrivebord eller et andet sted på jeres computer, hvor i plejer at ligge jeres undervisningsmateriale. En almindelig struktur vi ofte ser er, at i har lavet mapper for jeres semester som igen er opdelt i moduler. Det kunne være, at i har lavet en mappe der hedder "4. semester" og i, i den mappe, har lavet en mappe der hedder: "Modul 11". I så fald ville det være fornuftigt at lave en mappe i "Modul 11". Placeringen er i virkeligheden mindre vigtig her, så længe i kan huske hvor i laver jeres nye mappe. I den mappe kan i prøve at placere csv-fil (eller et andet datasæt) som i har fået udleveret til en af øvelserne til forelæsningerne. Før i går videre herfra, så skal i have lavet en mappe med et datasæt i. Når i har gjort det, så læs videre.



## Hvordan refererer vi til stier?

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

