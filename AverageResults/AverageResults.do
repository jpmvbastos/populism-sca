* Import data
import delimited "/Users/jpmvbastos/Documents/GitHub/populism-sca/AverageResults/avg_placebo.csv", case(preserve) clear 

tsset id time

global predictors	 = "WGI1 WGI2 VDEM1 VDEM2 VDEM5 EFW"
global pre_treatment = "VDEMy(-8) VDEMy(-6) VDEMy(-4) VDEMy(-2) VDEMy(0)"
global treat_y       = "0"
global x_axis		 = "-10(1)10"



synth VDEMy $predictors $pre_treatment, trunit(2) trperiod($treat_y)		 ///
	  unitnames(country) resultsperiod($x_axis)								 ///
	  fig
