*|==============================================================================
*| TITLE
*| The Institutional Cost of Left-Leaning Populism in Latin America
*|
*| AUTHORS
*| Nicolas Cachanosky
*| University of Texas at El Paso | ncachanosky@utep.edu
*| 
*| João Pedro Bastos
*| Texas Tech University | Joao-Pedro.Bastos@ttu.edu
*|
*| This version: dd-mmm-yyyy
*|==============================================================================


*| Packages
ssc install schemepack	

*| Directory
cd "/Users/jpmvbastos/Documents/GitHub/populism-sca/"

*| Plot settings
set scheme white_tableau
graph set window fontface "Times New Roman"



*| Synthetic Control / synth_runner / parallen
*|------------------------------------------------------------------------------
ssc install synth		, all replace

cap ado uninstall synth_runner //in-case already installed
net install synth_runner, from(https://raw.github.com/bquistorff/synth_runner/master/) replace

net install parallel, from(https://raw.github.com/gvegayon/parallel/stable/) replace
mata mata mlib index



*|==============================================================================
*| DOWNLOAD DATA
*|------------------------------------------------------------------------------

*| Load and prepare data
global data = "https://github.com/ncachanosky/populism-sca/raw/main/data.xlsx"

import excel $data, sheet("Data") firstrow clear
tsset country_id year

rename country_name		country
rename country_text_id	country_code
rename country_id		id

rename efw					EFW
rename voiceaccount			WGI1
rename ruleoflaw			WGI2
rename controlofcorruption 	WGI3
rename icrgcorruption		ICRG

gen VDEMy 	= 100*v2x_libdem
gen VDEM1	= 100*v2x_polyarchy
gen VDEM2	= 100*v2x_freexp_altinf
gen VDEM3	= 100*v2excrptps
gen VDEM4	= 100*v2jupoatck
gen VDEM5	= 100*v2xnp_client
gen VDEM6	= 100*v2xnp_pres

drop v2x_libdem
drop v2x_polyarchy
drop v2x_freexp_altinf
drop v2excrptps
drop v2jupoatck
drop v2xnp_client
drop v2xnp_pres

label variable country		"Country"
label variable country_code	"text_id"
label variable id			"country id"
label variable populist		"Populist dummy"
label variable year			"Year"
label variable VDEMy		"V-Dem: Liberal Democracy Index"
label variable VDEM1		"V-Dem: Electoral Democracy Index"
label variable VDEM2		"V-Dem: Freedom of Expression"
label variable VDEM3		"V-Dem: Public Sector Corrupt Charges"
label variable VDEM4		"V-Dem: Government Attackson the Judiciary"
label variable VDEM5		"V-Dem: Clientelism Index"
label variable VDEM6		"V-Dem: Presidentialism Index"
label variable polity2		"Polity V"
label variable EFW			"Economic Freedom of the World Index"
label variable WGI1			"WGI: Voice and Accountability"
label variable WGI2			"WGI: Rule of Law"
label variable WGI3			"WGI: Control of Corruption"
label variable ICRG			"ICRG: Corruption"

save data, replace


*|==============================================================================
*| SCA ESTIMATIONS
*|------------------------------------------------------------------------------

* Optional: 
log using "Results.smcl", replace

*| Directory
cd "/Users/jpmvbastos/Documents/GitHub/populism-sca/"


*| Argentina
*|------------------------------------------------------------------------------

** Code for sugestion: 

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
	  keep(resout_ARG) replace 

	  mat V = e(V_matrix)
	  esttab mat(V) using "/Users/jpmvbastos/Documents/GitHub/populism-sca/V-Matrix/V_matrix_ARG.csv", replace mlab(none)
	  
    
synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(2) trperiod($treat_y)			 						 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								 ///
			
			
ereturn list			
			
rename 	VDEMy_synth	ARG_SCA
rename 	effect		ARG_effect
drop	pre_rmspe
drop	post_rmspe
drop 	lead

label variable	ARG_SCA "Argentina"


global title	= "V-Dem: Liberal Democracy Index in Argentina"
global ytitle1	= "V-Dem: Liberal Democracy Index (0-100)"
global ytitle2  = "Synthetic effect"
global label1	= "Argentina"
global label2	= "Synthetic Argentina"
global treat_graph  = $treat_y -1

twoway line VDEMy	   year if id==2, lpattern(solid) 						 ///
	|| line ARG_SCA    year if id==2, lpattern(dash)  xline($treat_graph)		 ///
	   xlabel(1990(5)2015) 													 ///
	   ytitle($ytitle1) 				 									 ///
	   legend(label(1 $label1) label(2 $label2) position(6) rows(1)) nodraw
	   graph save "Figures/JP/ARG_synth", replace
	   
	   
twoway bar 	ARG_effect year if id==2, color(gray%50) xline($treat_graph) 		 ///
	   yline(0, lpattern(solid)) 											 ///
	   xlabel(1990(5)2015)													 ///
	   ytitle($ytitle2)
	   graph save "Figures/JP/ARG_effect", replace


graph combine "Figures/JP/ARG_synth.gph" "Figures/JP/ARG_effect.gph", xcommon rows(2) ysize(8)
 	
graph export  "Figures/JP/Fig_ARG.png", replace
graph drop _all


keep if country_code == "ARG"

generate t = year - $treat_y

drop if t > 10 | t < -10

rename year		ARG_year
rename VDEMy	ARG_VDEMy
drop VDEM1 VDEM2 VDEM3 VDEM4 VDEM5 VDEM6 WGI1 WGI2 WGI3
drop ICRG polity EFW populist id country country_code

save data_avg_jp, replace


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
	  keep(resout_BOL) replace 
	  
	  mat V = e(V_matrix)
	  esttab mat(V) using "/Users/jpmvbastos/Documents/GitHub/populism-sca/V-Matrix/V_matrix_BOL.csv", replace mlab(none)

    
synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(6) trperiod($treat_y)			 						 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								 ///

ereturn list

rename 	VDEMy_synth	BOL_SCA
rename 	effect		BOL_effect
drop	pre_rmspe
drop	post_rmspe
drop 	lead
			 
label variable	BOL_SCA "Bolivia"


global title	= "V-Dem: Liberal Democracy Index in Bolivia"
global ytitle1	= "V-Dem: Liberal Democracy Index (0-100)"
global ytitle2  = "Synthetic effect"
global label1	= "Bolivia"
global label2	= "Synthetic Bolivia"
global treat_graph  = $treat_y -1

twoway line VDEMy	   year if id==6, lpattern(solid) 						 ///
	|| line BOL_SCA    year if id==6, lpattern(dash)  xline($treat_graph)		 ///
	   xlabel(1990(5)2015) 													 ///
	   ytitle($ytitle1) 				 									 ///
	   legend(label(1 $label1) label(2 $label2) position(6) rows(1)) nodraw
	   graph save "Figures/JP/BOL_synth", replace
	   
	   
twoway bar 	BOL_effect year if id==6, color(gray%50) xline($treat_graph) 		 ///
	   yline(0, lpattern(solid))											 ///
	   xlabel(1990(5)2015)													 ///
	   ytitle($ytitle2) 
	   graph save "/Users/jpmvbastos/Documents/GitHub/populism-sca/Figures/JP/BOL_effect", replace
	   

cd "/Users/jpmvbastos/Documents/GitHub/populism-sca/"

graph combine "Figures/JP/BOL_synth.gph" "Figures/JP/BOL_effect.gph", xcommon rows(2) ysize(8)
graph export  "Figures/JP/Fig_BOL.png", replace
graph drop _all


keep if country_code == "BOL"

generate t = year - $treat_y

drop if t > 10 | t < -10

rename year		BOL_year
rename VDEMy	BOL_VDEMy
drop VDEM1 VDEM2 VDEM3 VDEM4 VDEM5 VDEM6 WGI1 WGI2 WGI3
drop ICRG polity EFW populist id country country_code


merge 1:1 t using data_avg_jp
drop _merge
save data_avg_jp, replace

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
	  keep(resout_ECU) replace 

	  mat V = e(V_matrix)
	  esttab mat(V) using "/Users/jpmvbastos/Documents/GitHub/populism-sca/V-Matrix/V_matrix_ECU.csv", replace mlab(none)
 
synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(13) trperiod($treat_y)			 						 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								 ///

ereturn list

rename 	VDEMy_synth	ECU_SCA
rename 	effect		ECU_effect
drop	pre_rmspe
drop	post_rmspe
drop 	lead

label variable	ECU_SCA "Ecuador"


global title	= "V-Dem: Liberal Democracy Index in Ecuador"
global ytitle1	= "V-Dem: Liberal Democracy Index (0-100)"
global ytitle2  = "Synthetic effect"
global label1	= "Ecuador"
global label2	= "Synthetic Ecuador"
global treat_graph  = $treat_y -1

twoway line VDEMy	   year if id==13, lpattern(solid) 						 ///
	|| line ECU_SCA    year if id==13, lpattern(dash)  xline($treat_graph)		 ///
	   xlabel(1990(5)2015) 													 ///
	   ytitle($ytitle1) 				 									 ///
	   legend(label(1 $label1) label(2 $label2) position(6) rows(1)) nodraw
	   graph save "Figures/JP/ECU_synth", replace
		
	   
twoway bar 	ECU_effect year if id==13, color(gray%50) xline($treat_graph) 		 ///
	   yline(0, lpattern(solid))											 ///
	   xlabel(1990(5)2015)													 ///
	   ytitle($ytitle2) 
	   graph save "/Users/jpmvbastos/Documents/GitHub/populism-sca/Figures/JP/ECU_effect", replace
 
cd "/Users/jpmvbastos/Documents/GitHub/populism-sca/"
 
graph combine "Figures/JP/ECU_synth.gph" "Figures/JP/ECU_effect.gph", xcommon rows(2) ysize(8)
graph export  "Figures/JP/Fig_ECU.png", replace
graph drop _all


keep if country_code == "ECU"

generate t = year - $treat_y

drop if t > 10 | t < -10

rename year		ECU_year
rename VDEMy	ECU_VDEMy
drop VDEM1 VDEM2 VDEM3 VDEM4 VDEM5 VDEM6 WGI1 WGI2 WGI3
drop ICRG polity EFW populist id country country_code


merge 1:1 t using data_avg_jp
drop _merge
save data_avg_jp, replace



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
	  keep(resout_NIC) replace 
	  
	  mat V = e(V_matrix)
	  esttab mat(V) using "/Users/jpmvbastos/Documents/GitHub/populism-sca/V-Matrix/V_matrix_NIC.csv", replace mlab(none)
	  
synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(21) trperiod($treat_y)			 						 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								 ///
			 
ereturn list

rename 	VDEMy_synth	NIC_SCA
rename 	effect		NIC_effect
drop	pre_rmspe
drop	post_rmspe
drop 	lead

label variable	NIC_SCA "Nicaragua"

global title	= "V-Dem: Liberal Democracy Index in Nicaragua"
global ytitle1	= "V-Dem: Liberal Democracy Index (0-100)"
global ytitle2  = "Synthetic effect"
global label1	= "Nicaragua"
global label2	= "Synthetic Nicaragua"
global treat_graph  = $treat_y -1

twoway line VDEMy	   year if id==21, lpattern(solid) 						 ///
	|| line NIC_SCA    year if id==21, lpattern(dash)  xline($treat_graph)		 ///
	   xlabel(1995(5)2020) 													 ///
	   ytitle($ytitle1) 				 									 ///
	   legend(label(1 $label1) label(2 $label2) position(6) rows(1)) nodraw
	    graph save "Figures/JP/NIC_synth", replace
	   
twoway bar 	NIC_effect year if id==21, color(gray%50) xline($treat_graph) 		 ///
	   yline(0, lpattern(solid))											 ///
	   xlabel(1995(5)2020)													 ///
	   ytitle($ytitle2) nodraw
	   graph save "Figures/JP/NIC_effect", replace
 
	
graph combine "Figures/JP/NIC_synth.gph" "Figures/JP/NIC_effect.gph", xcommon rows(2) ysize(8)
graph export  "Figures/JP/Fig_NIC.png", replace
graph drop _all

keep if country_code == "NIC"

generate t = year - $treat_y

drop if t > 10 | t < -10

rename year		NIC_year
rename VDEMy	NIC_VDEMy
drop VDEM1 VDEM2 VDEM3 VDEM4 VDEM5 VDEM6 WGI1 WGI2 WGI3
drop ICRG polity EFW populist id country country_code

merge 1:1 t using data_avg_jp
drop _merge
save data_avg_jp, replace


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
	  unitnames(country) resultsperiod($x_axis)							 ///
	  keep(resout_VEN) replace
	  
	  mat V = e(V_matrix)
	  esttab mat(V) using "/Users/jpmvbastos/Documents/GitHub/populism-sca/V-Matrix/V_matrix_VEN.csv", replace mlab(none)

    
synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(32) trperiod($treat_y)			 						 ///
			 gen_vars 				 								 ///
			 synthsettings(unitnames(country))								 
			 
ereturn list 

rename 	VDEMy_synth	VEN_SCA
rename 	effect		VEN_effect
drop	pre_rmspe
drop	post_rmspe
drop 	lead

label variable	VEN_SCA "Venezuela"


global title	= "V-Dem: Liberal Democracy Index in Venezuela"
global ytitle1	= "V-Dem: Liberal Democracy Index (0-100)"
global ytitle2  = "Synthetic effect"
global label1	= "Venezuela"
global label2	= "Synthetic Venezuela"
global treat_graph  = $treat_y -1

twoway line VDEMy	   year if id==32, lpattern(solid) 						 ///
	|| line VEN_SCA    year if id==32, lpattern(dash)  xline($treat_graph)		 ///
	   xlabel(1980(5)2010) 													 ///
	   ytitle($ytitle1) 				 									 ///
	   legend(label(1 $label1) label(2 $label2) position(6) rows(1)) nodraw
	    graph save "Figures/JP/VEN_synth", replace
	   
twoway bar 	VEN_effect year if id==32, color(gray%50) xline($treat_graph) 		 ///
	   yline(0, lpattern(solid))											 ///
	   xlabel(1980(5)2010)													 ///
	   ytitle($ytitle2) 
	   graph save "Figures/JP/VEN_effect", replace
 
	
graph combine "Figures/JP/VEN_synth.gph" "Figures/JP/VEN_effect.gph", xcommon rows(2) ysize(8)
graph export  "Figures/JP/Fig_VEN.png", replace
graph drop _all
			 

keep if country_code == "VEN"

generate t = year - $treat_y

drop if t > 10 | t < -10

rename year		VEN_year
rename VDEMy	VEN_VDEMy
drop VDEM1 VDEM2 VDEM3 VDEM4 VDEM5 VDEM6 WGI1 WGI2 WGI3
drop ICRG polity EFW populist id country country_code


merge 1:1 t using data_avg_jp
drop _merge
save data_avg_jp, replace

/usr/local/texlive/2023basic/bin/universal-darwin/afm2tfm


*|==============================================================================
*| AVERAGE PLOTS
*|------------------------------------------------------------------------------
use data_avg_jp, clear

drop if t>10

gen VDEMy  = (ARG_VDEMy  + BOL_VDEMy  + ECU_VDEMy  + NIC_VDEMy  + VEN_VDEMy) /5
gen synth  = (ARG_SCA    + BOL_SCA    + ECU_SCA    + NIC_SCA    + VEN_SCA)   /5
gen EFFECT = VDEMy - synth


global ytitle = "Average V-DEM: Liberal Democracy Index (0-100)"
twoway line VDEMy t, lpattern(solid)										 ///
	|| line synth t, lpattern(dash)  										 ///
	   xline(-1) xlabel(-10(2)10) ylabel(30(5)60) legend(off)				 ///
	   ytitle($ytitle) xtitle("Years since Treatment")
	   graph save "Figures/JP/avg_synth", replace
	   
global ytitle = "Average synthetic effect"	   
twoway bar EFFECT t, color(gray%50) xline(-1) 								 ///
	   yline(0, lpattern(solid))											 ///
	   xlabel(-10(2)10)	ylabel(-30(5)10)									 ///
	   ytitle($ytitle) xtitle("Years since Treatment")						///

	   graph save "Figures/JP/avg_effect", replace
	   
graph combine "Figures/JP/avg_synth.gph" "Figures/JP/avg_effect.gph", xcommon rows(2)	ysize(8)	
graph export Figures/JP/Fig_AVG.png, replace
graph drop _all

log close
