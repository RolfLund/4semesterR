---
title: "Output af model (med stargazer)"
draft: false
weight: 2
---

## Output af model (med `stargazer`)

Outputtet i R konsollen af en model er ikke kønt og egner sig dårligt til at fremstille. Der findes dog en række måder at lave pæne outputs af modeller fra R. En god pakke til dette er pakken `stargazer` (https://cran.r-project.org/web/packages/stargazer/stargazer.pdf).

`stargazer` kan tage forskellige R objekter (herunder modeller) og lave op til outputs, hvor de enkelte dele kan tilpasses. `stargazer` tillader bl.a. at eksportere output fra en model til en HTML fil. Indholdet af en HTML-fil kan kopieres direkte over i programmer som Microsoft Word.

For at danne en output-fil af en model med `stargazer` kræves som minimum: 
- En model (det objekt hvor modellen er gemt - ikke outputtet af `summary()`)
- Bestemme filtype (`stargazer` kan danne forskellige filtyper, som kan styres med argumentet `type`. `type = "HTML"` danner et HTML-output)
- Angive filnavn, som outputtet skal gemmes til (dette gøres med argumentet `out = <filnavn>`)

**OBS! Output-filer fra `stargazer` gemmes i din arbejdssti**

`stargazer` gemmer filen i den nuværende arbejdssti (se sektion om [filstier](https://rolflund.github.io/4semesterR/pakker-og-rstudio/stier/)). Tjek evt. den nuværende arbejdssti med `getwd()`, inden du bruger `stargazer`.

### Eksempel på brug af `stargazer`

Herunder dannes output af en af ovenstående model med `stargazer()`:

```R
stargazer(grsp_model, type = "html", out = "grsp_model.html")
```

Outputtet ser ud som nedenstående, når åbnet i et andet program:

{{< rawhtml >}}
<table style="text-align:center"><tr><td colspan="2" style="border-bottom: 1px solid black"></td></tr><tr><td style="text-align:left"></td><td><em>Dependent variable:</em></td></tr>
<tr><td></td><td colspan="1" style="border-bottom: 1px solid black"></td></tr>
<tr><td style="text-align:left"></td><td>grspnum</td></tr>
<tr><td colspan="2" style="border-bottom: 1px solid black"></td></tr><tr><td style="text-align:left">eduyrs</td><td>891.145</td></tr>
<tr><td style="text-align:left"></td><td>(856.409)</td></tr>
<tr><td style="text-align:left"></td><td></td></tr>
<tr><td style="text-align:left">wkhtot</td><td>888.389<sup>*</sup></td></tr>
<tr><td style="text-align:left"></td><td>(458.219)</td></tr>
<tr><td style="text-align:left"></td><td></td></tr>
<tr><td style="text-align:left">Constant</td><td>-3,668.748</td></tr>
<tr><td style="text-align:left"></td><td>(20,645.310)</td></tr>
<tr><td style="text-align:left"></td><td></td></tr>
<tr><td colspan="2" style="border-bottom: 1px solid black"></td></tr><tr><td style="text-align:left">Observations</td><td>710</td></tr>
<tr><td style="text-align:left">R<sup>2</sup></td><td>0.008</td></tr>
<tr><td style="text-align:left">Adjusted R<sup>2</sup></td><td>0.005</td></tr>
<tr><td style="text-align:left">Residual Std. Error</td><td>121,581.200 (df = 707)</td></tr>
<tr><td style="text-align:left">F Statistic</td><td>2.742<sup>*</sup> (df = 2; 707)</td></tr>
<tr><td colspan="2" style="border-bottom: 1px solid black"></td></tr><tr><td style="text-align:left"><em>Note:</em></td><td style="text-align:right"><sup>*</sup>p<0.1; <sup>**</sup>p<0.05; <sup>***</sup>p<0.01</td></tr>
</table>
{{< /rawhtml >}}


**Tilpasning af output**

Outputtet kan tilpasses på mange måder. Herunder ses blot nogen af eksemplerne:

```R
stargazer(grsp_model, type = "html",
          title = "Effekt af års uddannelse og arbejdstid på løn",
          covariate.labels = c("Års uddannelse", "Arbejdstimer om ugen"),
          dep.var.labels.include = FALSE, dep.var.caption = "Model 1", star.cutoffs = c(0.05, 0.01, 0.001),
          out = "grsp_model.html")
```

{{< rawhtml >}}

<table style="text-align:center"><caption><strong>Effekt af års uddannelse og arbejdstid på løn</strong></caption>
<tr><td colspan="2" style="border-bottom: 1px solid black"></td></tr><tr><td style="text-align:left"></td><td>Model 1</td></tr>
<tr><td></td><td colspan="1" style="border-bottom: 1px solid black"></td></tr>
<tr><td colspan="2" style="border-bottom: 1px solid black"></td></tr><tr><td style="text-align:left">Års uddannelse</td><td>891.145</td></tr>
<tr><td style="text-align:left"></td><td>(856.409)</td></tr>
<tr><td style="text-align:left"></td><td></td></tr>
<tr><td style="text-align:left">Arbejdstimer om ugen</td><td>888.389</td></tr>
<tr><td style="text-align:left"></td><td>(458.219)</td></tr>
<tr><td style="text-align:left"></td><td></td></tr>
<tr><td style="text-align:left">Constant</td><td>-3,668.748</td></tr>
<tr><td style="text-align:left"></td><td>(20,645.310)</td></tr>
<tr><td style="text-align:left"></td><td></td></tr>
<tr><td colspan="2" style="border-bottom: 1px solid black"></td></tr><tr><td style="text-align:left">Observations</td><td>710</td></tr>
<tr><td style="text-align:left">R<sup>2</sup></td><td>0.008</td></tr>
<tr><td style="text-align:left">Adjusted R<sup>2</sup></td><td>0.005</td></tr>
<tr><td style="text-align:left">Residual Std. Error</td><td>121,581.200 (df = 707)</td></tr>
<tr><td style="text-align:left">F Statistic</td><td>2.742 (df = 2; 707)</td></tr>
<tr><td colspan="2" style="border-bottom: 1px solid black"></td></tr><tr><td style="text-align:left"><em>Note:</em></td><td style="text-align:right"><sup>*</sup>p<0.05; <sup>**</sup>p<0.01; <sup>***</sup>p<0.001</td></tr>
</table>

{{< /rawhtml >}}
