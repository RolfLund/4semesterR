---
title: "Tilpasning af output med stargazer"
draft: false
weight: 2
---

## Tilpasning af output med `stargazer`

`stargazer` indeholder ufatteligt mange tilpasningsmuligheder, som ændres ved at referere til de forskellige argumenter. 

Selvom man kan tilpasse outputtet i fx Word, efter at det er eksporteret, så frarådes det *på det kraftigste* at rette i værdier og stjernenotation for signifikansniveau manuelt i fx Word, da der er stor risiko for at lave fejl.
Disse bør i stedet tilpasses i `stargazer` 

Herunder ses et brug af `stargazer`, der bruger nogen af de mange tilpasningsmuligheder (forklaring under koden:

```R

# Eksport af én model med tilpasninger
stargazer(grsp_model,   # hvilken model skal ud?
          type = "html",  # hvilken filtype skal modellen ud som?
          out = "grsp_model2.html", # hvad skal filen med modellen gemmes som? (husk arbejdssti/working directory)
          star.cutoffs = c(0.05, 0.01, 0.001), # sæt skæringsværdier for stjernemarkeringer for p-værdier
          decimal.mark = ",", # ændr decimal-adskiller
          digit.separator = ".", # ændr tusinde-adskiller
          covariate.labels = c("Antal års uddannelse", "Arbejdstimer om ugen"), # mærkater for uafhængige variable (obs på rækkefølge - samme som i model)
          dep.var.labels.include = FALSE, # udelad mærkat for afhængig variabel
          dep.var.caption = "", # udelad overskrift for afhængig variabel
          digits = 2, # Antal decimaler
          title = "Effekt af års uddannelse og arbejdstid på løn") # titel
```

---
**Forklaring**

- `type`: Hvilken filtype skal output gemmes som? (anbefales at bruge "html")

- `out`: Hvad skal filen hedde? (Husk at ende med ".html", hvis `type = "html"` - vær desuden obs på arbejdssti (`getwd()`)

- `star.cutoffs`: Skæringsværider for p-værdier til stjernenotation. Specificeres som værdiserie/vector med tre tal, svarnede til værdi for hhv. \*, \*\*, \*\*\* (fx `c(0.05, 0.01, 0.001)`)

- `decimal.mark`: Sæt hvilket tegn, der skal adskille decimaler

- `digit.separator`: Sæt hvilket tegn, der skal adskille tusinde

- `digits`: Bestemt antal decimaler

- `covariate.labels`: Ændre mærkater for uafhængige variable. Skrives som en værdiserie/vector (`c()`). Skal skrives i samme rækkefølge, som de er skrevet i modellen.

- `dep.var.labels.include`: Sæt hvorvidt mærkat for afhængig variable skal inkluderes (logisk værdi, `TRUE`/`FALSE`)

- `dep.var.caption`: Sæt overskrift for afhængig variabel (udelad ved at angive  `""`)

- `title`: Giv output en overskrift

---

Output ser ud som nedenstående, når åbnet i browser:

{{< rawhtml >}}

<table style="text-align:center"><caption><strong>Effekt af års uddannelse og arbejdstid på løn</strong></caption>
<tr><td colspan="2" style="border-bottom: 1px solid black"></td></tr><tr><td style="text-align:left"></td><td><em>Dependent variable:</em></td></tr>
<tr><td></td><td colspan="1" style="border-bottom: 1px solid black"></td></tr>
<tr><td colspan="2" style="border-bottom: 1px solid black"></td></tr><tr><td style="text-align:left">Antal års uddannelse</td><td>891,15</td></tr>
<tr><td style="text-align:left"></td><td>(856,41)</td></tr>
<tr><td style="text-align:left"></td><td></td></tr>
<tr><td style="text-align:left">Arbejdstimer om ugen</td><td>888,39</td></tr>
<tr><td style="text-align:left"></td><td>(458,22)</td></tr>
<tr><td style="text-align:left"></td><td></td></tr>
<tr><td style="text-align:left">Constant</td><td>-3.668,75</td></tr>
<tr><td style="text-align:left"></td><td>(20.645,31)</td></tr>
<tr><td style="text-align:left"></td><td></td></tr>
<tr><td colspan="2" style="border-bottom: 1px solid black"></td></tr><tr><td style="text-align:left">Observations</td><td>710</td></tr>
<tr><td style="text-align:left">R<sup>2</sup></td><td>0,01</td></tr>
<tr><td style="text-align:left">Adjusted R<sup>2</sup></td><td>0,005</td></tr>
<tr><td style="text-align:left">Residual Std. Error</td><td>121.581,20 (df = 707)</td></tr>
<tr><td style="text-align:left">F Statistic</td><td>2,74 (df = 2; 707)</td></tr>
<tr><td colspan="2" style="border-bottom: 1px solid black"></td></tr><tr><td style="text-align:left"><em>Note:</em></td><td style="text-align:right"><sup>*</sup>p<0,05; <sup>**</sup>p<0,01; <sup>***</sup>p<0,001</td></tr>
</table>

{{< /rawhtml >}}
