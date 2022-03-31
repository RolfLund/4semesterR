---
title: "if_else"
draft: false
weight: 3
---

## `if_else`

`if_else()` bruges til at rekode værdier baseret på ét logisk udtryk.

Opbygningen er: `if_else([logisk udtryk], [værdi for sandt], [værdi for falsk])`


```R
ess18n <- ess18 %>% 
    mutate(health_r = factor(health, levels = c('Very bad', 'Bad', 'Fair', 'Good', 'Very good'), ordered = TRUE)) %>%
    mutate(healthdum = if_else(health_r <= "Fair", "Not good", "Good")) %>%
    select(idno, health_r, healthdum)

head(ess18n)
```


{{< rawhtml >}}
<table class="dataframe">
<caption>A tibble: 6 × 3</caption>
<thead>
	<tr><th scope=col>idno</th><th scope=col>health_r</th><th scope=col>healthdum</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;ord&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td> 5816</td><td>Good    </td><td>Good    </td></tr>
	<tr><td> 7251</td><td>Fair    </td><td>Not good</td></tr>
	<tr><td> 7887</td><td>Fair    </td><td>Not good</td></tr>
	<tr><td> 9607</td><td>Good    </td><td>Good    </td></tr>
	<tr><td>11688</td><td>Very bad</td><td>Not good</td></tr>
	<tr><td>12355</td><td>Fair    </td><td>Not good</td></tr>
</tbody>
</table>
{{< /rawhtml >}}



#### `ifelse` eller `if_else`?

I basis R findes funktionen `ifelse`, som fungerer mere eller mindre præcis på samme måde som `if_else` (som er fra `dplyr`).

Den primære forskel mellem funktionerne er, at `if_else` er mere streng, og forventer at værdierne for sand og falsk er af samme type ("class").

I eksemplet herunder laves en (ubrugelig) rekodning, hvor alle værdier over 5 i `ppltrst` (tillid til andre mennesker fra 0-10) gives værdien "Over 5", mens alle andre beholder deres oprindelige værdi (dette gøres ved bare at specificere den oprindelige variabel under værdien for falsk).

Først med `ifelse()`:


```R
ess18n <- ess18 %>% 
    mutate(ppltrst_n = ifelse(ppltrst > 5, "Over 5", ppltrst)) %>%
    select(idno, ppltrst, ppltrst_n)

head(ess18n)
```


{{< rawhtml >}}
<table class="dataframe">
<caption>A tibble: 6 × 3</caption>
<thead>
	<tr><th scope=col>idno</th><th scope=col>ppltrst</th><th scope=col>ppltrst_n</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td> 5816</td><td>7</td><td>Over 5</td></tr>
	<tr><td> 7251</td><td>5</td><td>5     </td></tr>
	<tr><td> 7887</td><td>8</td><td>Over 5</td></tr>
	<tr><td> 9607</td><td>9</td><td>Over 5</td></tr>
	<tr><td>11688</td><td>5</td><td>5     </td></tr>
	<tr><td>12355</td><td>5</td><td>5     </td></tr>
</tbody>
</table>
{{< /rawhtml >}}



`ifelse()` foretager rekodningen uden problemer, men bemærk at den nye variabel er ændret fra `dbl` (en numerisk type/class) til `chr` ("character" - en string).

Forsøges samme med `if_else()`, gives der en fejl:


```R
ess18n <- ess18 %>% 
    mutate(ppltrst_n = if_else(ppltrst > 5, "Over 5", ppltrst)) %>%
    select(idno, ppltrst, ppltrst_n)

head(ess18n)
```


    Error: Problem with `mutate()` column `ppltrst_n`.
    i `ppltrst_n = if_else(ppltrst > 5, "Over 5", ppltrst)`.
    x `false` must be a character vector, not a double vector.
    Traceback: