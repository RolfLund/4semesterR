---

title: "Mapper og stier"
date: 2021-12-20T19:08:52+01:00
draft: false
weight: 5

---



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

