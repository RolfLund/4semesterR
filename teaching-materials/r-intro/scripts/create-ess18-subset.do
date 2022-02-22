use "D:\data\ESS\2018\ESS9DK.dta"

keep if cntry == "DK"
keep if infqbst == 2

keep idno netustm ppltrst vote prtvtddk health lvpntyr tygrtr gndr yrbrn edlvddk eduyrs wkhct wkhtot grspnum frlgrsp inwtm

export delimited using "D:\data\ess\2018\ESS2018DK_subset.csv", replace