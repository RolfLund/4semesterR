
# {#Kapitel}Visualisering i R (med ggplot2)

R (eller mere specifikt `ggplot2`) er rost for de mange måder, som man
kan danne og tilpasse visualiseringer af data.

I de følgende afsnit introduceres til, hvordan man danner
visualiseringer med `gpplot2`.

# {#Afsnit}Hvad er ggplot2?

Pakken `ggplot2` er en del af `tidyverse` og bruges til at lave
visualiseringer af data. Funktionerne i `ggplot2` gør det muligt at
tilpasse nærmest alt, og understøtter mange typer af visualisering.

Herunder ses et eksempel på, hvordan man danner et punktdiagram
(scatterplot) i `ggplot2`:

``` r
library(ggplot2)

ess18_filt <- ess18 |> # Filtrering af data for at undgå ekstreme værdier
    filter(grspnum < 200000)

# Dan scatterplot
ggplot(data = ess18_filt, aes(x = yrbrn, y = grspnum)) + 
    geom_point()
```

![png](output_53_0.png)

Overordnet set fungerer ggplot ved, at man først angiver, hvad der skal
visualiseres (data og “aesthetics”), hvorefter man angiver, hvordan det
skal visualiseres (“geom”).

### Opbygning af et ggplot

Som hovedregel følger et ggplot denne skabelon:

    ggplot(data = <DATA>, mapping = aes(<MAPPINGS>)) + 
      <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))

- **ggplot**: Hovedfunktion. Denne angiver *hvad* der skal visualiseres.
  Funktionen `ggplot()` indeholder ikke i sig selv information om
  hvilken type plot, der skal laves. Dette angives med en
  “geom”-funktion.

  - *data*: Krævet argument til ggplot. Forventer en data frame som
    input.

- **mapping**: Krævet argument. Her angives hvilke informationer fra
  data, som skal “mappes” til plottet. Dette gøres ved at angive
  “aesthetics” (`aes()`). De primære mappings er `x` og `y` (ligesom
  akerne i et plot). Andre mappings inkluderer `colour`, `fill`,
  `shape`, `size`. Mappings angives altid som`aes(MAPPINGS)` (fx
  `aes(x = 'eduyrs', y = 'grspnum')`). Mappings kan både angives som
  argumentet til plottet i det hele taget, eller specifikt for et enkelt
  visualiseringslag (“geom”). Forskellen er, hvorvidt mapping gælder for
  alle lag i visualiseringen eller kun et enkelt lag.

- **GEOM_FUNCTION (fx geom_point)**: Plotting-funktion. Et “geom” er
  kort sagt den type plot, som man gerne vil bruge til at visualisere
  data. Mere teknisk referer “geom” til den geometriske form, som skal
  bruges til at repræsentere datapunkterne (bjælker, linjer, bokse,
  punkter osv.). Det er muligt at have adskillige geoms i et plot (altså
  flere lag i visualiseringen).

  - *mapping*: Alle geom-funktioner accepterer et mapping argument.
    Bemærk dog at det ikke er alle aesthetics der er kompatible med alle
    geoms (et histogram har fx ikke en mapping for y).

Det kan være vanskeligt at huske alle de enkelte dele af et ggplot i
starten. Dog findes der et cheatsheet, som man med fordel kan søge hjælp
i:
https://raw.githubusercontent.com/rstudio/cheatsheets/master/data-visualization-2.1.pdf

### Kombinér information i adskillige aesthetics og visualiseringslag

Måden `ggplot2` er bygget op tillader, at man kan relativt nemt kan
kombinere mange typer af information i en enkelt visualisering
(nedenstående er ment som et illustrativt eksempel):

``` r
ggplot(data = ess18_filt, mapping = aes(x = eduyrs, y = grspnum)) +
  geom_point(mapping = aes(colour = gndr, shape = vote, size = netustm)) +
  geom_smooth(colour = 'lightgreen')
```

![png](output_55_1.png)

{{% notice info %}} `ggplot2` bruger `+` til at tilføje lag til
visualiseringen. Selvom koden kan minde om måden, som man bruger pipe
(`|>`), så vil det ikke virke her. Pipe bruges til at videreføre et
output til en ny funktion. I dette tilfælde bruger vi `+` til at
fortælle R, at plottet ikke er færdigt, da der skal tilføjes flere lag.
{{% /notice %}}

# {#Afsnit}Andre plots/geoms (histogram og boxplot)

Fordi data, som skal visualiseres (data, aesthetics), specificeres inden
typen af visualiering (geom), kan man nemt udskifte denne:

``` r
# histogram over månedlig

ggplot(data = ess18_filt, aes(x = grspnum)) + 
    geom_histogram()
```

![png](output_57_1.png)

``` r
# boxplot of monthly income - only geom is changed

ggplot(data = ess18_filt, aes(x = grspnum)) + 
    geom_boxplot()
```

![png](output_58_0.png)

Bemærk at første linje af kodestykkerne til at lave de to plots er
identiske. Det eneste, som skiftes ud, er geom-funktionen.

# {#Afsnit}Undersøg lineær sammenhæng

Ved at kombinere et scatterplot med et plot, der fitter en linje til at
passe på data (`geom_smooth`) kan man visuelt inspicere den umiddelbare
sammenhæng mellem to variable.

`geom_smooth` har et `method` argument, hvor man angiver, hvordan linjen
skal fittes. `method = "lm"` fitter den bedste rette linje mellem x og
y:

``` r
ggplot(data = ess18_filt, aes(x = yrbrn, y = grspnum)) + 
    geom_point() + 
    geom_smooth(method = "lm")
```

![png](output_60_1.png)

Som standard fittes linjen med et 95% konfidensinterval for linjen.
Dette kan slås fra med argumentet `se`. Konfidensniveauet kan ændres med
argumentet `level`.

# {#Afsnit}Tilpasning af ggplot

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

![png](output_64_1.png)

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

![png](output_67_1.png)

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

![png](output_69_1.png)

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

![png](output_71_1.png)

# {#END} end
