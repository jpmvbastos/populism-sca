**# Bookmark #1
import delimited "/Users/jpmvbastos/Documents/GitHub/populism-sca/AverageResults/avg_placebo.csv"

twoway (scatter twosided_pval time if id==0 & time>=0, mcolor(black)), ///
		xtitle("Years since treatment") xlabel(0(1)10) ylabel(0(.1)1) ymtick(0(.1)1) ///
		ytitle("Proportion of Placebo Effects Larger in Magnitude")
		
graph export  "/Users/jpmvbastos/Documents/GitHub/populism-sca/AverageResults/pvals_graph.png", replace
