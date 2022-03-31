---
title: "Labels i en factor"
draft: false
weight: 3
---

## Labels i en factor

`factor()` funktionen har også et `labels` argument. Denne bruges til at angive, hvad værdierne i factoren skal hedde. Som standard antager R, at `labels` skal være det samme som `levels`, men man kan vælge at specificere andre labels. Disse skal så angives i samme rækkefølge som labels:


```R
ess18n <- ess18 %>%
    mutate(health_r = factor(health, levels = c('Very bad', 'Bad', 'Fair', 'Good', 'Very good'), 
                             labels = c('Meget dårligt', 'Dårligt', 'Jævnt', 'Godt', 'Meget godt'), 
                             ordered = TRUE))

unique(ess18n$health_r)
```

{{< rawhtml >}}
<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>Godt</li><li>Jævnt</li><li>Meget dårligt</li><li>Meget godt</li><li>Dårligt</li><li>&lt;NA&gt;</li></ol>

<details>
	<summary style=display:list-item;cursor:pointer>
		<strong>Levels</strong>:
	</summary>
	<style>
	.list-inline {list-style: none; margin:0; padding: 0}
	.list-inline>li {display: inline-block}
	.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
	</style>
	<ol class=list-inline><li>'Meget dårligt'</li><li>'Dårligt'</li><li>'Jævnt'</li><li>'Godt'</li><li>'Meget godt'</li></ol>
</details>
{{< /rawhtml >}}

At specificere `labels` er principielt en rekodning af værdierne. Man kan derfor bruge denne funktionalitet til at slå kategorier sammen også:


```R
ess18n <- ess18 %>%
    mutate(health_r = factor(health, levels = c('Very bad', 'Bad', 'Fair', 'Good', 'Very good'), 
                             labels = c('Dårligt', 'Dårligt', 'Jævnt', 'Godt', 'Godt'), 
                             ordered = TRUE))

unique(ess18n$health_r)
```

{{< rawhtml >}}
<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>Godt</li><li>Jævnt</li><li>Dårligt</li><li>&lt;NA&gt;</li></ol>

<details>
	<summary style=display:list-item;cursor:pointer>
		<strong>Levels</strong>:
	</summary>
	<style>
	.list-inline {list-style: none; margin:0; padding: 0}
	.list-inline>li {display: inline-block}
	.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
	</style>
	<ol class=list-inline><li>'Dårligt'</li><li>'Jævnt'</li><li>'Godt'</li></ol>
</details>
{{< /rawhtml >}}