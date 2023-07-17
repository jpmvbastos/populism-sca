capture {
clear
cd "/Users/joamacha/Library/CloudStorage/OneDrive-TexasTechUniversity/Personal/Projects/Code/GitHub/populism-sca/"
sysdir set PERSONAL "/Users/joamacha/Documents/Stata/ado/personal/"
sysdir set PLUS "/Users/joamacha/Library/Application Support/Stata/ado/plus/"
global S_ADO = `"BASE;SITE;.;PERSONAL;PLUS;OLDPLACE"'
mata: mata mlib index
mata: mata set matalibs "lmatabase;lmatamcmc;lmatabma;lmatacollect;lmatatab;lmatamixlog;lmatami;lmatasem;lmatagsem;lmatasp;lmatapss;lmatalasso;lmatapostest;lmatapath;lmatameta;lmataopt;lmatasvy;lmatanumlib;lmataado;lmataerm;lmatafc;lsynth_mata_subr;lparallel;lquaidsce;lquaids;l__pll7webixb513_mlib"
set seed 65914
noi di "{hline 80}"
noi di "Parallel computing with Stata"
noi di "{hline 80}"
noi di `"cmd/dofile   : "_sr_do_work_tr VDEMy  WGI1 VDEM2 VDEM3 polity2 EFW ICRG , data("/var/folders/_m/mjfnhj0j1yv4sgprxx5x_l_s_kk5tp/T//S_52580.000006") pvar(id) tper_var(__000002) tvar_vals(1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018) ever_treated(__000000) trends training_propr(0) pred_prog(my_pred) drop_units_prog() xperiod_prog(my_xperiod) mspeperiod_prog(my_mspeperiod) aggfile_v() aggfile_w() nested allopt technique(nr)""'
noi di "pll_id       : 7webixb513"
noi di "pll_instance : 1/4"
noi di "tmpdir       : `c(tmpdir)'"
noi di "date-time    : `c(current_time)' `c(current_date)'"
noi di "seed         : `c(seed)'"
noi di "{hline 80}"
local pll_instance 1
local pll_id 7webixb513
global pll_instance 1
global pll_id 7webixb513
set memory   8388608b
set maxvar 5000
set matsize 400
mata: for(i=1;i<=27;i++) PLL_QUIET = st_tempname()
}
local result = _rc
if (c(rc)) {
cd "/Users/joamacha/Library/CloudStorage/OneDrive-TexasTechUniversity/Personal/Projects/Code/GitHub/populism-sca/"
mata: parallel_write_diagnosis(strofreal(c("rc")),"/Users/joamacha/Library/CloudStorage/OneDrive-TexasTechUniversity/Personal/Projects/Code/GitHub/populism-sca/__pll7webixb513_finito0001","while setting memory")
clear
exit
}

* Loading Programs *
capture {
run "/Users/joamacha/Library/CloudStorage/OneDrive-TexasTechUniversity/Personal/Projects/Code/GitHub/populism-sca/__pll7webixb513_prog.do"
}
local result = _rc
if (c(rc)) {
cd "/Users/joamacha/Library/CloudStorage/OneDrive-TexasTechUniversity/Personal/Projects/Code/GitHub/populism-sca/"
mata: parallel_write_diagnosis(strofreal(c("rc")),"/Users/joamacha/Library/CloudStorage/OneDrive-TexasTechUniversity/Personal/Projects/Code/GitHub/populism-sca/__pll7webixb513_finito0001","while loading programs")
clear
exit
}

* Checking for break *
mata: parallel_break()

* Loading Globals *
capture {
cap run "/Users/joamacha/Library/CloudStorage/OneDrive-TexasTechUniversity/Personal/Projects/Code/GitHub/populism-sca/__pll7webixb513_glob.do"
}
if (c(rc)) {
  cd "/Users/joamacha/Library/CloudStorage/OneDrive-TexasTechUniversity/Personal/Projects/Code/GitHub/populism-sca/"
  mata: parallel_write_diagnosis(strofreal(c("rc")),"/Users/joamacha/Library/CloudStorage/OneDrive-TexasTechUniversity/Personal/Projects/Code/GitHub/populism-sca/__pll7webixb513_finito0001","while loading globals")
  clear
  exit
}

* Checking for break *
mata: parallel_break()
capture {
  noisily {
    use "/Users/joamacha/Library/CloudStorage/OneDrive-TexasTechUniversity/Personal/Projects/Code/GitHub/populism-sca/__pll7webixb513_dataset" if _7webixb513cut == 1
    drop _7webixb513cut

* Checking for break *
mata: parallel_break()
    _sr_do_work_tr VDEMy  WGI1 VDEM2 VDEM3 polity2 EFW ICRG , data("/var/folders/_m/mjfnhj0j1yv4sgprxx5x_l_s_kk5tp/T//S_52580.000006") pvar(id) tper_var(__000002) tvar_vals(1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018) ever_treated(__000000) trends training_propr(0) pred_prog(my_pred) drop_units_prog() xperiod_prog(my_xperiod) mspeperiod_prog(my_mspeperiod) aggfile_v() aggfile_w() nested allopt technique(nr) agg_file(/Users/joamacha/Library/CloudStorage/OneDrive-TexasTechUniversity/Personal/Projects/Code/GitHub/populism-sca/__pll7webixb513_out_agg_file0001)
  }
}
if (c(rc)) {
  cd "/Users/joamacha/Library/CloudStorage/OneDrive-TexasTechUniversity/Personal/Projects/Code/GitHub/populism-sca/"
  mata: parallel_write_diagnosis(strofreal(c("rc")),"/Users/joamacha/Library/CloudStorage/OneDrive-TexasTechUniversity/Personal/Projects/Code/GitHub/populism-sca/__pll7webixb513_finito0001","while running the command/dofile")
  clear
  exit
}
mata: parallel_write_diagnosis(strofreal(c("rc")),"/Users/joamacha/Library/CloudStorage/OneDrive-TexasTechUniversity/Personal/Projects/Code/GitHub/populism-sca/__pll7webixb513_finito0001","while executing the command")
save "/Users/joamacha/Library/CloudStorage/OneDrive-TexasTechUniversity/Personal/Projects/Code/GitHub/populism-sca/__pll7webixb513_dta0001", replace
cd "/Users/joamacha/Library/CloudStorage/OneDrive-TexasTechUniversity/Personal/Projects/Code/GitHub/populism-sca/"
