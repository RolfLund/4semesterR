---

title: "Stier"
date: 2021-12-20T19:08:52+01:00
draft: false
weight: 4

---



## Hvad er stier?

En "sti" er en måde at referere til, hvor "ting" eksisterer på en computer. Samtlige computere (Windows, Mac, Linux, Chromebooks) benytter sig af stier for at kunne finde elementer den skal bruge når man klikker på et ikon, billede eller andet. Når i f.eks. trykker på et program eller en app som er på skrivebordet eller i jeres menu-linje nederst på skærmen, så kan computeren kun forholde sig til hvad det ikon er, fordi ikonet indeholder information om, hvad det skal gøre når i klikker der. En genvej på skrivebordet er derfor, helt simpelt, bare en funktion til at finde hen til det sted hvor en bestemt fil eller mappe ligger. På de fleste Windows-computere er stistrukturen ret ens. F.eks. er mappestrukturen til den bruger jeg sidder på nu:

```C:\Users\Rolf```

Det refererer til, at min Windows-bruger er placeret på C-drevet (den primære harddisk på min computer). For hvert element der kommer efter "C:\" taler vi om mapper. Hvis man skulle beskrive ovenstående sti i menneskeord, så kunne man sige, at i min harddisk ("C:") findes der en mappe der hedder "Users" og i mappen "Users" er der en mappe der hedder "Rolf". Stier kan enten være generelle, som i første eksempel, eller de kan være enormt specifikke, hvor de refererer til en enkelt fil der ligger i tonsvis af undermapper. F.eks. kan jeg referere til en enkelt fil i mange undermapper ved stien:

```C:\Users\Admin\Jedi\Jedi\CPython-37-33\593d51111df2a7984c5d14ec09b1fb4e1c5fa86889ca077d5efe8caf989e2ebc-b778ca99450ae54520d907217075b9ebc8ce4ba22ff117e5a79a9fc16bd81614.pkl```

Men hvad har det med R at gøre? R, som alle andre programmer, har brug for at vide, hvordan den skal finde specifikke elementer på jeres computer. Hvis vi smadder gerne vil have den til at bruge et bestemt datasæt som ikke ligger på nettet, så skal vi vide hvor det datasæt er på vores computer. Det kan vi gøre på mange forskellige måder og denne side viser jer et par eksempler på, hvordan vi gør det nemmest.



## Vi laver en mappe

R, om det er på Windows eller Mac, har samme måde den forstår hvor filer ligger. Generelt er det en fordel at have styr på, hvor i placerer jeres data når i får det udleveret, før i giver jer til at specificere noget i R. Som eksempel kan i starte med at lave en mappe på jeres skrivebord eller et andet sted på jeres computer, hvor i plejer at ligge jeres undervisningsmateriale. En almindelig struktur vi ofte ser er, at i har lavet mapper for jeres semester som igen er opdelt i moduler. Det kunne være, at i har lavet en mappe der hedder "4. semester" og i, i den mappe, har lavet en mappe der hedder: "Modul 11". I så fald ville det være fornuftigt at lave en mappe i "Modul 11". Placeringen er i virkeligheden mindre vigtig her, så længe i kan huske hvor i laver jeres nye mappe. I den mappe kan i prøve at placere csv-fil (eller et andet datasæt) som i har fået udleveret til en af øvelserne til forelæsningerne. Før i går videre herfra, så skal i have lavet en mappe med et datasæt i. Når i har gjort det, så læs videre.



## Hvordan refererer vi til stier?

