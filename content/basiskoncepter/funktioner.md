---
title: Funktioner
weight: 4
---
Funktioner er kommandoer brugt til at transformere objektet på en måde
og give et output.

Det, som man sætter i funktionen, kaldes et “argument” eller “input”.
Antallet af argumenter varierer mellem funktioner.

Funktioner har alle den samme opbygning:
`funktionsnavn(arg1, arg2, arg3)`. (funktionsnavn med argumenterne i
parentes adskilt med kommaer).

Nogle argumenter er krævet, mens andre er valgfrie.

### Eksempler på funktioner

Gør tekst til blokbogstaver:

``` r
name <- 'kilmister'
toupper(name) 
```

    [1] "KILMISTER"

Erstat bogstaver i tekst:

``` r
gsub("e", "a", name)
```

    [1] "kilmistar"

## Funktioner og output

Bemærk at funktioner *aldrig* ændrer et objekt. Når man bruger en
funktion, beder man R om at *se* et output, men ikke om at ændre noget.

Hvis man vil ændre et objekt, skal man derfor lagre outputtet i et
objekt (et nyt eller eksisterende).

``` r
print(name) # uændret selvom det er brugt i flere funktioner
```

    [1] "kilmister"

``` r
name <- gsub("e", "a", name) # overskriv objekt med ændringen

print(name)
```

    [1] "kilmistar"
