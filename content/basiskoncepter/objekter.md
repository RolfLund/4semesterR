---
title: Objekter
weight: 3
---
At arbejde med R involverer kontinuerligt at definere objekter. Objekter
er blot et navn til at kalde lagret information frem igen.

Objekter kan være mange ting: h \* et ord \* et tal \* en talrække \* et
datasæt \* en matematisk formel \* et resultat \* en filsti \* en graf
\* og så videre…

Når et objekt er defineret, er det tilgængeligt i det aktuelle
arbejdsmiljø (dvs.: tilgængeligt indtil vi starter en ny R session eller
fjerner det igen).

Der er ingen grænser for mængden af objekter, som vi kan danne. Dette
tillader at vi kan arbejde med meget forskellig information samtidig.

## Definér objekter

Objekter dannes ved brug af `<-` (`Alt` + `-`):

``` r
year <- 1964

print(year)
```

    [1] 1964

Hvis objektet indeholder et tal, kan R arbejde med det som ethvert andet
tal.

``` r
year + 10
```

    [1] 1974

Bemærk at R behandler store og små bogstaver som forskellige:

``` r
Year # Findes ikke
```

    Error in eval(expr, envir, enclos): object 'Year' not found

Når man bruger `' '` eller`" "` fortæller man R, at inputtet skal
behandles som tekst. *Dette gælder også tal!*

``` r
name <-  "keenan"

print(name)
```

    [1] "keenan"

``` r
year_now  <- '2021'

print(year_now)
```

    [1] "2021"

Bemærk at tal lagret som tekst også har citationstegn om sig. Tal lagret
som tekst kan ikke bruges som tal:

``` r
year_now - 5
```

    Error in year_now - 5: non-numeric argument to binary operator

Ovenstående fejl sker fordi R adskiller mellem forskellige objekter ved
at tildele dem en *class*. Objektets *class* bestemmer kort sagt, hvad
der er muligt med objektet.

## Navngivning af objekter

Objekter kan hedde næsten hvad som helst. En god tommelfingerregel er at
bruge navne, der indikerer, hvad objektet indeholder.

### Restriktioner ved navngivning

- De fleste specialtegn kan ikke bruges: `/`, `?`, `*`, `+` (mange af
  disse betyder noget i R)
- Allerede eksisterende navne i R (overskriver den/det eksisterende
  funktion/objektet)

### Navngivningskonventioner

- Brug ‘`_`’: `my_object`, `room_number`

Eller:

- Lad hvert ord starte med stort bortset fra det første: `myObject`,
  `roomNumber`
