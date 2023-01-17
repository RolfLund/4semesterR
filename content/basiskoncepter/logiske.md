---
title: Logiske udtryk
weight: 6
---
I R har man ofte brug for at formulere “logiske udtryk”. Logiske udtryk
er kommandoer, som altid returnere logiske værdier. Disse er altid enten
`TRUE` eller `FALSE` (eller `NA`).

En række operationer i R returnerer altid logiske værdier:

- `>`
- `>=`
- `<`
- `<=`
- `==`
- `!=`

Disse bruges blandt til at filtrere data, sætte betingelser for
funktioner og lignende. Logiske udtryk kaldes også for “booleans” eller
“boolean values” på engelsk

BEMÆRK: Logiske udtryk har også sin egen class:

``` r
test <- 2 > 5

print(test)
```

    [1] FALSE

``` r
class(test)
```

    [1] "logical"
