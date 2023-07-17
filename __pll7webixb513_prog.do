
program def my_pred, rclass

     args tyear
     local vdem1v "VDEMy(`=`tyear'- 5 '(1)`=`tyear' - 1')"
     return local predictors "`vdem1v '"
end
program def my_xperiod, rclass

     args tyear
     return local xperiod "`=`tyear'- 10'(1)`=`tyear'- 1'"
end
program def my_mspeperiod, rclass

     args tyear
     return local mspeperiod "`=`tyear'- 10'(1)`=`tyear'- 1'"
end
