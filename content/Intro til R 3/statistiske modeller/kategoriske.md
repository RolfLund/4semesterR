---
title: "Kategoriske variable (factors) i modeller"
draft: false
weight: 2
---

## Kategoriske variable (factors) i modeller

Som standard vil R behandle tekstvariable som *unordered factors*; altså nominalt skalerede variable.

I nedenstående tilføjes variablen `vote` (hvorvidt man stemte til sidste folketingsvalg) til modellen fra før. `vote` er ikke kodet til factor: 


```R
grsp_vote_model <- lm(grspnum ~ eduyrs + wkhtot + vote, data = ess18)
summary(grsp_vote_model)
```


    
    Call:
    lm(formula = grspnum ~ eduyrs + wkhtot + vote, data = ess18)
    
    Residuals:
        Min      1Q  Median      3Q     Max 
     -62657  -17091  -10043   -1996 2954310 
    
    Coefficients:
                             Estimate Std. Error t value Pr(>|t|)
    (Intercept)              -11421.9    29407.5  -0.388    0.698
    eduyrs                      796.2      867.1   0.918    0.359
    wkhtot                      788.2      481.1   1.638    0.102
    voteNot eligible to vote   2542.6    28612.8   0.089    0.929
    voteYes                   14414.7    23405.2   0.616    0.538
    
    Residual standard error: 121800 on 704 degrees of freedom
      (576 observations deleted due to missingness)
    Multiple R-squared:  0.0087,	Adjusted R-squared:  0.003068 
    F-statistic: 1.545 on 4 and 704 DF,  p-value: 0.1875



*Når man ikke har defineret en kategorisk som en factor, tager R kategorien, der kommer først alfabetisk, som referencekategori!*

Dette kan ændres ved at definere variablen som factor og sætte referencekategorien. Herunder sættes "Yes" som referencekategori ved brug af funktionen `relevel`. Derefter dannes modellen igen:


```R
ess18 <- ess18 %>%
    mutate(vote = as.factor(vote),
           vote = relevel(vote, ref = "Yes")
           )
```


```R
grsp_vote_model <- lm(grspnum ~ eduyrs + wkhtot + vote, data = ess18)
summary(grsp_vote_model)
```


    
    Call:
    lm(formula = grspnum ~ eduyrs + wkhtot + vote, data = ess18)
    
    Residuals:
        Min      1Q  Median      3Q     Max 
     -62657  -17091  -10043   -1996 2954310 
    
    Coefficients:
                             Estimate Std. Error t value Pr(>|t|)
    (Intercept)                2992.8    22232.6   0.135    0.893
    eduyrs                      796.2      867.1   0.918    0.359
    wkhtot                      788.2      481.1   1.638    0.102
    voteNo                   -14414.7    23405.2  -0.616    0.538
    voteNot eligible to vote -11872.2    18477.7  -0.643    0.521
    
    Residual standard error: 121800 on 704 degrees of freedom
      (576 observations deleted due to missingness)
    Multiple R-squared:  0.0087,	Adjusted R-squared:  0.003068 
    F-statistic: 1.545 on 4 and 704 DF,  p-value: 0.1875

