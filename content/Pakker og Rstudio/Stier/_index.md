---

title: "Hvad er stier?"
date: 2021-12-20T08:08:52+01:00
draft: false
weight: 4
---



## Stier er...

En "sti" er en måde at referere til, hvor "ting" eksisterer på en computer. Samtlige computere (Windows, Mac, Linux, Chromebooks) benytter sig af stier for at kunne finde elementer den skal bruge når man klikker på et ikon, billede eller andet. Når i f.eks. trykker på et program eller en app som er på skrivebordet eller i jeres menu-linje nederst på skærmen, så kan computeren kun forholde sig til hvad det ikon er, fordi ikonet indeholder information om, hvad det skal gøre når i klikker der. En genvej på skrivebordet er derfor, helt simpelt, bare en funktion til at finde hen til det sted hvor en bestemt fil eller mappe ligger. På de fleste Windows-computere er stistrukturen ret ens. F.eks. er mappestrukturen til den bruger jeg sidder på nu:

```C:\Users\Admin```

Det refererer til, at min Windows-bruger er placeret på C-drevet (den primære harddisk på min computer). For hvert element der kommer efter "C:\" taler vi om mapper. Hvis man skulle beskrive ovenstående sti i menneskeord, så kunne man sige, at i min harddisk ("C:") findes der en mappe der hedder "Users" og i mappen "Users" er der en mappe der hedder "Admin". Stier kan enten være generelle, som i første eksempel, eller de kan være enormt specifikke, hvor de refererer til en enkelt fil der ligger i tonsvis af undermapper. F.eks. kan jeg referere til en enkelt fil i mange undermapper ved stien:

```C:\Users\Admin\Jedi\Jedi\CPython-37-33\a86889ca0\d5efe8caf92ebc20d\f9ce4ba22ff117\a9fc16bd81614.pkl```

Men hvad har det med R at gøre? R, som alle andre programmer, har brug for at vide, hvordan den skal finde specifikke elementer på jeres computer. Hvis vi smadder gerne vil have den til at bruge et bestemt datasæt som ikke ligger på nettet, så skal vi vide hvor det datasæt er på vores computer. Det kan vi gøre på mange forskellige måder og denne side viser jer et par eksempler på, hvordan vi gør det nemmest. opsætningen og basal interaktion på næste side.
