*|==============================================================================
*| TITLE
*| The Institutional Cost of Left-Leaning Populism in Latin America
*|
*| AUTHORS
*| João Pedro Bastos
*| Texas Tech University | Joao-Pedro.Bastos@ttu.edu
*|
*| This version: dd-mmm-yyyy
*|==============================================================================


*| Please see the main file for required packages as well data cleaning.

*| Packages
ssc install schemepack, replace		// Plot schemes

*| Plot settings
set scheme white_tableau
graph set window fontface "Times New Roman"

*| Directory
cd "/Users/jpmvbastos/Documents/GitHub/populism-sca/"


*|==============================================================================
*| SCA ESTIMATIONS
*|------------------------------------------------------------------------------

* Optional
log using "RobustChecks.smcl", replace

*| Argentina
*|------------------------------------------------------------------------------

* Baseline

use data.dta, clear

drop if country_code=="BOL"	
drop if country_code=="ECU"
drop if country_code=="NIC"
drop if country_code=="VEN"

drop if year < 1990
drop if year > 2013


global convergence	 = "nested allopt technique(nr)"
global predictors	 = "WGI1 WGI2 VDEM1 VDEM2 VDEM5 EFW"
global pre_treatment = "VDEMy(1994) VDEMy(1997) VDEMy(1998) VDEMy(2002)"
global treat_y       = "2003"
global x_axis		 = "1990(1)2013"



synth VDEMy $predictors $pre_treatment, trunit(2) trperiod($treat_y)		 ///
	  unitnames(country) resultsperiod($x_axis)								 ///
	  

    
synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(2) trperiod($treat_y)			 						 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								 ///
			
ereturn list

save ARG_AVG, replace			
			
rename 	VDEMy_synth	ARG_BL
drop 	effect
drop	pre_rmspe
drop	post_rmspe
drop 	lead

label variable	ARG_BL "Baseline: Argentina"

keep if country_code == "ARG"

drop VDEM1 VDEM2 VDEM3 VDEM4 VDEM5 VDEM6 WGI1 WGI2 WGI3
drop ICRG polity EFW populist id country country_code

save RC_ARG, replace
			 
*| Robustness Check 1 - Drop Largest Donor
*| 	-- Largest Donor == Brazil (0.466)
*| 	-- Same specification as in the paper

use data.dta, clear

drop if country_code=="BOL"	
drop if country_code=="ECU"
drop if country_code=="NIC"
drop if country_code=="VEN"
drop if country=="Brazil"

drop if year < 1990
drop if year > 2013

synth VDEMy $predictors $pre_treatment, trunit(2) trperiod($treat_y)		 ///
	  unitnames(country) resultsperiod($x_axis)								 ///
	  

synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(2) trperiod($treat_y)			 						 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								 ///
			 
ereturn list 

rename 	VDEMy_synth	ARG_DL
drop    effect  
drop	pre_rmspe
drop	post_rmspe
drop 	lead

label variable	ARG_DL "RC: Drop Largest"

keep if country_code == "ARG"

drop VDEM1 VDEM2 VDEM3 VDEM4 VDEM5 VDEM6 WGI1 WGI2 WGI3
drop ICRG polity EFW populist id country country_code

merge 1:1 year using RC_ARG
drop _merge
save RC_ARG, replace
			 
		 

*| Robustness Check 2 - All Pre-Treatment Lags 
*| 	-- Following Ferman, Pinto & Possebom (2020)

use data.dta, clear

drop if country_code=="BOL"	
drop if country_code=="ECU"
drop if country_code=="NIC"
drop if country_code=="VEN"

drop if year < 1990
drop if year > 2013


global convergence	 = "nested allopt technique(nr)"
global treat_y       = "2003"
global x_axis		 = "1990(1)2013"


synth VDEMy VDEMy(1990) VDEMy(1991) VDEMy(1992) VDEMy(1993) VDEMy(1994)     ///
	  VDEMy(1995) VDEMy(1996) VDEMy(1997) VDEMy(1998) VDEMy(1999) 			///
	  VDEMy(2000) VDEMy(2001) VDEMy(2002) 									///
	  , trunit(2) trperiod($treat_y)		 							    ///
	  unitnames(country) resultsperiod($x_axis)								///
	  
 

synth_runner VDEMy VDEMy(1990) VDEMy(1991) VDEMy(1992) VDEMy(1993) 			///
			 VDEMy(1994) VDEMy(1995) VDEMy(1996) VDEMy(1997) VDEMy(1998) 	///
			 VDEMy(1999) VDEMy(2000) VDEMy(2001) VDEMy(2002),				///
			 trunit(2) trperiod($treat_y)			 						///
			 gen_vars synthsettings(unitnames(country))						///
			 
ereturn list

rename 	VDEMy_synth	ARG_AL
drop    effect  
drop	pre_rmspe
drop	post_rmspe
drop 	lead

label variable	ARG_AL "RC: All Lags"

keep if country_code == "ARG"

drop VDEM1 VDEM2 VDEM3 VDEM4 VDEM5 VDEM6 WGI1 WGI2 WGI3
drop ICRG polity EFW populist id country country_code

merge 1:1  year using RC_ARG
drop _merge
save RC_ARG, replace

*| Robustness Check 3 - Drop Developed Countries
*| -- Retain the same specification as in the paper

use data.dta, clear

drop if country_code=="BOL"	
drop if country_code=="ECU"
drop if country_code=="NIC"
drop if country_code=="VEN"

drop if year < 1990
drop if year > 2013

*| Drop developed counties 
drop if country=="Australia"
drop if country=="Austria"
drop if country=="Belgium"
drop if country=="Canada"
drop if country=="Denmark"
drop if country=="France"
drop if country=="Germany"
drop if country=="Italy"
drop if country=="Japan"
drop if country=="Netherlands"
drop if country=="Portugal"
drop if country=="Spain"
drop if country=="Sweden"
drop if country=="Sweden"
drop if country=="United Kingdom" 	

global convergence	 = "nested allopt technique(nr)"
global predictors	 = "WGI1 WGI2 VDEM1 VDEM2 VDEM5 EFW"
global pre_treatment = "VDEMy(1994) VDEMy(1997) VDEMy(1998) VDEMy(2002)"
global treat_y       = "2003"
global x_axis		 = "1990(1)2013"


synth VDEMy $predictors $pre_treatment, trunit(2) trperiod($treat_y)		 ///
	  unitnames(country) resultsperiod($x_axis)								 ///
	  

    
synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(2) trperiod($treat_y)			 						 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								 ///
			
ereturn list

rename 	VDEMy_synth	ARG_DD
drop    effect  
drop	pre_rmspe
drop	post_rmspe
drop 	lead

label variable	ARG_DD "RC: Drop Developed"

keep if country_code == "ARG"

drop VDEM1 VDEM2 VDEM3 VDEM4 VDEM5 VDEM6 WGI1 WGI2 WGI3
drop ICRG polity EFW populist id country country_code

merge 1:1 year using RC_ARG
drop _merge
save RC_ARG, replace


*| Robustness Check 4 - Only Latin American Donor
*| -- Retain the same specification as in the paper

use data.dta, clear

drop if country_code=="BOL"	
drop if country_code=="ECU"
drop if country_code=="NIC"
drop if country_code=="VEN"

drop if year < 1990
drop if year > 2013


*| Drop non-Latin American countries
drop if country=="Algeria"
drop if country=="Nigeria"
drop if country=="Thailand"
drop if country=="Turkey"

global convergence	 = "nested allopt technique(nr)"
global predictors	 = "WGI1 WGI2 VDEM1 VDEM2 VDEM5 EFW"
global pre_treatment = "VDEMy(1994) VDEMy(1997) VDEMy(1998) VDEMy(2001) VDEMy(2002)"
global treat_y       = "2003"
global x_axis		 = "1990(1)2013"


synth VDEMy $predictors $pre_treatment, trunit(2) trperiod($treat_y)		 ///
	  unitnames(country) resultsperiod($x_axis)								 ///
	  

synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(2) trperiod($treat_y)			 						 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								 ///
			 
ereturn list

rename 	VDEMy_synth	ARG_LA
drop    effect  
drop	pre_rmspe
drop	post_rmspe
drop 	lead

label variable	ARG_LA "RC: Argentina"

keep if country_code == "ARG"

drop VDEM1 VDEM2 VDEM3 VDEM4 VDEM5 VDEM6 WGI1 WGI2 WGI3
drop ICRG polity EFW populist id country country_code

merge 1:1 year using RC_ARG
drop _merge
save RC_ARG, replace


global title	= "V-Dem: Liberal Democracy Index in Argentina"
global ytitle1	= "V-Dem: Liberal Democracy Index (0-100)"
global ytitle2  = "Synthetic effect"
global label1	= "Argentina"
global label2	= "Baseline Synthetic"
global label3	= "RC: Drop Largest Donor"
global label4	= "RC: All Pre-Treat Lags"
global label5	= "RC: Drop Developed"
global label6	= "RC: Latin America Only"
global treat_graph  = $treat_y -1

twoway line VDEMy	  year, lpattern(solid) lwidth (medthick)	 ///
	|| line ARG_BL    year, lpattern(dash) lwidth(medthick) lcolor(stred)  	 ///
	|| line ARG_DL    year, lpattern(shortdash) lwidth(medthin) lcolor(gray%85)	 ///
	|| line ARG_AL    year, lpattern(shortdash_dot) lwidth(medthin) lcolor(gray%85)	 ///
	|| line ARG_DD    year, lpattern(longdash) lwidth(medthin) lcolor(gray%85)	 ///
	|| line ARG_LA    year, lpattern(dot) lwidth(medthick) lcolor(gray%)	 ///
	   xline($treat_graph)	 ///
	   xlabel(1990(5)2015) 													 ///
	   ytitle($ytitle1) 				 									 ///
	   legend(label(1 $label1) label(2 $label2) label(3 $label3)			 ///
	   label(4 $label4) label(5 $label5) label(6 $label6) 					///
	   position(6) rows(2)) 
	   graph save "Figures/JP/ARG_RC", replace   

graph export  "Figures/JP/Fig_RC_ARG.png", replace
graph drop _all



*| Bolivia
*|------------------------------------------------------------------------------


use data.dta, clear

drop if country_code=="ARG"	
drop if country_code=="ECU"
drop if country_code=="NIC"
drop if country_code=="VEN"

drop if year < 1992
drop if year > 2016

global convergence	 = "nested allopt technique(nr)"
global predictors    = "VDEM6 polity2 VDEM1 ICRG"
global pre_treatment = "VDEMy(1992) VDEMy(1995) VDEMy(1998) VDEMy(2000) VDEMy(2002) VDEMy(2005)"
global treat_y       = "2006"
global x_axis		 = "1992(1)2015"


synth VDEMy $predictors $pre_treatment, trunit(6) trperiod($treat_y)	 ///
	  unitnames(country) resultsperiod($x_axis)							 ///

    
synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(6) trperiod($treat_y)			 						 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								 ///

ereturn list

save BOL_AVG, replace			
			
rename 	VDEMy_synth	BOL_BL
drop 	effect
drop	pre_rmspe
drop	post_rmspe
drop 	lead

label variable	BOL_BL "Baseline: Bolivia"

keep if country_code == "BOL"

drop VDEM1 VDEM2 VDEM3 VDEM4 VDEM5 VDEM6 WGI1 WGI2 WGI3
drop ICRG polity EFW populist id country country_code

save RC_BOL, replace



*| Robustness Check 1 - Drop Largest Donor
*| 	-- Largest Donor == Paraguay (0.508)
*| 	-- Same specification as suggestion above

use data.dta, clear

drop if country_code=="ARG"	
drop if country_code=="ECU"
drop if country_code=="NIC"
drop if country_code=="VEN"

drop if country=="Paraguay"

drop if year < 1992
drop if year > 2016

global convergence	 = "nested allopt technique(nr)"
global predictors    = "VDEM6 polity2 VDEM1 ICRG"
global pre_treatment = "VDEMy(1992) VDEMy(1995) VDEMy(1998) VDEMy(2000) VDEMy(2002) VDEMy(2005)"
global treat_y       = "2006"
global x_axis		 = "1992(1)2015"


synth VDEMy $predictors $pre_treatment, trunit(6) trperiod($treat_y)	 ///
	  unitnames(country) resultsperiod($x_axis)							 ///



synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(6) trperiod($treat_y)			 						 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								 ///

ereturn list 

rename 	VDEMy_synth	BOL_DL
drop    effect  
drop	pre_rmspe
drop	post_rmspe
drop 	lead

label variable	BOL_DL "RC: Drop Largest"

keep if country_code == "BOL"

drop VDEM1 VDEM2 VDEM3 VDEM4 VDEM5 VDEM6 WGI1 WGI2 WGI3
drop ICRG polity EFW populist id country country_code

merge 1:1 year using RC_BOL
drop _merge
save RC_BOL, replace




*| Robustness Check 2 - All Pre-Treatment Lags 
*|	-- Following Ferman, Pinto & Possebom (2020)

use data.dta, clear

drop if country_code=="ARG"	
drop if country_code=="ECU"
drop if country_code=="NIC"
drop if country_code=="VEN"

drop if year < 1992
drop if year > 2016


global treat_y       = "2006"
global x_axis		 = "1992(1)2015"


synth VDEMy VDEMy(1992) VDEMy(1993) VDEMy(1994)    							 ///
	  VDEMy(1995) VDEMy(1996) VDEMy(1997) VDEMy(1998) VDEMy(1999) 			///
	  VDEMy(2000) VDEMy(2001) VDEMy(2002) VDEMy(2003) VDEMy(2004) VDEMy(2005),	///
	  trunit(6) trperiod($treat_y)		 						///
	  unitnames(country) resultsperiod($x_axis)								///

    
synth_runner VDEMy VDEMy(1992) VDEMy(1993) 									///
			 VDEMy(1994) VDEMy(1995) VDEMy(1996) VDEMy(1997) VDEMy(1998) 	///
			 VDEMy(1999) VDEMy(2000) VDEMy(2001) VDEMy(2002) VDEMy(2003)	///
			 VDEMy(2004) VDEMy(2005), trunit(6) trperiod($treat_y)			///
			 gen_vars synthsettings(unitnames(country))						///
			 
ereturn list

rename 	VDEMy_synth	BOL_AL
drop    effect  
drop	pre_rmspe
drop	post_rmspe
drop 	lead

label variable	BOL_AL "RC: All Lags"

keep if country_code == "BOL"

drop VDEM1 VDEM2 VDEM3 VDEM4 VDEM5 VDEM6 WGI1 WGI2 WGI3
drop ICRG polity EFW populist id country country_code

merge 1:1  year using RC_BOL
drop _merge
save RC_BOL, replace


*| Robustness Check 3 - Drop Developed Countries
*| -- Retain the same specification as suggestion above

use data.dta, clear

drop if country_code=="ARG"	
drop if country_code=="ECU"
drop if country_code=="NIC"
drop if country_code=="VEN"

drop if year < 1992
drop if year > 2016

* Drop developed counties 
drop if country=="Australia"
drop if country=="Austria"
drop if country=="Belgium"
drop if country=="Canada"
drop if country=="Denmark"
drop if country=="France"
drop if country=="Germany"
drop if country=="Italy"
drop if country=="Japan"
drop if country=="Netherlands"
drop if country=="Portugal"
drop if country=="Spain"
drop if country=="Sweden"
drop if country=="Sweden"
drop if country=="United Kingdom"


global convergence	 = "nested allopt technique(nr)"
global predictors    = "VDEM6 polity2 VDEM1 ICRG"
global pre_treatment = "VDEMy(1992) VDEMy(1995) VDEMy(1998) VDEMy(2000) VDEMy(2002) VDEMy(2005)"
global treat_y       = "2006"
global x_axis		 = "1992(1)2015"


synth VDEMy $predictors $pre_treatment, trunit(6) trperiod($treat_y)	 ///
	  unitnames(country) resultsperiod($x_axis)							 ///
	  


synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(6) trperiod($treat_y)			 						 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								 ///

ereturn list

rename 	VDEMy_synth	BOL_DD
drop    effect  
drop	pre_rmspe
drop	post_rmspe
drop 	lead

label variable	BOL_DD "RC: Drop Developed"

keep if country_code == "BOL"

drop VDEM1 VDEM2 VDEM3 VDEM4 VDEM5 VDEM6 WGI1 WGI2 WGI3
drop ICRG polity EFW populist id country country_code

merge 1:1 year using RC_BOL
drop _merge
save RC_BOL, replace



*| Robustness Check 4 - Only Latin American Donor
*| -- Retain the same specification as the suggestion above

use data.dta, clear

drop if country_code=="ARG"	
drop if country_code=="ECU"
drop if country_code=="NIC"
drop if country_code=="VEN"

* Drop developed counties 
drop if country=="Australia"
drop if country=="Austria"
drop if country=="Belgium"
drop if country=="Canada"
drop if country=="Denmark"
drop if country=="France"
drop if country=="Germany"
drop if country=="Italy"
drop if country=="Japan"
drop if country=="Netherlands"
drop if country=="Portugal"
drop if country=="Spain"
drop if country=="Sweden"
drop if country=="Sweden"
drop if country=="United Kingdom"

* Drop non-Latin American
drop if country=="Algeria"
drop if country=="Nigeria"
drop if country=="Thailand"
drop if country=="Turkey"


drop if year < 1992
drop if year > 2016

global convergence	 = "nested allopt technique(nr)"
global predictors    = "VDEM6 polity2 VDEM1 ICRG"
global pre_treatment = "VDEMy(1992) VDEMy(1995) VDEMy(1998) VDEMy(2000) VDEMy(2002) VDEMy(2005)"
global treat_y       = "2006"
global x_axis		 = "1992(1)2015"


synth VDEMy $predictors $pre_treatment, trunit(6) trperiod($treat_y)	 ///
	  unitnames(country) resultsperiod($x_axis)							 ///
	  
 
synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(6) trperiod($treat_y)			 						 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								 ///

ereturn list

rename 	VDEMy_synth	BOL_LA
drop    effect  
drop	pre_rmspe
drop	post_rmspe
drop 	lead

label variable	BOL_LA "RC: Latin America Only"

keep if country_code == "BOL"

drop VDEM1 VDEM2 VDEM3 VDEM4 VDEM5 VDEM6 WGI1 WGI2 WGI3
drop ICRG polity EFW populist id country country_code

merge 1:1 year using RC_BOL
drop _merge
save RC_BOL, replace


global title	= "V-Dem: Liberal Democracy Index in Bolivia"
global ytitle1	= "V-Dem: Liberal Democracy Index (0-100)"
global ytitle2  = "Synthetic effect"
global label1	= "Bolivia"
global label2	= "Baseline Synthetic"
global label3	= "RC: Drop Largest Donor"
global label4	= "RC: All Pre-Treat Lags"
global label5	= "RC: Drop Developed"
global label6	= "RC: Latin America Only"
global treat_graph  = $treat_y -1

twoway line VDEMy	  year, lpattern(solid) lwidth (medthick)	 ///
	|| line BOL_BL    year, lpattern(dash) lwidth(medthick) lcolor(stred)  	 ///
	|| line BOL_DL    year, lpattern(shortdash) lwidth(medthin) lcolor(gray%85)	 ///
	|| line BOL_AL    year, lpattern(shortdash_dot) lwidth(medthin) lcolor(gray%85)	 ///
	|| line BOL_DD    year, lpattern(longdash) lwidth(medthin) lcolor(gray%85)	 ///
	|| line BOL_LA    year, lpattern(dot) lwidth(medthick) lcolor(gray%)	 ///
	   xline($treat_graph)	 ///
	   xlabel(1990(5)2015) 													 ///
	   ytitle($ytitle1) 				 									 ///
	   legend(label(1 $label1) label(2 $label2) label(3 $label3)			 ///
	   label(4 $label4) label(5 $label5) label(6 $label6) 					///
	   position(6) rows(2)) 
	   graph save "Figures/JP/BOL_RC", replace   

graph export  "Figures/JP/Fig_RC_BOL.png", replace
graph drop _all



*| Ecuador
*|------------------------------------------------------------------------------
use data.dta, clear

drop if country_code=="ARG"	
drop if country_code=="BOL"
drop if country_code=="NIC"
drop if country_code=="VEN"

drop if year < 1993
drop if year > 2017

global convergence	 = "nested allopt technique(nr)"
global predictors    = "EFW polity2 VDEM4 ICRG"
global pre_treatment = "VDEMy(1997) VDEMy(2002) VDEMy(2003) VDEMy(2006)"
global treat_y       = "2007"
global x_axis		 = "1993(1)2017"


synth VDEMy $predictors $pre_treatment, trunit(13) trperiod($treat_y)	 ///
	  unitnames(country) resultsperiod($x_axis)							 ///

 
synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(13) trperiod($treat_y)			 						 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								 ///

ereturn list

save ECU_AVG, replace			
			
rename 	VDEMy_synth	ECU_BL
drop 	effect
drop	pre_rmspe
drop	post_rmspe
drop 	lead

label variable	ECU_BL "Baseline: Ecuador"

keep if country_code == "ECU"

drop VDEM1 VDEM2 VDEM3 VDEM4 VDEM5 VDEM6 WGI1 WGI2 WGI3
drop ICRG polity EFW populist id country country_code

save RC_ECU, replace


*| Robustness Check 1 - Drop Largest Donor
*| 	-- Largest Donor == Colombia (0.520)
*| 	-- Same specification as suggestion above

use data.dta, clear

drop if country_code=="ARG"	
drop if country_code=="BOL"
drop if country_code=="NIC"
drop if country_code=="VEN"

drop if country=="Colombia"

drop if year < 1993
drop if year > 2017

global convergence	 = "nested allopt technique(nr)"
global predictors    = "EFW polity2 VDEM4 ICRG"
global pre_treatment = "VDEMy(1997) VDEMy(2002) VDEMy(2003) VDEMy(2006)"
global treat_y       = "2007"
global x_axis		 = "1993(1)2017"


synth VDEMy $predictors $pre_treatment, trunit(13) trperiod($treat_y)	 ///
	  unitnames(country) resultsperiod($x_axis)							 ///
	  

synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(13) trperiod($treat_y)			 						 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								 ///

ereturn list 

rename 	VDEMy_synth	ECU_DL
drop    effect  
drop	pre_rmspe
drop	post_rmspe
drop 	lead

label variable	ECU_DL "RC: Drop Largest"

keep if country_code == "ECU"

drop VDEM1 VDEM2 VDEM3 VDEM4 VDEM5 VDEM6 WGI1 WGI2 WGI3
drop ICRG polity EFW populist id country country_code

merge 1:1 year using RC_ECU
drop _merge
save RC_ECU, replace


* Robustness Check 2 - All Pre-Treatment Lags 
* 	-- Following Ferman, Pinto & Possebom (2020)

use data.dta, clear

drop if country_code=="ARG"	
drop if country_code=="BOL"
drop if country_code=="NIC"
drop if country_code=="VEN"

drop if year < 1993
drop if year > 2017

global convergence	 = "nested allopt technique(nr)"
global treat_y       = "2007"
global x_axis		 = "1993(1)2017"


synth VDEMy VDEMy(1993) VDEMy(1994)     ///
	  VDEMy(1995) VDEMy(1996) VDEMy(1997) VDEMy(1998) VDEMy(1999) 			///
	  VDEMy(2000) VDEMy(2001) VDEMy(2002) VDEMy(2003) VDEMy(2004)			///
	  VDEMy(2005) VDEMy(2006), trunit(13) trperiod($treat_y)		 		///
	  unitnames(country) resultsperiod($x_axis)								///
	  
    
synth_runner VDEMy VDEMy(1993) VDEMy(1994) VDEMy(1995) VDEMy(1996) 			///
			 VDEMy(1997) VDEMy(1998) VDEMy(1999) VDEMy(2000) VDEMy(2001)    ///
			 VDEMy(2002) VDEMy(2003) VDEMy(2004) VDEMy(2005) VDEMy(2006),   ///
			 trunit(13) trperiod($treat_y)									///
			 gen_vars synthsettings(unitnames(country))						///
			 
ereturn list

rename 	VDEMy_synth	ECU_AL
drop    effect  
drop	pre_rmspe
drop	post_rmspe
drop 	lead

label variable	ECU_AL "RC: All Lags"

keep if country_code == "ECU"

drop VDEM1 VDEM2 VDEM3 VDEM4 VDEM5 VDEM6 WGI1 WGI2 WGI3
drop ICRG polity EFW populist id country country_code

merge 1:1  year using RC_ECU
drop _merge
save RC_ECU, replace

*| Robustness Check 3 - Drop Developed Countries
*| -- Retain the same specification as suggestion above

use data.dta, clear

drop if country_code=="ARG"	
drop if country_code=="BOL"
drop if country_code=="NIC"
drop if country_code=="VEN"

drop if year < 1993
drop if year > 2017

* Drop developed counties 
drop if country=="Australia"
drop if country=="Austria"
drop if country=="Belgium"
drop if country=="Canada"
drop if country=="Denmark"
drop if country=="France"
drop if country=="Germany"
drop if country=="Italy"
drop if country=="Japan"
drop if country=="Netherlands"
drop if country=="Portugal"
drop if country=="Spain"
drop if country=="Sweden"
drop if country=="Sweden"
drop if country=="United Kingdom"

global convergence	 = "nested allopt technique(nr)"
global predictors    = "EFW polity2 VDEM4 ICRG"
global pre_treatment = "VDEMy(1997) VDEMy(2002) VDEMy(2003) VDEMy(2006)"
global treat_y       = "2007"
global x_axis		 = "1993(1)2017"


synth VDEMy $predictors $pre_treatment, trunit(13) trperiod($treat_y)	 ///
	  unitnames(country) resultsperiod($x_axis)							 ///

synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(13) trperiod($treat_y)			 						 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								 ///

ereturn list

rename 	VDEMy_synth	ECU_DD
drop    effect  
drop	pre_rmspe
drop	post_rmspe
drop 	lead

label variable	ECU_DD "RC: Drop Developed"

keep if country_code == "ECU"

drop VDEM1 VDEM2 VDEM3 VDEM4 VDEM5 VDEM6 WGI1 WGI2 WGI3
drop ICRG polity EFW populist id country country_code

merge 1:1 year using RC_ECU
drop _merge
save RC_ECU, replace

*| Robustness Check 4 - Only Latin American Donor
*| -- Retain the same specification as the suggestion above

use data.dta, clear

drop if country_code=="ARG"	
drop if country_code=="BOL"
drop if country_code=="NIC"
drop if country_code=="VEN"

* Drop developed counties 
drop if country=="Australia"
drop if country=="Austria"
drop if country=="Belgium"
drop if country=="Canada"
drop if country=="Denmark"
drop if country=="France"
drop if country=="Germany"
drop if country=="Italy"
drop if country=="Japan"
drop if country=="Netherlands"
drop if country=="Portugal"
drop if country=="Spain"
drop if country=="Sweden"
drop if country=="Sweden"
drop if country=="United Kingdom"

* Drop non-Latin American
drop if country=="Algeria"
drop if country=="Nigeria"
drop if country=="Thailand"
drop if country=="Turkey"

drop if year < 1993
drop if year > 2017

global convergence	 = "nested allopt technique(nr)"
global predictors    = "EFW polity2 VDEM4 ICRG"
global pre_treatment = "VDEMy(1997) VDEMy(2002) VDEMy(2003) VDEMy(2006)"
global treat_y       = "2007"
global x_axis		 = "1993(1)2017"

synth VDEMy $predictors $pre_treatment, trunit(13) trperiod($treat_y)	 ///
	  unitnames(country) resultsperiod($x_axis)							 ///
	  

synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(13) trperiod($treat_y)			 						 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								 ///

ereturn list

rename 	VDEMy_synth	ECU_LA
drop    effect  
drop	pre_rmspe
drop	post_rmspe
drop 	lead

label variable	ECU_LA "RC: Latin America Only"

keep if country_code == "ECU"

drop VDEM1 VDEM2 VDEM3 VDEM4 VDEM5 VDEM6 WGI1 WGI2 WGI3
drop ICRG polity EFW populist id country country_code

merge 1:1 year using RC_ECU
drop _merge
save RC_ECU, replace

* PLOT

global title	= "V-Dem: Liberal Democracy Index in Ecuador"
global ytitle1	= "V-Dem: Liberal Democracy Index (0-100)"
global ytitle2  = "Synthetic effect"
global label1	= "Ecuador"
global label2	= "Baseline Synthetic"
global label3	= "RC: Drop Largest Donor"
global label4	= "RC: All Pre-Treat Lags"
global label5	= "RC: Drop Developed"
global label6	= "RC: Latin America Only"
global treat_graph  = $treat_y -1

twoway line VDEMy	  year, lpattern(solid) lwidth (medthick)	 ///
	|| line ECU_BL    year, lpattern(dash) lwidth(medthick) lcolor(stred)  	 ///
	|| line ECU_DL    year, lpattern(shortdash) lwidth(medthin) lcolor(gray%85)	 ///
	|| line ECU_AL    year, lpattern(shortdash_dot) lwidth(medthin) lcolor(gray%85)	 ///
	|| line ECU_DD    year, lpattern(longdash) lwidth(medthin) lcolor(gray%85)	 ///
	|| line ECU_LA    year, lpattern(dot) lwidth(medthick) lcolor(gray%)	 ///
	   xline($treat_graph)	 ///
	   xlabel(1990(5)2015) 													 ///
	   ytitle($ytitle1) 				 									 ///
	   legend(label(1 $label1) label(2 $label2) label(3 $label3)			 ///
	   label(4 $label4) label(5 $label5) label(6 $label6) 					///
	   position(6) rows(2)) 
	   graph save "Figures/JP/ECU_RC", replace   

graph export  "Figures/JP/Fig_RC_ECU.png", replace
graph drop _all



*| Nicaragua
*|------------------------------------------------------------------------------

use data.dta, clear

drop if country_code=="ARG"	
drop if country_code=="BOL"
drop if country_code=="ECU"
drop if country_code=="VEN"

drop if year < 1997
drop if year > 2017

global convergence	 = "nested allopt technique(nr)"
global predictors    = "VDEM2 VDEM4 WGI1 polity2 WGI3"
global pre_treatment = "VDEMy(1997) VDEMy(2001) VDEMy(2002) VDEMy(2004) VDEMy(2006)"
global treat_y       = "2007"
global x_axis		 = "1997(1)2017"

synth VDEMy $predictors $pre_treatment, trunit(21) trperiod($treat_y)	 ///
	  unitnames(country) resultsperiod($x_axis)							 ///
	  
	  
synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(21) trperiod($treat_y)			 						 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								 ///
			 
ereturn list	

save NIC_AVG, replace		
			
rename 	VDEMy_synth	NIC_BL
drop 	effect
drop	pre_rmspe
drop	post_rmspe
drop 	lead

label variable	NIC_BL "Baseline: Nicaragua"

keep if country_code == "NIC"

drop VDEM1 VDEM2 VDEM3 VDEM4 VDEM5 VDEM6 WGI1 WGI2 WGI3
drop ICRG polity EFW populist id country country_code

save RC_NIC, replace

*| Robustness Check 1 - Drop Largest Donor
*| 	-- Largest Donor == Colombia (0.520)
*| 	-- Same specification as suggestion above

use data.dta, clear

drop if country_code=="ARG"	
drop if country_code=="BOL"
drop if country_code=="ECU"
drop if country_code=="VEN"

drop if country=="Colombia"

drop if year < 1997
drop if year > 2017

global convergence	 = "nested allopt technique(nr)"
global predictors    = "VDEM2 VDEM4 WGI1 polity2 WGI3"
global pre_treatment = "VDEMy(1997) VDEMy(2001) VDEMy(2002) VDEMy(2004) VDEMy(2006)"
global treat_y       = "2007"
global x_axis		 = "1997(1)2017"

synth VDEMy $predictors $pre_treatment, trunit(21) trperiod($treat_y)	 ///
	  unitnames(country) resultsperiod($x_axis)							 ///
	  
	  
synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(21) trperiod($treat_y)			 						 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								 ///
			 
ereturn list 

rename 	VDEMy_synth	NIC_DL
drop    effect  
drop	pre_rmspe
drop	post_rmspe
drop 	lead

label variable	NIC_DL "RC: Drop Largest"

keep if country_code == "NIC"

drop VDEM1 VDEM2 VDEM3 VDEM4 VDEM5 VDEM6 WGI1 WGI2 WGI3
drop ICRG polity EFW populist id country country_code

merge 1:1 year using RC_NIC
drop _merge
save RC_NIC, replace		


* Robustness Check 2 - All Pre-Treatment Lags 
* 	-- Following Ferman, Pinto & Possebom (2020)

use data.dta, clear

drop if country_code=="ARG"	
drop if country_code=="BOL"
drop if country_code=="ECU"
drop if country_code=="VEN"

drop if year < 1997
drop if year > 2017

global convergence	 = "nested allopt technique(nr)"
global treat_y       = "2007"
global x_axis		 = "1997(1)2017"


synth VDEMy VDEMy(1997) VDEMy(1998) VDEMy(1999) VDEMy(2000)					 ///
	  VDEMy(2001) VDEMy(2002) VDEMy(2003) VDEMy(2004)						 ///
	  VDEMy(2005) VDEMy(2006) VDEMy(2007), trunit(21) trperiod($treat_y)	 ///
	  unitnames(country) resultsperiod($x_axis)								 
	  
    
synth_runner VDEMy VDEMy(1997) VDEMy(1998) VDEMy(1999) VDEMy(2000) 			///
			 VDEMy(2001) VDEMy(2002) VDEMy(2003) VDEMy(2004) VDEMy(2005) 	///
			 VDEMy(2006) VDEMy(2007), trunit(21) trperiod($treat_y)						///
			 gen_vars synthsettings(unitnames(country))						///
			 
ereturn list

rename 	VDEMy_synth	NIC_AL
drop    effect  
drop	pre_rmspe
drop	post_rmspe
drop 	lead

label variable	NIC_AL "RC: All Lags"

keep if country_code == "NIC"

drop VDEM1 VDEM2 VDEM3 VDEM4 VDEM5 VDEM6 WGI1 WGI2 WGI3
drop ICRG polity EFW populist id country country_code

merge 1:1  year using RC_NIC
drop _merge
save RC_NIC, replace



*| Robustness Check 3 - Drop Developed Countries
*| -- Retain the same specification as suggestion above

use data.dta, clear

drop if country_code=="ARG"	
drop if country_code=="BOL"
drop if country_code=="ECU"
drop if country_code=="VEN"

drop if year < 1997
drop if year > 2017


* Drop developed counties 
drop if country=="Australia"
drop if country=="Austria"
drop if country=="Belgium"
drop if country=="Canada"
drop if country=="Denmark"
drop if country=="France"
drop if country=="Germany"
drop if country=="Italy"
drop if country=="Japan"
drop if country=="Netherlands"
drop if country=="Portugal"
drop if country=="Spain"
drop if country=="Sweden"
drop if country=="Sweden"
drop if country=="United Kingdom"

global convergence	 = "nested allopt technique(nr)"
global predictors    = "VDEM2 VDEM4 WGI1 polity2 WGI3"
global pre_treatment = "VDEMy(1997) VDEMy(2001) VDEMy(2002) VDEMy(2004) VDEMy(2006)"
global treat_y       = "2007"
global x_axis		 = "1997(1)2017"


synth VDEMy $predictors $pre_treatment, trunit(21) trperiod($treat_y)	 ///
	  unitnames(country) resultsperiod($x_axis)				 		     ///
	  

synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(21) trperiod($treat_y) 									 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								

ereturn list

rename 	VDEMy_synth	NIC_DD
drop    effect  
drop	pre_rmspe
drop	post_rmspe
drop 	lead

label variable	NIC_DD "RC: Drop Developed"

keep if country_code == "NIC"

drop VDEM1 VDEM2 VDEM3 VDEM4 VDEM5 VDEM6 WGI1 WGI2 WGI3
drop ICRG polity EFW populist id country country_code

merge 1:1 year using RC_NIC
drop _merge
save RC_NIC, replace

*| Robustness Check 4 - Only Latin American Donors
*| -- Retain the same specification as baseline

use data.dta, clear

drop if country_code=="ARG"	
drop if country_code=="BOL"
drop if country_code=="ECU"
drop if country_code=="VEN"

drop if year < 1997
drop if year > 2017

* Drop developed counties 
drop if country=="Australia"
drop if country=="Austria"
drop if country=="Belgium"
drop if country=="Canada"
drop if country=="Denmark"
drop if country=="France"
drop if country=="Germany"
drop if country=="Italy"
drop if country=="Japan"
drop if country=="Netherlands"
drop if country=="Portugal"
drop if country=="Spain"
drop if country=="Sweden"
drop if country=="Sweden"
drop if country=="United Kingdom"

* Drop non-Latin American
drop if country=="Algeria"
drop if country=="Nigeria"
drop if country=="Thailand"
drop if country=="Turkey"


global convergence	 = "nested allopt technique(nr)"
global predictors    = "VDEM2 VDEM4 WGI1 polity2 WGI3"
global pre_treatment = "VDEMy(1997) VDEMy(2001) VDEMy(2002) VDEMy(2004) VDEMy(2006)"
global treat_y       = "2007"
global x_axis		 = "1997(1)2017"


synth VDEMy $predictors $pre_treatment, trunit(21) trperiod($treat_y)	 ///
	  unitnames(country) resultsperiod($x_axis)				 		     ///
	  

synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(21) trperiod($treat_y) 									 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								

ereturn list

rename 	VDEMy_synth	NIC_LA
drop    effect  
drop	pre_rmspe
drop	post_rmspe
drop 	lead

label variable	NIC_LA "RC: Latin America Only"

keep if country_code == "NIC"

drop VDEM1 VDEM2 VDEM3 VDEM4 VDEM5 VDEM6 WGI1 WGI2 WGI3
drop ICRG polity EFW populist id country country_code

merge 1:1 year using RC_NIC
drop _merge
save RC_NIC, replace

global title	= "V-Dem: Liberal Democracy Index in Nicaragua"
global ytitle1	= "V-Dem: Liberal Democracy Index (0-100)"
global ytitle2  = "Synthetic effect"
global label1	= "Nicaragua"
global label2	= "Baseline Synthetic"
global label3	= "RC: Drop Largest Donor"
global label4	= "RC: All Pre-Treat Lags"
global label5	= "RC: Drop Developed"
global label6	= "RC: Latin America Only"
global treat_graph  = $treat_y -1

twoway line VDEMy	  year, lpattern(solid) lwidth (medthick)	 ///
	|| line NIC_BL    year, lpattern(dash) lwidth(medthick) lcolor(stred)  	 ///
	|| line NIC_DL    year, lpattern(shortdash) lwidth(medthin) lcolor(gray%85)	 ///
	|| line NIC_AL    year, lpattern(shortdash_dot) lwidth(medthin) lcolor(gray%85)	 ///
	|| line NIC_DD    year, lpattern(longdash) lwidth(medthin) lcolor(gray%85)	 ///
	|| line NIC_LA    year, lpattern(dot) lwidth(medthick) lcolor(gray%)	 ///
	   xline($treat_graph)	 ///
	   xlabel(1995(5)2020) 													 ///
	   ytitle($ytitle1) 				 									 ///
	   legend(label(1 $label1) label(2 $label2) label(3 $label3)			 ///
	   label(4 $label4) label(5 $label5) label(6 $label6) 					///
	   position(6) rows(2)) 
	   graph save "Figures/JP/NIC_RC", replace   

graph export  "Figures/JP/Fig_RC_NIC.png", replace
graph drop _all


*| Venezuela
*|------------------------------------------------------------------------------


use data.dta, clear

drop if country_code=="ARG"	
drop if country_code=="BOL"
drop if country_code=="ECU"
drop if country_code=="NIC"

drop if year < 1980
drop if year > 2009

global convergence	 = "nested allopt technique(nr)"
global predictors    = "VDEM2 polity2 EFW ICRG"
global pre_treatment = "VDEMy(1985) VDEMy(1988) VDEMy(1992) VDEMy(1994) VDEMy(1998)"
global treat_y       = "1999"
global x_axis		 = "1980(1)2009"


synth VDEMy $predictors $pre_treatment, trunit(32) trperiod($treat_y)	 ///
	  unitnames(country) resultsperiod($x_axis)			 fig				
	  

    
synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(32) trperiod($treat_y)			 						 ///
			 gen_vars 				 								 ///
			 synthsettings(unitnames(country))								 ///


ereturn list

save VEN_AVG, replace			
			
rename 	VDEMy_synth	VEN_BL
drop 	effect
drop	pre_rmspe
drop	post_rmspe
drop 	lead

label variable	VEN_BL "Baseline: Venezuela"

keep if country_code == "VEN"

drop VDEM1 VDEM2 VDEM3 VDEM4 VDEM5 VDEM6 WGI1 WGI2 WGI3
drop ICRG polity EFW populist id country country_code

save RC_VEN, replace


*| Robustness Check 1 - Drop Largest Donor
*| 	-- Largest Donor == Spain
*| 	-- Same specification as suggestion above

use data.dta, clear

drop if country_code=="ARG"	
drop if country_code=="BOL"
drop if country_code=="ECU"
drop if country_code=="NIC"

drop if country=="Spain"

drop if year < 1980
drop if year > 2009

global convergence	 = "nested allopt technique(nr)"
global predictors    = "VDEM2 polity2 EFW ICRG"
global pre_treatment = "VDEMy(1985) VDEMy(1988) VDEMy(1992) VDEMy(1994) VDEMy(1998)"
global treat_y       = "1999"
global x_axis		 = "1980(1)2009"


synth VDEMy $predictors $pre_treatment, trunit(32) trperiod($treat_y)	 ///
	  unitnames(country) resultsperiod($x_axis)	 fig

	  
synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(32) trperiod($treat_y)			 						 ///
			 gen_vars 				 								 ///
			 synthsettings(unitnames(country))								 ///

effect_graphs
ereturn list 

rename 	VDEMy_synth	VEN_DL
drop    effect  
drop	pre_rmspe
drop	post_rmspe
drop 	lead

label variable	VEN_DL "RC: Drop Largest"

keep if country_code == "VEN"

drop VDEM1 VDEM2 VDEM3 VDEM4 VDEM5 VDEM6 WGI1 WGI2 WGI3
drop ICRG polity EFW populist id country country_code

merge 1:1 year using RC_VEN
drop _merge
save RC_VEN, replace

* Robustness Check 2 - All Pre-Treatment Lags 
* 	-- Following Ferman, Pinto & Possebom (2020)


use data.dta, clear

drop if country_code=="ARG"	
drop if country_code=="BOL"
drop if country_code=="ECU"
drop if country_code=="NIC"

drop if year < 1980
drop if year > 2009


global convergence	 = "nested allopt technique(nr)"
global treat_y       = "1999"
global x_axis		 = "1980(1)2009"


synth VDEMy VDEMy(1980) VDEMy(1981) VDEMy(1982) VDEMy(1983) VDEMy(1984)			///
	  VDEMy(1985) VDEMy(1986) VDEMy(1987) VDEMy(1988) VDEMy(1989) VDEMy(1990)	///
	  VDEMy(1991) VDEMy(1992) VDEMy(1993) VDEMy(1994) VDEMy(1995) VDEMy(1996)	///
	  VDEMy(1997) VDEMy(1998), trunit(32) trperiod($treat_y)	 				///
	  unitnames(country) resultsperiod($x_axis)							 		///

    
synth_runner VDEMy VDEMy(1980) VDEMy(1981) VDEMy(1982) VDEMy(1983) 	///
			 VDEMy(1984) VDEMy(1985) VDEMy(1986) VDEMy(1987) VDEMy(1988) 	///	
			 VDEMy(1989) VDEMy(1990) VDEMy(1991) VDEMy(1992) VDEMy(1993) 	///
			 VDEMy(1994) VDEMy(1995) VDEMy(1996) VDEMy(1997) VDEMy(1998), 	///
			 trunit(32) trperiod($treat_y)			 					    ///
			 gen_vars 				 								 		///
			 synthsettings(unitnames(country))							   ///

effect_graphs

ereturn list

rename 	VDEMy_synth	VEN_AL
drop    effect  
drop	pre_rmspe
drop	post_rmspe
drop 	lead

label variable	VEN_AL "RC: All Lags"

keep if country_code == "VEN"

drop VDEM1 VDEM2 VDEM3 VDEM4 VDEM5 VDEM6 WGI1 WGI2 WGI3
drop ICRG polity EFW populist id country country_code

merge 1:1  year using RC_VEN
drop _merge
save RC_VEN, replace



*| Robustness Check 3 - Drop Developed Countries
*| -- Drop VDEM 3 and ICRG as predictors 

use data.dta, clear

drop if country_code=="ARG"	
drop if country_code=="BOL"
drop if country_code=="ECU"
drop if country_code=="NIC"

drop if year < 1980
drop if year > 2009


* Drop developed counties 
drop if country=="Australia"
drop if country=="Austria"
drop if country=="Belgium"
drop if country=="Canada"
drop if country=="Denmark"
drop if country=="France"
drop if country=="Germany"
drop if country=="Italy"
drop if country=="Japan"
drop if country=="Netherlands"
drop if country=="Portugal"
drop if country=="Spain"
drop if country=="Sweden"
drop if country=="Sweden"
drop if country=="United Kingdom"


global convergence	 = "nested allopt technique(nr)"
global predictors    = "VDEM2 polity2 EFW"
global pre_treatment = "VDEMy(1985) VDEMy(1988) VDEMy(1992) VDEMy(1994) VDEMy(1998)"
global treat_y       = "1999"
global x_axis		 = "1980(1)2009"


synth VDEMy  $pre_treatment $predictors, trunit(32) trperiod($treat_y)	 ///
	  unitnames(country) resultsperiod($x_axis)							 ///



synth_runner VDEMy  $pre_treatment $predictors,								 ///
			 trunit(32) trperiod($treat_y)			 						 ///
			 gen_vars 				 								 		///
			 synthsettings(unitnames(country))								 ///

effect_graphs
ereturn list

rename 	VDEMy_synth	VEN_DD
drop    effect  
drop	pre_rmspe
drop	post_rmspe
drop 	lead

label variable	VEN_DD "RC: Drop Developed"

keep if country_code == "VEN"

drop VDEM1 VDEM2 VDEM3 VDEM4 VDEM5 VDEM6 WGI1 WGI2 WGI3
drop ICRG polity EFW populist id country country_code

merge 1:1 year using RC_VEN
drop _merge
save RC_VEN, replace


*| Robustness Check 4 - Only Latin American Donors

use data.dta, clear

drop if country_code=="ARG"	
drop if country_code=="BOL"
drop if country_code=="ECU"
drop if country_code=="NIC"

drop if year < 1980
drop if year > 2009


* Drop developed counties 
drop if country=="Australia"
drop if country=="Austria"
drop if country=="Belgium"
drop if country=="Canada"
drop if country=="Denmark"
drop if country=="France"
drop if country=="Germany"
drop if country=="Italy"
drop if country=="Japan"
drop if country=="Netherlands"
drop if country=="Portugal"
drop if country=="Spain"
drop if country=="Sweden"
drop if country=="Sweden"
drop if country=="United Kingdom"

drop if country=="Algeria"
drop if country=="Nigeria"
drop if country=="Thailand"
drop if country=="Turkey"

global convergence	 = "nested allopt technique(nr)"
global predictors    = "VDEM2 polity2 EFW"
global pre_treatment = "VDEMy(1985) VDEMy(1988) VDEMy(1992) VDEMy(1994) VDEMy(1998)"
global treat_y       = "1999"
global x_axis		 = "1980(1)2008"


synth VDEMy $predictors $pre_treatment, trunit(32) trperiod($treat_y)	 ///
	  unitnames(country) resultsperiod($x_axis)		 fig				///



synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(32) trperiod($treat_y)			 						 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								 ///

effect_graphs
ereturn list

rename 	VDEMy_synth	VEN_LA
drop    effect  
drop	pre_rmspe
drop	post_rmspe
drop 	lead

label variable	VEN_LA "RC: Latin America Only"

keep if country_code == "VEN"

drop VDEM1 VDEM2 VDEM3 VDEM4 VDEM5 VDEM6 WGI1 WGI2 WGI3
drop ICRG polity EFW populist id country country_code

merge 1:1 year using RC_VEN
drop _merge
save RC_VEN, replace

* Plots

global title	= "V-Dem: Liberal Democracy Index in Venezuela"
global ytitle1	= "V-Dem: Liberal Democracy Index (0-100)"
global ytitle2  = "Synthetic effect"
global label1	= "Venezuela"
global label2	= "Baseline Synthetic"
global label3	= "RC: Drop Largest Donor"
global label4	= "RC: All Pre-Treat Lags"
global label5	= "RC: Drop Developed"
global label6	= "RC: Latin America Only"
global treat_graph  = $treat_y -1

twoway line VDEMy	  year, lpattern(solid) lwidth (medthick)	 ///
	|| line VEN_BL    year, lpattern(dash) lwidth(medthick) lcolor(stred)  	 ///
	|| line VEN_DL    year, lpattern(shortdash) lwidth(medthin) lcolor(gray%85)	 ///
	|| line VEN_AL    year, lpattern(shortdash_dot) lwidth(medthin) lcolor(gray%85)	 ///
	|| line VEN_DD    year, lpattern(longdash) lwidth(medthin) lcolor(gray%85)	 ///
	|| line VEN_LA    year, lpattern(dot) lwidth(medthick) lcolor(gray%)	 ///
	   xline($treat_graph)	 ///
	   xlabel(1980(5)2010) 													 ///
	   ytitle($ytitle1) 				 									 ///
	   legend(label(1 $label1) label(2 $label2) label(3 $label3)			 ///
	   label(4 $label4) label(5 $label5) label(6 $label6) 					///
	   position(6) rows(2)) 
	   graph save "Figures/JP/VEN_RC", replace   

graph export  "Figures/JP/Fig_RC_VEN.png", replace
graph drop _all

log close

*|==============================================================================
*| REFERENCES
*|
*| Ferman, B., Pinto, C., & Possebom, V. (2020). Cherry picking with synthetic 
*| 		controls. Journal of Policy Analysis and Management, 39(2), 510-532.
