* Export all the datasets

* Argentina

use data.dta, clear

drop if country_code=="BOL"	
drop if country_code=="ECU"
drop if country_code=="NIC"
drop if country_code=="VEN"

drop if year < 1990
drop if year > 2013

* Bolivia

export delimited using /Users/jpmvbastos/Documents/GitHub/populism-sca/AverageResults/data_arg.csv, replace

use data.dta, clear

drop if country_code=="ARG"	
drop if country_code=="ECU"
drop if country_code=="NIC"
drop if country_code=="VEN"

drop if year < 1992
drop if year > 2015

export delimited using /Users/jpmvbastos/Documents/GitHub/populism-sca/AverageResults/data_bol.csv, replace

* Ecuador

use data.dta, clear

drop if country_code=="ARG"	
drop if country_code=="BOL"
drop if country_code=="NIC"
drop if country_code=="VEN"

drop if year < 1993
drop if year > 2017

export delimited using /Users/jpmvbastos/Documents/GitHub/populism-sca/AverageResults/data_ecu.csv, replace

* Nicaragua

use data.dta, clear

drop if country_code=="ARG"	
drop if country_code=="BOL"
drop if country_code=="ECU"
drop if country_code=="VEN"

drop if year < 1996
drop if year > 2016

export delimited using /Users/jpmvbastos/Documents/GitHub/populism-sca/AverageResults/data_nic.csv, replace

* Venezuela

use data.dta, clear

drop if country_code=="ARG"	
drop if country_code=="BOL"
drop if country_code=="ECU"
drop if country_code=="NIC"

drop if year < 1980
drop if year > 2008

export delimited using /Users/jpmvbastos/Documents/GitHub/populism-sca/AverageResults/data_ven.csv, replace
