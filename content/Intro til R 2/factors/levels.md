---
title: "Levels i en factor"
draft: false
weight: 2
---

## Levels i en factor

Når man omdanner en variabel til en factor, fortæller man også R, at denne variabel kun kan indeholde nogle specifikke værdier. De værdier, som variablen kan indeholde, er dens "levels".

Ser man fx på de unikke værdier i et subet kun med mænd, vil man se, at data kun indeholder værdien "Male", men at de mulige værdier er "Male" og "Female":


```R
ess18_male_subset <- filter(ess18, gndr == 'Male')

unique(ess18_male_subset$gndr)
```


Male
{{< rawhtml >}}
<details>
	<summary style=display:list-item;cursor:pointer>
		<strong>Levels</strong>:
	</summary>
	<style>
	.list-inline {list-style: none; margin:0; padding: 0}
	.list-inline>li {display: inline-block}
	.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
	</style>
	<ol class=list-inline><li>'Female'</li><li>'Male'</li></ol>
</details>
{{< /rawhtml >}}

### "Ordered" og "unordered" factors

En factor vil som standard blive sat til "unordered" (nominalskaleret). Dette kan ændres ved at bruge funktionen `factor()` sammen med `ordered =` argumentet. Hvor `as.factor()` bruges til at konvertere værdierne i en variabel til ikke-rangordnede kategorier, så bruges `factor()` både til at styre hvilke kategorier, der skal indgå i factoren samt til at styre, om den skal være rangordnet eller ej.

Herunder omdannes `health`-variablen (selvvurderet helbred) til en rangordnet factor, uden rækkefølgen specificeres:


```R
# Dan factor som rangordnet/ordinal (men hvilken rækkefølge?)
ess18n <- ess18 %>%
    mutate(health_r = factor(health, ordered = TRUE))

unique(ess18n$health_r)
```

{{< rawhtml >}}
<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>Good</li><li>Fair</li><li>Very bad</li><li>Very good</li><li>Bad</li><li>&lt;NA&gt;</li></ol>

<details>
	<summary style=display:list-item;cursor:pointer>
		<strong>Levels</strong>:
	</summary>
	<style>
	.list-inline {list-style: none; margin:0; padding: 0}
	.list-inline>li {display: inline-block}
	.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
	</style>
	<ol class=list-inline><li>'Bad'</li><li>'Fair'</li><li>'Good'</li><li>'Very bad'</li><li>'Very good'</li></ol>
</details>
{{< /rawhtml >}}

Fordi rækkefølgen ikke er specificeret, antager R, at de skal sættes i alfabetisk rangorden. Dette betyder, at `health_r` variablen er kodet sådan, at "Very bad" betragtes som en højere værdi end "Good":


```R
print(ess18n$health_r[5])
print(ess18n$health_r[10])

ess18n$health_r[5] > ess18n$health_r[10] # Er "Very bad" højere end "Good"?
```

    [1] Very bad
    Levels: Bad < Fair < Good < Very bad < Very good
    [1] Good
    Levels: Bad < Fair < Good < Very bad < Very good



TRUE


R kan ikke vide, hvad der kommer først i rækkefølge ud fra tekstværdien alene, så det skal man selv specificere i rekodningen. Dette gøres ved at specificere levels i rækkefølgen lav til høj:


```R
ess18n <- ess18 %>%
    mutate(health_r = factor(health, levels = c('Very bad', 'Bad', 'Fair', 'Good', 'Very good'), ordered = TRUE))

unique(ess18n$health_r)
```

{{< rawhtml >}}
<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>Good</li><li>Fair</li><li>Very bad</li><li>Very good</li><li>Bad</li><li>&lt;NA&gt;</li></ol>

<details>
	<summary style=display:list-item;cursor:pointer>
		<strong>Levels</strong>:
	</summary>
	<style>
	.list-inline {list-style: none; margin:0; padding: 0}
	.list-inline>li {display: inline-block}
	.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
	</style>
	<ol class=list-inline><li>'Very bad'</li><li>'Bad'</li><li>'Fair'</li><li>'Good'</li><li>'Very good'</li></ol>
</details>
{{< /rawhtml >}}


```R
print(ess18n$health_r[5])
print(ess18n$health_r[10])

ess18n$health_r[5] > ess18n$health_r[10] # Er "Very bad" højere end "Good"?
```

    [1] Very bad
    Levels: Very bad < Bad < Fair < Good < Very good
    [1] Good
    Levels: Very bad < Bad < Fair < Good < Very good



FALSE


{{% notice warning %}}
Husk! R tager ting *meget* bogstaveligt - herunder også tekstværdierne i en variabel. Når du specificerer levels, så sørg for at de er skrevet præcist, som de er angivet i variablen.
{{% /notice %}}

Ved at specificere `levels` fortæller man R, at variablen *kun* skal indeholde de værdier. Alle øvrige værdier bliver derfor sat til missing:


```R
ess18n <- ess18 %>%
    mutate(gndr_3 = factor(gndr, levels = c("Male", "Other")))

table(ess18n$gndr_3)
```


|Male| Other |
|--|--|
|655|0|


For at hjælpe sig selv, kan man som alternativ til `factor()` bruge `parse_factor()` (fra `readr`/`tidyverse`). Denne fungerer præcis ligesom `factor()` med den ene forskel, at den giver advarsler, hvis værdier bliver tvunget til missing:


```R
ess18n <- ess18 %>%
    mutate(gndr_3 = parse_factor(gndr, levels = c('Male', 'Other')))

table(ess18n$gndr_3)
```

    Warning message:
    "630 parsing failures.
    row col           expected actual
      2  -- value in level set Female
      4  -- value in level set Female
      5  -- value in level set Female
      8  -- value in level set Female
      9  -- value in level set Female
    ... ... .................. ......
    See problems(...) for more details.
    "


|Male| Other |
|--|--|
|655|0|