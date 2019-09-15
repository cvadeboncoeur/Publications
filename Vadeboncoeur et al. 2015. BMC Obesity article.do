*STATA code for published article - Vadeboncoeur et al. 2015

*Analysis: Meta-analysis of mean (95 % CI) weight change (kg) from baseline to follow-up; including only studies reporting standard errors. The overall mean weight change is 1.36 kg (CI: 1.15–1.57)
metan  wc_all  wc_all_sd_se, lcols(author year length n) sortby(year) random astext(70) textsize(105) boxsca(90) xlabel(-0.5,4) notable xsize(10) ysize(6) favours(Weight loss (kg) # Weight gain (kg))
metan  wc_all  wc_all_sd_se, wgt(n) lcols(author year length n) sortby(year) astext(70) textsize(105) boxsca(90) xlabel(-0.5,4) notable xsize(10) ysize(6) favours(Weight loss # Weight gain)

*Some studies did not have Standard Erros reported in their paper. To ensure lower bias in the meta-analysis, standard errors were imputed and meta-analysis was re-run with all papers including those with imputed values 
metan  wc_all   all_ses_corr, lcols(author year length n) sortby(year) random astext(70) textsize(130) boxsca(96) xlabel(-2,4) notable xsize(10) ysize(6) favours(Weight loss # Weight gain)
metan  wc_all   all_ses_corr, wgt(n) lcols(author year length n) sortby(year) astext(70) textsize(130) boxsca(96) xlabel(-2,4) notable xsize(10) ysize(6) favours(Weight loss # Weight gain)

*Meta-analysis with those with imputed values and non imputed standard errors
mean  Cent_WG_Final
metan  mean_wg mean_wg_sd_se, random lcols(author year cent_wg)sortby(year) astext(90) textsize(145) boxsca(110) xlabel(0,5.5) notable xsize(15) ysize(8)

*Analysis: Subgroup analysis by location
label define locationl 1"USA" 2"Canada" 3"UK" 4"Belgium"
label values location locationl
metan  wc_all  wc_all_sd_se, by(location) random  lcols(author year length n) sortby(year) astext(70) textsize(105) boxsca(90) xlabel(-0.5,4) notable xsize(10) ysize(6) favours(Weight loss # Weight gain)

*Analysis: Subgroup analysis by gender
label define fmonly1 1"females" 2"males"
label values fmonly fmonly1
metan   wc_gender wc_gender_sd_se, by(fmonly) random  lcols(author year length n) sortby(year) astext(60) textsize(140) boxsca(70) xlabel(-0.5,4) notable xsize(10) ysize(6) favours(Weight loss # Weight gain)

*Analysis: Subgroup analysis by study length
keep
gen length2 =""
replace length2 = "Length, < 4 months" if length <=4
replace length2 = "Length,  4-8 months" if length >4
label var length2 = "Length Follow-Up"
metan  wc_all  wc_all_sd_se, by(length2) lcols(author year length n) sortby(year) random astext(70) textsize(105) boxsca(90) xlabel(-0.5,4) notable xsize(10) ysize(6) favours(Weight loss # Weight gain)

*Analysis: Subgroup analysis by study retention rate
label define lab_measured 1"Third person measured" 2"Self-Report"
label values lab_measured lab_measured
metan  wc_all  wc_all_sd_se, by(lab_measured) random lcols(author year length n) sortby(year) astext(70) textsize(105) boxsca(90) xlabel(-0.5,4) notable xsize(10) ysize(6) favours(Weight loss # Weight gain)

*Analysis: Subgroup analysis by quality of studies - based on the Ottawa Newcastle scale for study quality
gen qual= ""
replace qual = "high" if total >=6
replace qual = "med" if total <=5
replace qual = "low" if total <=3


*Analysis: Subgroup analysis by retention rate of the cohort
keep
gen rent2=""
replace rent2="80" if retention >=80
replace rent2= "less" if retention <80
tab rent2

*Analysis: Heterogeneity and bias analysis via a Galbraith plot
galbr  wc_all wc_all_sd_se, xlab id(author)
galbr  wc_all  all_ses_corr, xlab id(author)

*Analysis: Funnel plot 
metafunnel  wc_all wc_all_sd_se, xlab(.4 .6 .8 1 1.2 1.5 2 3) xtitle (Weight Change)
metafunnel  wc_all  all_ses_corr, xlab(.4 .6 .8 1 1.2 1.5 2 3) xtitle (Weight Change)

*Analysis: Wilcoxon-Mann-Whitney tests to compare studies which wereincluded and not included in the meta-analyses and sub-group analyses.
wilcox ranksum a, by(b)






