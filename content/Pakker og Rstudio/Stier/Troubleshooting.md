---

title: "Troubleshooting"
date: 2021-12-20T19:08:52+01:00
draft: false
weight: 8

---



## Hvad er de ting der ofte går galt?

Når det kommer til stier og særligt stier på jeres lokale computere, er der ting der kan gå galt. Her er en lille liste af ting som i kan forsøge, hvis i støder ind i udfordringer.

#### Skråstregerne vender forkert?

Det med skråstreger er forskelligt fra Mac til Windows. Windows bruger generelt forward slash / i stier mens Mac bruger backslash \ . Det er, for R, ikke noget problem, så længe Windows-brugerne holder fast i / mens Mac-brugerne holder fast i \ . 



#### I kommer til at referere til filen og ikke mappen når i sætter working directory

En helt almindelig fejl er, at i kommer til at skrive: 

```setwd("C:/Users/Admin/Desktop/Eksempel_mappe/value99.csv")```

I stedet for:

```setwd("C:/Users/Admin/Desktop/Eksempel_mappe")```

I øverste eksempel prøver jeg at sætte mit working directory direkte til et datasæt og det kan R ikke finde ud af. Working directories kan KUN være mapper som igen har filer i sig. Husk derfor kun at referere til mappen og ikke direkte til stien. Hvis i kører første linje fra koden vil i få fejlen: "Cannot change working directory".



