---

title: "Hvad er R?"
date: 2021-12-20T08:08:52+01:00
draft: false
weight: 1

---



## Hvad er R?

R er et gratis analyseprogram med sit eget kommandosprog.

Programmet egner sig især til kvantiative analyser og visualiseringer af kvantitative data.

R kan arbejde med mange forskellige dataformater. Da programmet er "open source", findes ufattelig mange udvidelser til programmet, der tilføjer funktioner.




## RStudio

R i sig selv er meget begrænset. RStudio tilføjer en brugerflade ovenpå R, der gør det rarere at arbejde med. 

Man arbejder typisk i RStudio, når man bruger R.



## At arbejde med R

R har sit eget kodesprog. R fungerer ved at man skriver kommandoer i R sproget, som R derefter "fortolker". 

R (og RStudio) har en meget begrænset brugerflade. Det betyder, at næsten alt vi vil i R (statistik, visualisering osv.), skal ske ved at skrive koder i R sproget.



### R som lommeregner
Hvad menes med at R "fortolker" kode?

"Fortolkning" i R er blot et spørgsmål om R forstår, hvad du forsøger at gøre. Man får R til at gøre ting ved at skrive kommandoer. Hvis R forstår det, gør R den ting. Hvis R ikke forstår det, får man en fejl.

R kan fx forstå matematiske operationer:


```R
7 * 6
```


	42



```R
912 - 132
```


	780


R kan dog ikke forstå tilfældige kommandoer:


```R
lav min eksamensopgave
```


    Error in parse(text = x, srcfile = src): <text>:1:5: uventet symbol
    1: lav min
            ^
    Traceback:



## Brug af R scripts

Script filer er tekst filer med kode, som R kan forstå/fortolke.

En script-fil kan forstås som en "analyseopskrift", der indeholder alle kommandoer nødvendige for at foretage en analyse. Det tillader også, at man nemt kan køre kommandoer igen.

Man bør altid skrive de kommandoer, som man bruger, ind i et script. Brug derfor kun konsolvinduet til at finde frem til den rigtige kommando.

- `#` kan bruges til kommentarer (ignoreres når man kører koden)
- `Ctrl` + `Enter` (Windows), `Command` + `Enter` (Mac): Kører aktuel linje eller selektion

***BEMÆRK!*** Der er ingen fortryd-knap i R! Når koden er kørt, er ændringen sket. Den eneste måde at "fortryde" er ved at genskabe det, som man har lavet, ved at køre tidligere kode igen. Netop derfor er scripts vigtige.