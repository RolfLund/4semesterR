---
title: Tilpasning af ggplot
weight: 4
---
Et ggplot kan tilpasses på mange forskellige måder. Her gennemgås nogen
af de mere simple ændringer og tilføjelser.

### Mærkater

Man kan sætte mærkater (for akser, tegnforklaring osv.) med funktionen
`labs`. `labs` har argumenter, der tilsvarer de forskellige aesthetics.
Man sætter derfor mærkat for et aesthetic, ved at referere til dette i
funktionen:

``` r
ggplot(data = ess18_filt, mapping = aes(x = eduyrs, y = grspnum, colour = gndr, size = netustm)) +
    geom_point() + 
    labs(x = 'Years of education', y = 'Usually monthly gross pay', colour = 'Gender', size = 'Time spent on internet per day')
```

![png](/output_64_1.png)

### Titel

Man kan tilføje en titel med enten `ggtitle()` eller med `labs()`.

``` r
# Med ggtitle
ggplot(data = ess18_filt, mapping = aes(x = eduyrs, y = grspnum, colour = gndr, size = netustm)) +
    geom_point() + 
    labs(x = 'Years of education', y = 'Usually monthly gross pay', colour = 'Gender', size = 'Time spent on internet per day') + 
     ggtitle('Education and Pay')

# Med labs
ggplot(data = ess18_filt, mapping = aes(x = eduyrs, y = grspnum, colour = gndr, size = netustm)) +
    geom_point() + 
    labs(title = 'Education and Pay', x = 'Years of education', y = 'Usually monthly gross pay', colour = 'Gender', size = 'Time spent on internet per day')
```

![png](/output_67_1.png)

### Tegnforklaring (legend)

Tegnforklaringen (legend) bruger værdierne fra data som standard. Man
kan derfor ændre værdierne ved at ændre værdierne i data.

Alternativt kan man ændre tegnforklaringen ved at tilpasse den skala,
som værdierne placeres efter. I eksemplet herunder ændres
tegnforklaringen/værdierne for kønsvariablen (`gndr`), som punkterne er
farvelagt efter (`colour` aesthetic):

``` r
ggplot(data = ess18_filt, mapping = aes(x = eduyrs, y = grspnum, colour = gndr, size = netustm)) +
    geom_point() + 
    labs(title = 'Education and Pay', x = 'Years of education', y = 'Usually monthly gross pay', colour = 'Gender', size = 'Time spent on internet per day') + 
    scale_colour_discrete(labels = c('Kvinde', 'Mand'))
```

![png](/output_69_1.png)

Funktionen her hedder `scale_colour_discrete()` fordi, at det er skalaen
for `colour`-aesethetic, som ændres, og fordi værdierne er kategoriske
(kategoriske værdier omtales også som “diskrete” værdier). Denne har
argumentet `labels` til at angive, hvad værdimærkaterne for skalaen skal
være (her de danske betegnelser for “Female”/“Male”).

### Temaer

ggplot indeholder en række forskellige standardtemaer (se
https://ggplot2.tidyverse.org/reference/index.html#section-themes). Det
er også muligt at lave sit eget tema.

Hvis man vil bruge et eksisterende tema, kaldes dette blot som endnu et
lag i visualiseringen (typisk til sidst). Herunder anvendes
`theme_minimal`:

``` r
ggplot(data = ess18_filt, mapping = aes(x = eduyrs, y = grspnum, colour = gndr, size = netustm)) +
    geom_point() + 
    labs(title = 'Education and Pay', x = 'Years of education', y = 'Usually monthly gross pay', colour = 'Gender', size = 'Time spent on internet per day') + 
    scale_colour_discrete(labels = c('Kvinde', 'Mand')) + 
    theme_minimal()
```

![png](/output_71_1.png)