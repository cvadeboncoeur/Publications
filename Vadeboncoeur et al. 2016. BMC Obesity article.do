*STATA code for published article - Vadeboncoeur et al. 2016

*Table 1 in paper: Descriptive demographics of the longitudinal student sample for those answering the first term only (N= 311) andthose answering all time points (N= 215)
tab Sex if Participate1==1&Participate2==1&Participate3==1&time==3 &!missing(T3_T1WD)
tab DOB if Participate1==1&Participate2==1&Participate3==1&time==3 &!missing(T3_T1WD)
tab Residence if Participate1==1&Participate2==1&Participate3==1&time==3 &!missing(T3_T1WD)
tab Ethinicity if Participate1==1&Participate2==1&Participate3==1&time==3 &!missing(T3_T1WD)
tab Sex if Participate1==1&Participate2==1&time==2 &!missing(T2_T1WD)
tab DOB if Participate1==1&Participate2==1&time==2 &!missing(T2_T1WD)
tab Residence if Participate1==1&Participate2==1&time==2 &!missing(T2_T1WD)
tab Ethinicity if Participate1==1&Participate2==1&time==2 &!missing(T2_T1WD)

*Table 2 in paper: Baseline weight, height and BMI of males and femalesfor the academic year longitudinal sample (N= 215)
by Sex, sort:tabstat wgt1 if Participate1==1&Participate2==1&Participate3==1&time==3 &!missing(wgt3), statistics( mean semean sd count ) format(%4.1f)
by Sex, sort:tabstat HeightMeters_All if Participate1==1&Participate2==1&Participate3==1&time==3 &!missing(wgt3), statistics( mean semean sd count ) format(%4.1f)
tab BMI_Categorie1 if Participate1==1&Participate2==1&Participate3==1&time==3&Sex==1 &!missing(wgt3)
tab BMI_Categorie1 if Participate1==1&Participate2==1&Participate3==1&time==3&Sex==2 &!missing(wgt3)

*Table 3 in paper: Mean weight, BMI and rate change over the academicyear and different terms (N= 215)
*Full academic year weight change
tabstat T3_T1WD if time==3&Participate2==1, statistics( mean semean sd count )
by Sex, sort: tabstat T3_T1WD if time==3&Participate2==1, statistics( mean semean sd count )
*Full academic BMI weight change
tabstat T3_T1BMI if time==3&Participate2==1, statistics( mean semean sd count )
by Sex, sort:tabstat T3_T1BMI if time==3&Participate2==1, statistics( mean semean sd count )

*First academic term weight change
tabstat T2_T1WD if Participate1==1&Participate2==1&Participate3==1&!missing(wgt3), statistics( mean semean sd count )
by Sex, sort: tabstat T2_T1WD if Participate1==1&Participate2==1&Participate3==1&!missing(wgt3), statistics( mean semean sd count )
*First academic term BMI change
tabstat T2_T1BMI if Participate1==1&Participate2==1&Participate3==1&!missing(wgt3), statistics( mean semean sd count )
by Sex, sort:tabstat T2_T1BMI if Participate1==1&Participate2==1&Participate3==1&!missing(wgt3), statistics( mean semean sd count )

*Second academic term weight change
tabstat T3_T2WD if time==3&Participate2==1, statistics( mean semean sd count )
by Sex, sort: tabstat T3_T2WD if time==3&Participate2==1, statistics( mean semean sd count )
*Second academic term BMI change
tabstat T3_T2BMI if time==3&Participate2==1, statistics( mean semean sd count )
by Sex, sort:tabstat T3_T2WD if time==3&Participate2==1, statistics( mean semean sd count )

*Analysis: ttest to see if it is a significant weight change
ttest T3_T1WD if time==3&Participate2==1, by(Sex)
ttest T2_T1WD if Participate1==1&Participate2==1&Participate3==1&!missing(wgt3), by(Sex)
ttest T3_T2WD if time==3&Participate2==1, by(Sex)

*Analysis: effects of number of follow-up weeks on weight change
summarize weeks if Participate1==1&Participate2==1&Participate3==1&!missing(wgt3)&time==3
regress T3_T1WD weeks if Participate1==1&Participate2==1&Participate3==1&!missing(wgt3)&time==3
regress T3_T1WD months if Participate1==1&Participate2==1&Participate3==1&!missing(wgt3)&time==3
generate weeksdicT3 = weeks if time==3
recode weeksdicT3 (0/34.9=0) (34.99/40=1)
tab weeksdicT3
ttest T3_T1WD if time==3&Participate2==1, by(weeksdicT3)

*Table 4 in paper: Mean weight change and rate by period of time andsex, for those who gained and lost more than 0.5 kg by the endof the academic year (N= 165)
*Academic year - weight gainers
tabstat T3_T1WD if time==3&Participate2==1& T3_T1WD>0.5, statistics( mean semean sd count)
by Sex, sort: tabstat T3_T1WD if time==3&Participate2==1& T3_T1WD>0.5, statistics( mean semean sd count)
*Academic year - weight losers
tabstat T3_T1WD if time==3&Participate2==1& T3_T1WD<-0.5, statistics( mean semean sd count)
by Sex, sort:tabstat T3_T1WD if time==3&Participate2==1& T3_T1WD<-0.5, statistics( mean semean sd count)

*First term - weight gainers
tabstat T2_T1WD if Participate1==1&Participate2==1&Participate3==1&!missing(wgt3) & T2_T1WD>0.5, statistics( mean semean sd count )
by Sex, sort: tabstat T2_T1WD if Participate1==1&Participate2==1&Participate3==1&!missing(wgt3) & T2_T1WD>0.5, statistics( mean semean sd count )
*First term - weight losers
tabstat T2_T1WD if Participate1==1&Participate2==1&Participate3==1&!missing(wgt3) & T2_T1WD<-0.5, statistics( mean semean sd count )
by Sex, sort:tabstat T2_T1WD if Participate1==1&Participate2==1&Participate3==1&!missing(wgt3) & T2_T1WD<-0.5, statistics( mean semean sd count )

*Second term - weight gainers
tabstat T3_T2WD if time==3&Participate2==1& T3_T2WD>0.5, statistics( mean semean sd count)
by Sex, sort: tabstat T3_T2WD if time==3&Participate2==1& T3_T2WD>0.5, statistics( mean semean sd count)
*Second term - weight losers
tabstat T3_T2WD if time==3&Participate2==1& T3_T2WD<-0.5, statistics( mean semean sd count)
by Sex, sort:tabstat T3_T2WD if time==3&Participate2==1& T3_T2WD<-0.5, statistics( mean semean sd count)

*Analysis: ttest weight gainers and weight losers - by academic year and different terms
ttest T3_T1WD if time==3&Participate2==1 & T3_T1WD>0.5, by(Sex)
ttest T3_T1WD if time==3&Participate2==1 & T3_T1WD<-0.5, by(Sex)
unpairedttesti 215 0.98 3.66 111 3.46 2.57
ttest T2_T1WD if Participate1==1&Participate2==1&Participate3==1&!missing(wgt3)&T2_T1WD >0.5, by(Sex)
ttest T2_T1WD if Participate1==1&Participate2==1&Participate3==1&!missing(wgt3) & T2_T1WD <-0.5, by(Sex)
ttest T3_T2WD if time==3&Participate2==1 & T3_T2WD>0.5, by(Sex)
ttest T3_T2WD if time==3&Participate2==1 & T3_T2WD<-0.5, by(Sex)

summarize T3_T1WD if time==3&Participate2==1& T3_T1WD>0.5
summarize T3_T1WD if time==3&Participate2==1& T3_T1WD>4.53
summarize T3_T1WD if time==3&Participate2==1& T3_T1WD>6.8


*Paragraph on BMI change
*BMI categorisation based on WHO
*BMI categorisation fo BMI at time point 1
generate BMICategory1 = BMI
recode   BMICategory1 (13.0/18.499=1) (18.5/24.999=2) (25/29.999=3)  (30/60=4)
tab BMICategory1 if time==3&Participate2==1&Participate1==1&Participate3==1&!missing(wgt3) & Sex==1

*BMI categorisation fo BMI at time point 2
generate BMICategory2 = BMI
recode   BMICategory2 (13.0/18.499=1) (18.5/24.999=2) (25/29.999=3)  (30/60=4)
tab BMICategory2 if time==3&Participate2==1&Participate1==1&Participate3==1&!missing(wgt3) & Sex==1

*BMI categorisation for BMI at time point 3
generate BMICategory3 = BMIBaseline
recode   BMICategory3 (13.0/18.499=1) (18.5/24.999=2) (25/29.999=3)  (30/60=4)
tab BMICategory3 if time==3&Participate2==1&Participate1==1&Participate3==1&!missing(wgt3) & Sex==2

*Analysis: BMI descriptive stats for those who gained weight over the year
tab BMICategory3 if time==3&Participate2==1&Participate1==1&Participate3==1&!missing(wgt3) & T3_T1WD3>0.5
summarize BMIBaseline if time==3&Participate2==1&Participate1==1&Participate3==1&!missing(wgt3) & T3_T1WD3>0.5
by BMICategory3, sort: tabstat  BMIBaseline if time==3&Participate2==1&Participate1==1&Participate3==1&!missing(wgt3) & T3_T1WD3>0.5, statistics( mean semean sd count )
by BMICategory3, sort: tabstat T3_T1WD3_Rela if time==3&Participate2==1&Participate1==1&Participate3==1&!missing(wgt3) & T3_T1WD3>0.5, statistics( mean semean sd count )

*Analysis: BMI descriptive stats for those who lost weight over the year
summarize BMIBaseline if time==3&Participate2==1&Participate1==1&Participate3==1&!missing(wgt3) & T3_T1WD3<-0.5
tab BMICategory3 if time==3&Participate2==1&Participate1==1&Participate3==1&!missing(wgt3) & T3_T1WD3<-0.5
by BMICategory3, sort: tabstat  BMIBaseline if time==3&Participate2==1&Participate1==1&Participate3==1&!missing(wgt3) & T3_T1WD3<-0.5, statistics( mean semean sd count )
by BMICategory3, sort: tabstat T3_T1WD3_Rela if time==3&Participate2==1&Participate1==1&Participate3==1&!missing(wgt3) & T3_T1WD3<-0.5, statistics( mean semean sd count )

*Creation of a dummy category for those under, over or normal weight
generate BMI_CatUnderNormal = BMI_Categorie1
recode   BMI_CatUnderNormal (1=1) (2=2) (3=.)  (4=.)
generate BMI_CatOverNormal1 = BMI_Categorie1
*Coded variable: obese and overweight = 2, normal =1
recode   BMI_CatOverNormal1 (1=.) (2=2) (3=3)  (4=3)
generate BMI_CatOverUnder = BMI_Categorie1
recode   BMI_CatOverUnder (1=1) (2=.) (3=3)  (4=3)

*Analysis: ttest based on BMI
ttest T3_T1WD if time==3&Participate2==1, by(BMI_CatUnderNormal) 
ttest T3_T1WD if time==3&Participate2==1, by(BMI_CatOverNormal1)
ttest T3_T1WD if time==3&Participate2==1, by(BMI_CatOverUnder)
ttest T3_T1WD if time==3&Participate2==1&T3_T1WD>0.5, by(BMI_CatUnderNormal) 
ttest T3_T1WD if time==3&Participate2==1&T3_T1WD>0.5, by(BMI_CatOverNormal1)
ttest T3_T1WD if time==3&Participate2==1 &T3_T1WD>0.5, by(BMI_CatOverUnder)


