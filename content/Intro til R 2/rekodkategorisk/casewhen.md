---
title: "case_when"
draft: false
weight: 4
---

## `case_when`

`case_when()` bruges til at rekode baseret på flere logiske udtryk. For hvert udtryk bruges `~` efterfulgt af en værdi for at angive, hvilken værdi observationerne, der opfylder kriteriet, skal have. Hvert logisk udtryk adskilles med komma:

```R
nyvar = case_when(
    betingelse1 ~ "kategori 1",
    betingelse2 ~ "kategori 2",
    betingelse3 ~ "kategori 3"
    )
```

Herunder dannes en kategorisering af selvangivet arbejdstid om ugen (`wkhtot`), hvor respondenter inddeles efter, hvorvidt de arbejder mindre end 37 timer, 37 timer eller mere end 37 timer om ugen:


```R
ess18n <- ess18 %>%
    mutate(wkhtot_cat = case_when(
        wkhtot == 37 ~ "37 timer om ugen",
        wkhtot < 37 ~ "Mindre end 37 timer",
        wkhtot > 37 ~ "Mere end 37 timer")
          ) %>%
    select(idno, wkhtot, wkhtot_cat)

head(ess18n)
```


{{< rawhtml >}}
<table class="dataframe">
<caption>A tibble: 6 × 3</caption>
<thead>
	<tr><th scope=col>idno</th><th scope=col>wkhtot</th><th scope=col>wkhtot_cat</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td> 5816</td><td>37</td><td>37 timer om ugen   </td></tr>
	<tr><td> 7251</td><td>34</td><td>Mindre end 37 timer</td></tr>
	<tr><td> 7887</td><td>39</td><td>Mere end 37 timer  </td></tr>
	<tr><td> 9607</td><td>34</td><td>Mindre end 37 timer</td></tr>
	<tr><td>11688</td><td>37</td><td>37 timer om ugen   </td></tr>
	<tr><td>12355</td><td>37</td><td>37 timer om ugen   </td></tr>
</tbody>
</table>
{{< /rawhtml >}}