---
title: "Statistiske modeller i R"
date: 2022-05-10T08:08:52+01:00
draft: false
weight: 2
mathjax: true
---

## Statistiske modeller i R

Der er to dele i at få resultaterne af en statistisk model frem i R:

1. Specificér modellen (fx med en funktion som `lm()` for lineære modeller) 
2. Få koefficienter og resultater fra modellen (med brug af funktionen `summary()`) 

### Specificér modellen

R indeholder flere funktioner til at lave statistiske modeller. Hvilken model der skal bruges, afhænger af, hvilken type af statistisk model, som man skal lave.

Funktionen `lm()` bruges fx til at specificere en lineær model (lineære sammenhænge - lineær og multipel lineær regression). Man specificerer en model ved at angive formlen for den sammenhæng, som man vil modellere.

Formlen for en multipel lineær regression med tre uafhængige variable er fx:

$y = \beta_{0} + \beta_{1} x_{1} + \beta_{2}x_{2} + \beta_{3}x_{3}$

I R skrives denne formel som (læg mærke til at skæringspunktet med y-aksen ($\beta_{0}$) ikke skal skrives ind, da denne bestemmes af modellen):

`y ~ x1 + x2 + x3`

Når man specificerer modellen i R, bruges variabelnavne/kolonnenavne fra data i formlen. Derudover specificeres det, hvilken dataframe, som variablerne tages fra.

I nedenstående specificeres en model med selvrapporteret månedsløn (`grspnum`) som afhængig variabel og antal års uddannelse (`eduyrs`) og arbejdstimer om ugen (`wkhtot`) som uafhængige variable:


```R
grsp_model <- lm(grspnum ~ eduyrs + wkhtot, data = ess18)
```

### Resultater fra model

Læg mærke til at man kun får begrænsede resultater ved at blot at kalde modellen:


```R
grsp_model
```



    Call:
    lm(formula = grspnum ~ eduyrs + wkhtot, data = ess18)
    
    Coefficients:
    (Intercept)       eduyrs       wkhtot  
        -3668.7        891.1        888.4  



For at få alle relevante resultater fra modellen (koefficienter, $R^2$, osv.) bruges funktionen `summary()`:


```R
summary(grsp_model)
```

    Call:
    lm(formula = grspnum ~ eduyrs + wkhtot, data = ess18)
     
    Residuals:
    Min      1Q  Median      3Q     Max 
    -64614  -16639  -10324   -1448 2955649 
    
    Coefficients:
                Estimate Std. Error t value Pr(>|t|)  
    (Intercept)  -3668.7    20645.3  -0.178   0.8590  
    eduyrs         891.1      856.4   1.041   0.2984  
    wkhtot         888.4      458.2   1.939   0.0529 .
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    
    Residual standard error: 121600 on 707 degrees of freedom
      (575 observations deleted due to missingness)
    Multiple R-squared:  0.007698,	Adjusted R-squared:  0.004891 
    F-statistic: 2.742 on 2 and 707 DF,  p-value: 0.06511

