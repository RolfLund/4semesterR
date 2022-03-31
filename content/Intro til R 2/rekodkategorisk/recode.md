---
title: "recode"
draft: false
weight: 2
---

## `recode`

Herunder bruges `recode()` til at ændre kategorierne for køn til dansk:


```R
ess18n <- ess18 %>%
    mutate(gndr_da = recode(gndr, 'Male' = 'Mand', 'Female' = 'Kvinde')) %>%
    select(idno, gndr, gndr_da)

head(ess18n)
```

{{< rawhtml >}}
<table class="dataframe">
<caption>A tibble: 6 × 3</caption>
<thead>
	<tr><th scope=col>idno</th><th scope=col>gndr</th><th scope=col>gndr_da</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td> 5816</td><td>Male  </td><td>Mand  </td></tr>
	<tr><td> 7251</td><td>Female</td><td>Kvinde</td></tr>
	<tr><td> 7887</td><td>Male  </td><td>Mand  </td></tr>
	<tr><td> 9607</td><td>Female</td><td>Kvinde</td></tr>
	<tr><td>11688</td><td>Female</td><td>Kvinde</td></tr>
	<tr><td>12355</td><td>Male  </td><td>Mand  </td></tr>
</tbody>
</table>
{{< /rawhtml >}}


Ved brug af `.default` argumentet, kan man angive en værdi for alle øvrige værdier (bortset fra missing):


```R
ess18n <- ess18 %>%
    mutate(gndr_da = recode(gndr, 'Male' = 'Mand', .default = 'Ikke mand')) %>%
    select(idno, gndr, gndr_da)

head(ess18n)
```

{{< rawhtml >}}
<table class="dataframe">
<caption>A tibble: 6 × 3</caption>
<thead>
	<tr><th scope=col>idno</th><th scope=col>gndr</th><th scope=col>gndr_da</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td> 5816</td><td>Male  </td><td>Mand     </td></tr>
	<tr><td> 7251</td><td>Female</td><td>Ikke mand</td></tr>
	<tr><td> 7887</td><td>Male  </td><td>Mand     </td></tr>
	<tr><td> 9607</td><td>Female</td><td>Ikke mand</td></tr>
	<tr><td>11688</td><td>Female</td><td>Ikke mand</td></tr>
	<tr><td>12355</td><td>Male  </td><td>Mand     </td></tr>
</tbody>
</table>
{{< /rawhtml >}}