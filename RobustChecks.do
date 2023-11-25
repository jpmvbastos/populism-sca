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

*| Directory
cd "/Users/jpmvbastos/Documents/GitHub/populism-sca/"


*|==============================================================================
*| SCA ESTIMATIONS
*|------------------------------------------------------------------------------



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
	  fig

    
synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(2) trperiod($treat_y)			 						 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								 ///
			 
			 effect_graphs
			 ereturn list
			 
*| Robustness Check 1 - Drop Largest Donor
*| 	-- Largest Donor == Brazil (0.466)
*| 	-- Same specification as in the paper

drop if country=="Brazil"

synth VDEMy $predictors $pre_treatment, trunit(2) trperiod($treat_y)		 ///
	  unitnames(country) resultsperiod($x_axis)								 ///
	  fig

drop pre_rmspe post_rmspe lead effect VDEMy_synth    
synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(2) trperiod($treat_y)			 						 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								 ///
			 
			 effect_graphs
			 ereturn list 
		 

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
	  fig
 

synth_runner VDEMy VDEMy(1990) VDEMy(1991) VDEMy(1992) VDEMy(1993) 			///
			 VDEMy(1994) VDEMy(1995) VDEMy(1996) VDEMy(1997) VDEMy(1998) 	///
			 VDEMy(1999) VDEMy(2000) VDEMy(2001) VDEMy(2002),				///
			 trunit(2) trperiod($treat_y)			 						///
			 gen_vars synthsettings(unitnames(country))						///
			 
effect_graphs
ereturn list

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
	  fig

    
synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(2) trperiod($treat_y)			 						 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								 ///
			 
effect_graphs
single_treatment_graphs, trlinediff(-1) 
ereturn list


*| Robustness Check 4 - Only Latin American Donor
*| -- Retain the same specification as in the paper

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
	  fig

drop pre_rmspe post_rmspe lead effect VDEMy_synth    
synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(2) trperiod($treat_y)			 						 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								 ///
			 
effect_graphs
ereturn list



*| Bolivia
*|------------------------------------------------------------------------------

** SUGGESTIONS: 
*| -- Start pre-treatment period in 1992
*| -- Include lags VDEMy(1992) VDEMy(1995)

use data.dta, clear

drop if country_code=="ARG"	
drop if country_code=="ECU"
drop if country_code=="NIC"
drop if country_code=="VEN"

drop if year < 1992
drop if year > 2015

global convergence	 = "nested allopt technique(nr)"
global predictors    = "VDEM6 polity2 VDEM1 ICRG"
global pre_treatment = "VDEMy(1992) VDEMy(1995) VDEMy(1998) VDEMy(2000) VDEMy(2002) VDEMy(2004)"
global treat_y       = "2005"
global x_axis		 = "1992(1)2015"


synth VDEMy $predictors $pre_treatment, trunit(6) trperiod($treat_y)	 ///
	  unitnames(country) resultsperiod($x_axis)							 ///
	  fig

    
synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(6) trperiod($treat_y)			 						 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								 ///

effect_graphs
ereturn list

*| Robustness Check 1 - Drop Largest Donor
*| 	-- Largest Donor == Paraguay (0.572)
*| 	-- Same specification as suggestion above

drop if country=="Paraguay"

global convergence	 = "nested allopt technique(nr)"
global predictors    = "VDEM6 polity2 VDEM1 ICRG"
global pre_treatment = "VDEMy(1992) VDEMy(1995) VDEMy(1998) VDEMy(2000) VDEMy(2002) VDEMy(2004)"
global treat_y       = "2005"
global x_axis		 = "1992(1)2015"


synth VDEMy $predictors $pre_treatment, trunit(6) trperiod($treat_y)	 ///
	  unitnames(country) resultsperiod($x_axis)							 ///
	  fig

drop pre_rmspe post_rmspe lead effect VDEMy_synth    
synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(6) trperiod($treat_y)			 						 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								 ///

effect_graphs
ereturn list


*| Drop treated countries 
drop if country_code=="ARG"	
drop if country_code=="ECU"
drop if country_code=="NIC"
drop if country_code=="VEN"

drop if year < 1990
drop if year > 2015


*| Robustness Check 2 - All Pre-Treatment Lags 
*|	-- Following Ferman, Pinto & Possebom (2020)

use data.dta, clear

drop if country_code=="ARG"	
drop if country_code=="ECU"
drop if country_code=="NIC"
drop if country_code=="VEN"

drop if year < 1992
drop if year > 2015

global convergence	 = "nested allopt technique(nr)"
global treat_y       = "2005"
global x_axis		 = "1992(1)2013"


synth VDEMy VDEMy(1992) VDEMy(1993) VDEMy(1994)    							 ///
	  VDEMy(1995) VDEMy(1996) VDEMy(1997) VDEMy(1998) VDEMy(1999) 			///
	  VDEMy(2000) VDEMy(2001) VDEMy(2002) VDEMy(2003) VDEMy(2004),			///
	  trunit(6) trperiod($treat_y)		 						///
	  unitnames(country) resultsperiod($x_axis)								///
	  fig

    
synth_runner VDEMy VDEMy(1992) VDEMy(1993) 									///
			 VDEMy(1994) VDEMy(1995) VDEMy(1996) VDEMy(1997) VDEMy(1998) 	///
			 VDEMy(1999) VDEMy(2000) VDEMy(2001) VDEMy(2002) VDEMy(2003)	///
			 VDEMy(2004), trunit(6) trperiod($treat_y)			///
			 gen_vars synthsettings(unitnames(country))						///
			 
effect_graphs
ereturn list


*| Robustness Check 3 - Drop Developed Countries
*| -- Retain the same specification as suggestion above

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


* Run estimation
global convergence	 = "nested allopt technique(nr)"
global predictors    = "VDEM6 polity2 VDEM1 ICRG"
global pre_treatment = "VDEMy(1992) VDEMy(1995) VDEMy(1998) VDEMy(2000) VDEMy(2002) VDEMy(2004)"
global treat_y       = "2005"
global x_axis		 = "1992(1)2015"


synth VDEMy $predictors $pre_treatment, trunit(6) trperiod($treat_y)	 ///
	  unitnames(country) resultsperiod($x_axis)							 ///
	  fig

drop pre_rmspe post_rmspe lead effect VDEMy_synth    
synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(6) trperiod($treat_y)			 						 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								 ///

effect_graphs
ereturn list


*| Robustness Check 4 - Only Latin American Donor
*| -- Retain the same specification as the suggestion above

drop if country=="Algeria"
drop if country=="Nigeria"
drop if country=="Thailand"
drop if country=="Turkey"

* Run estimation
global convergence	 = "nested allopt technique(nr)"
global predictors    = "VDEM6 polity2 VDEM1 ICRG"
global pre_treatment = "VDEMy(1992) VDEMy(1995) VDEMy(1998) VDEMy(2000) VDEMy(2002) VDEMy(2004)"
global treat_y       = "2005"
global x_axis		 = "1992(1)2015"


synth VDEMy $predictors $pre_treatment, trunit(6) trperiod($treat_y)	 ///
	  unitnames(country) resultsperiod($x_axis)							 ///
	  fig

drop pre_rmspe post_rmspe lead effect VDEMy_synth    
synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(6) trperiod($treat_y)			 						 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								 ///

effect_graphs
ereturn list



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
	  fig

 
synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(13) trperiod($treat_y)			 						 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								 ///

effect_graphs
ereturn list


*| Robustness Check 1 - Drop Largest Donor
*| 	-- Largest Donor == Colombia (0.520)
*| 	-- Same specification as suggestion above

drop if country=="Colombia"

global convergence	 = "nested allopt technique(nr)"
global predictors    = "EFW polity2 VDEM4 ICRG"
global pre_treatment = "VDEMy(1997) VDEMy(2002) VDEMy(2003) VDEMy(2006)"
global treat_y       = "2007"
global x_axis		 = "1993(1)2017"


synth VDEMy $predictors $pre_treatment, trunit(13) trperiod($treat_y)	 ///
	  unitnames(country) resultsperiod($x_axis)							 ///
	  fig

drop pre_rmspe post_rmspe lead effect VDEMy_synth  
synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(13) trperiod($treat_y)			 						 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								 ///

effect_graphs
ereturn list


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
	  fig
    
synth_runner VDEMy VDEMy(1993) VDEMy(1994) VDEMy(1995) VDEMy(1996) 			///
			 VDEMy(1997) VDEMy(1998) VDEMy(1999) VDEMy(2000) VDEMy(2001)    ///
			 VDEMy(2002) VDEMy(2003) VDEMy(2004) VDEMy(2005) VDEMy(2006),   ///
			 trunit(13) trperiod($treat_y)									///
			 gen_vars synthsettings(unitnames(country))						///
			 
effect_graphs
ereturn list

*| Robustness Check 3 - Drop Developed Countries
*| -- Retain the same specification as suggestion above

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
	  fig

drop pre_rmspe post_rmspe lead effect VDEMy_synth  
synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(13) trperiod($treat_y)			 						 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								 ///

effect_graphs
ereturn list

*| Robustness Check 4 - Only Latin American Donor
*| -- Retain the same specification as the suggestion above

drop if country=="Algeria"
drop if country=="Nigeria"
drop if country=="Thailand"
drop if country=="Turkey"

synth VDEMy $predictors $pre_treatment, trunit(13) trperiod($treat_y)	 ///
	  unitnames(country) resultsperiod($x_axis)							 ///
	  fig
	  
global convergence	 = "nested allopt technique(nr)"
global predictors    = "EFW polity2 VDEM4 ICRG"
global pre_treatment = "VDEMy(1997) VDEMy(2002) VDEMy(2003) VDEMy(2006)"
global treat_y       = "2007"
global x_axis		 = "1993(1)2017"

drop pre_rmspe post_rmspe lead effect VDEMy_synth  
synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(13) trperiod($treat_y)			 						 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								 ///

effect_graphs
ereturn list


*| Nicaragua
*|------------------------------------------------------------------------------


* No suggestions here, hard to get a good fit.


use data.dta, clear

drop if country_code=="ARG"	
drop if country_code=="BOL"
drop if country_code=="ECU"
drop if country_code=="VEN"

drop if year < 1996
drop if year > 2016


*| Robustness Check 1 - Drop Largest Donor
*| 	-- Largest Donor == Colombia (0.881)
*| 	-- Same specification as suggestion above


drop if country=="Colombia"

global convergence	 = "nested allopt technique(nr)"
global predictors    = "VDEM2 VDEM4 WGI1 polity2 WGI3"
global pre_treatment = "VDEMy(1996) VDEMy(2001) VDEMy(2002) VDEMy(2004)"
global treat_y       = "2006"
global x_axis		 = "1996(1)2016"


synth VDEMy $predictors $pre_treatment, trunit(21) trperiod($treat_y)	 ///
	  unitnames(country) resultsperiod($x_axis)				 		     ///
	  fig

synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(21) trperiod($treat_y) 									 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								

effect_graphs
ereturn list



* Robustness Check 2 - All Pre-Treatment Lags 
* 	-- Following Ferman, Pinto & Possebom (2020)

use data.dta, clear

drop if country_code=="ARG"	
drop if country_code=="BOL"
drop if country_code=="ECU"
drop if country_code=="VEN"

drop if year < 1996
drop if year > 2016

global convergence	 = "nested allopt technique(nr)"
global treat_y       = "2006"
global x_axis		 = "1996(1)2016"


synth VDEMy VDEMy(1996) VDEMy(1997) VDEMy(1998) VDEMy(1999) 				///
	  VDEMy(2000) VDEMy(2001) VDEMy(2002) VDEMy(2003) VDEMy(2004)			///
	  VDEMy(2005) VDEMy(2006), trunit(21) trperiod($treat_y)		 		///
	  unitnames(country) resultsperiod($x_axis)								///
	  fig
    
synth_runner VDEMy VDEMy(1996) VDEMy(1997) VDEMy(1998) VDEMy(1999) VDEMy(2000) ///
			 VDEMy(2001) VDEMy(2002) VDEMy(2003) VDEMy(2004) VDEMy(2005) ///
			 VDEMy(2006), trunit(21) trperiod($treat_y)						///
			 gen_vars synthsettings(unitnames(country))						///
			 
effect_graphs
ereturn list


*| Robustness Check 3 - Drop Developed Countries
*| -- Retain the same specification as suggestion above

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
global pre_treatment = "VDEMy(1996) VDEMy(2001) VDEMy(2002) VDEMy(2004)"
global treat_y       = "2006"
global x_axis		 = "1996(1)2016"


synth VDEMy $predictors $pre_treatment, trunit(21) trperiod($treat_y)	 ///
	  unitnames(country) resultsperiod($x_axis)				 		     ///
	  fig

drop pre_rmspe post_rmspe lead effect VDEMy_synth  

synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(21) trperiod($treat_y) 									 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								

effect_graphs
ereturn list

*| Robustness Check 4 - Only Latin American Donors
*| -- Retain the same specification as baseline

drop if country=="Algeria"
drop if country=="Nigeria"
drop if country=="Thailand"
drop if country=="Turkey"


global convergence	 = "nested allopt technique(nr)"
global predictors    = "VDEM2 VDEM4 WGI1 polity2 WGI3"
global pre_treatment = "VDEMy(1996) VDEMy(2001) VDEMy(2002) VDEMy(2004)"
global treat_y       = "2006"
global x_axis		 = "1996(1)2016"


synth VDEMy $predictors $pre_treatment, trunit(21) trperiod($treat_y)	 ///
	  unitnames(country) resultsperiod($x_axis)				 		     ///
	  fig

drop pre_rmspe post_rmspe lead effect VDEMy_synth  

synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(21) trperiod($treat_y) 									 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								

effect_graphs
ereturn list



*| Venezuela
*|------------------------------------------------------------------------------

*| Suggestion: extend pre-treatment until 1980

use data.dta, clear

drop if country_code=="ARG"	
drop if country_code=="BOL"
drop if country_code=="ECU"
drop if country_code=="NIC"

drop if year < 1980
drop if year > 2008


global convergence	 = "nested allopt technique(nr)"
global predictors    = "WGI1 VDEM2 VDEM3 polity2 EFW ICRG"
global pre_treatment = "VDEMy(1988) VDEMy(1991) VDEMy(1994) VDEMy(1997)"
global treat_y       = "1998"
global x_axis		 = "1980(1)2008"


synth VDEMy $predictors $pre_treatment, trunit(32) trperiod($treat_y)	 ///
	  unitnames(country) resultsperiod($x_axis)							 ///
	  fig

    
synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(32) trperiod($treat_y)			 						 ///
			 gen_vars 				 								 ///
			 synthsettings(unitnames(country))								 ///

effect_graphs

*| Robustness Check 1 - Drop Largest Donor
*| 	-- Largest Donor == Costa Rica (0.437)
*| 	-- Same specification as suggestion above


drop if country=="Costa Rica"

global convergence	 = "nested allopt technique(nr)"
global predictors    = "WGI1 VDEM2 VDEM3 polity2 EFW ICRG"
global pre_treatment = "VDEMy(1988) VDEMy(1991) VDEMy(1994) VDEMy(1997)"
global treat_y       = "1998"
global x_axis		 = "1980(1)2008"


synth VDEMy $predictors $pre_treatment, trunit(32) trperiod($treat_y)	 ///
	  unitnames(country) resultsperiod($x_axis)							 ///
	  fig

drop pre_rmspe post_rmspe lead effect VDEMy_synth 

synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(32) trperiod($treat_y)			 						 ///
			 gen_vars 				 								 ///
			 synthsettings(unitnames(country))								 ///

effect_graphs
ereturn list 

* Robustness Check 2 - All Pre-Treatment Lags 
* 	-- Following Ferman, Pinto & Possebom (2020)


use data.dta, clear

drop if country_code=="ARG"	
drop if country_code=="BOL"
drop if country_code=="ECU"
drop if country_code=="NIC"

drop if year < 1980
drop if year > 2008


global convergence	 = "nested allopt technique(nr)"
global treat_y       = "1998"
global x_axis		 = "1980(1)2008"


synth VDEMy VDEMy(1980) VDEMy(1981) VDEMy(1982) VDEMy(1983) VDEMy(1984)			///
	  VDEMy(1985) VDEMy(1986) VDEMy(1987) VDEMy(1988) VDEMy(1989) VDEMy(1990)	///
	  VDEMy(1991) VDEMy(1992) VDEMy(1993) VDEMy(1994) VDEMy(1995) VDEMy(1996)	///
	  VDEMy(1997), trunit(32) trperiod($treat_y)	 							///
	  unitnames(country) resultsperiod($x_axis)							 		///
	  fig

    
synth_runner VDEMy VDEMy VDEMy(1980) VDEMy(1981) VDEMy(1982) VDEMy(1983) 	///
			 VDEMy(1984) VDEMy(1985) VDEMy(1986) VDEMy(1987) VDEMy(1988) 	///	
			 VDEMy(1989) VDEMy(1990) VDEMy(1991) VDEMy(1992) VDEMy(1993) 	///
			 VDEMy(1994) VDEMy(1995) VDEMy(1996) VDEMy(1997), 				///
			 trunit(32) trperiod($treat_y)			 					    ///
			 gen_vars 				 								 		///
			 synthsettings(unitnames(country))								 ///

effect_graphs
ereturn list 

*| Robustness Check 3 - Drop Developed Countries
*| -- Drop VDEM 3 and ICRG as predictors 

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
global predictors    = "WGI1 VDEM2 polity2 EFW"
global pre_treatment = "VDEMy(1988) VDEMy(1991) VDEMy(1994) VDEMy(1997)"
global treat_y       = "1998"
global x_axis		 = "1980(1)2008"


synth VDEMy  $pre_treatment $predictors, trunit(32) trperiod($treat_y)	 ///
	  unitnames(country) resultsperiod($x_axis)							 ///
	  fig

drop pre_rmspe post_rmspe lead effect VDEMy_synth 

synth_runner VDEMy  $pre_treatment $predictors,								 ///
			 trunit(32) trperiod($treat_y)			 						 ///
			 gen_vars 				 								 		///
			 synthsettings(unitnames(country))								 ///

effect_graphs
single_treatment_graphs
ereturn list 


*| Robustness Check 4 - Only Latin American Donors
*| -- Retain the same specification as baseline

drop if country=="Algeria"
drop if country=="Nigeria"
drop if country=="Thailand"
drop if country=="Turkey"

global convergence	 = "nested allopt technique(nr)"
global predictors    = "WGI1 VDEM2 polity2 EFW"
global pre_treatment = "VDEMy(1988) VDEMy(1991) VDEMy(1994) VDEMy(1997)"
global treat_y       = "1998"
global x_axis		 = "1980(1)2008"


synth VDEMy $predictors $pre_treatment, trunit(32) trperiod($treat_y)	 ///
	  unitnames(country) resultsperiod($x_axis)							 ///
	  fig

drop pre_rmspe post_rmspe lead effect VDEMy_synth 

synth_runner VDEMy $predictors $pre_treatment,								 ///
			 trunit(32) trperiod($treat_y)			 						 ///
			 gen_vars 						 								 ///
			 synthsettings(unitnames(country))								 ///

effect_graphs
ereturn list 




*|==============================================================================
*| REFERENCES
*|
*| Ferman, B., Pinto, C., & Possebom, V. (2020). Cherry picking with synthetic 
*| 		controls. Journal of Policy Analysis and Management, 39(2), 510-532.
