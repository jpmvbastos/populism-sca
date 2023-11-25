*** ROBUSTNESS CHECKS AND SUGGESTIONS

** ARGENTINA

* Baseline (as in the paper)

Loss: Root Mean Squared Prediction Error

---------------------
   RMSPE |  .7736983 
---------------------


----------------------------
         Co_No | Unit_Weight
---------------+------------
       Algeria |           0
     Australia |           0
       Austria |        .238
       Belgium |           0
        Brazil |        .545
        Canada |           0
         Chile |           0
      Colombia |        .073
    Costa Rica |           0
       Denmark |           0
        France |           0
       Germany |           0
     Guatemala |           0
         Italy |           0
         Japan |           0
        Mexico |           0
   Netherlands |           0
       Nigeria |        .144
      Paraguay |           0
          Peru |           0
      Portugal |           0
         Spain |           0
        Sweden |           0
      Thailand |           0
        Turkey |           0
United Kingdom |           0
       Uruguay |           0
----------------------------

Predictor Balance:

------------------------------------------------------
                               |   Treated  Synthetic 
-------------------------------+----------------------
                          WGI1 |  .3447908   .3405885 
                          WGI2 | -.2347079   .0642051 
                         VDEM1 |     83.44    75.3333 
                         VDEM2 |     94.15   89.38249 
                         VDEM5 |     45.76    42.9096 
                           EFW |  6.837475   6.160045 
                   VDEMy(1994) |        63    62.5392 
                   VDEMy(1997) |      62.5    62.7614 
                   VDEMy(1998) |      62.8    62.9084 
                   VDEMy(2002) |      65.9    66.6746 
------------------------------------------------------

Post-treatment results: Effects, p-values, standardized p-values
             | estimates      pvals  pvals_std 
-------------+--------------------------------
          c1 | -1.122904   .3333333   .3703704 
          c2 | -.9601987   .4814815   .4074074 
          c3 | -1.752201   .3333333   .3333333 
          c4 | -3.437699   .2592593   .2222222 
          c5 | -4.020001   .2592593   .1111111 
          c6 |   -5.2922   .2592593   .0740741 
          c7 |    -6.538   .2222222   .0740741 
          c8 | -7.521302   .1851852   .0740741 
          c9 |  -10.0502   .1111111          0 
         c10 | -9.895898   .1111111          0 
         c11 | -9.279097   .1111111   .0740741 


Joint std. p-value (entire post-treatment): 0.07407407



** SUGGESTION: Start Pre-Treatment in 1990 as new baseline


Loss: Root Mean Squared Prediction Error

---------------------
   RMSPE |  .7502213  // Improves RMSPE
---------------------
-----------------------------------------------------------------------------------
Unit Weights:

----------------------------
         Co_No | Unit_Weight
---------------+------------
       Algeria |           0
     Australia |           0
       Austria |        .128  // Reduces weight from developed country
       Belgium |           0
        Brazil |        .466
        Canada |           0
         Chile |           0
      Colombia |        .085
    Costa Rica |        .072
       Denmark |           0
        France |           0
       Germany |           0
     Guatemala |           0
         Italy |           0
         Japan |          .1
        Mexico |           0
   Netherlands |           0
       Nigeria |         .15
      Paraguay |           0
          Peru |           0
      Portugal |           0
         Spain |           0
        Sweden |           0
      Thailand |           0
        Turkey |           0
United Kingdom |           0
       Uruguay |           0
----------------------------
-----------------------------------------------------------------------------------
Predictor Balance:

------------------------------------------------------
                               |   Treated  Synthetic 
-------------------------------+----------------------
                          WGI1 |  .3447908   .3333721 
                          WGI2 | -.2347079   .0360591 
                         VDEM1 |  83.37692   74.26436 
                         VDEM2 |  93.96923   88.33071 
                         VDEM5 |  46.26154   45.00145 
                           EFW |  6.348624   6.092828 
                   VDEMy(1994) |        63    62.5344 
                   VDEMy(1997) |      62.5    62.6534 
                   VDEMy(1998) |      62.8    62.8534 
                   VDEMy(2002) |      65.9    66.6903 
------------------------------------------------------

Post-treatment results: Effects, p-values, standardized p-values

             | estimates      pvals  pvals_std 
-------------+--------------------------------
          c1 | -1.819502   .3703704   .0740741 
          c2 | -1.587097   .3333333   .1481481 
          c3 | -4.343303   .2222222   .1111111 
          c4 | -5.487101   .1851852   .1111111 
          c5 |   -5.6332   .1851852          0 
          c6 | -6.802898   .2222222          0 
          c7 | -7.983699   .1851852          0 
          c8 |   -8.4482   .1481481          0 
          c9 |  -10.5196   .1111111          0 
         c10 |  -10.2749   .1111111          0 
         c11 |  -10.2571   .1111111          0 


Joint std. p-value (entire post-treatment): 0 // Improves p-value


*| Robustness Check 1 - Drop Largest Donor
*| 	-- Largest Donor == Brazil (0.466)
*| 	-- Same specification as in the paper



Loss: Root Mean Squared Prediction Error

---------------------
   RMSPE |  .8281708 // RMPSE is just a little bigger. Fit is visually just as good
---------------------
----------------------------------------------------------------------------------------
Unit Weights: 

----------------------------
         Co_No | Unit_Weight
---------------+------------
       Algeria |           0
     Australia |           0
       Austria |           0
       Belgium |           0
        Canada |           0
         Chile |           0
      Colombia |        .221
    Costa Rica |        .601
       Denmark |           0
        France |        .008. // Almost no dependence on developed countries
       Germany |           0
     Guatemala |           0
         Italy |           0
         Japan |           0
        Mexico |           0
   Netherlands |           0
       Nigeria |        .169
      Paraguay |           0
          Peru |           0
      Portugal |           0
         Spain |           0
        Sweden |           0
      Thailand |           0
        Turkey |           0
United Kingdom |           0
       Uruguay |           0
----------------------------
----------------------------------------------------------------------------------------
Predictor Balance:

------------------------------------------------------
                               |   Treated  Synthetic 
-------------------------------+----------------------
                          WGI1 |  .3447908   .4216941 
                          WGI2 | -.2347079  -.0245793 
                         VDEM1 |  83.37692   71.37792 
                         VDEM2 |  93.96923   87.12544 
                         VDEM5 |  46.26154   46.64872 
                           EFW |  6.348624    6.60634 
                   VDEMy(1994) |        63    62.8122 
                   VDEMy(1997) |      62.5    62.4321 
                   VDEMy(1998) |      62.8     62.845 
                   VDEMy(2002) |      65.9    66.7623 
------------------------------------------------------

Post-treatment results: Effects, p-values, standardized p-values

             | estimates      pvals  pvals_std 
-------------+--------------------------------
          c1 | -1.176304   .3461538   .3846154 
          c2 | -.9935987         .5   .5384615 
          c3 | -1.754201   .3076923   .3076923 
          c4 | -3.435999   .2307692   .1153846 
          c5 | -4.019702   .2307692   .0384615 
          c6 |    -5.291   .2692308          0 
          c7 |   -6.5505   .2692308          0 
          c8 | -7.560502   .2307692          0 
          c9 |  -10.1069   .1153846          0 
         c10 |  -10.0013   .1153846          0 
         c11 | -9.386097   .1153846          0 
		 
		 
Joint std. p-value (entire post-treatment): 0 // Perfect p-value continues




*| Robustness Check 2 - All Pre-Treatment Lags 
*| 	-- Following Ferman, Pinto & Possebom (2020)


Loss: Root Mean Squared Prediction Error

---------------------
   RMSPE |  .3604475  // Best possible fit 
---------------------

Unit Weights:

----------------------------
         Co_No | Unit_Weight
---------------+------------
       Algeria |           0
     Australia |        .597. // Depends more on a developed country
       Austria |           0
       Belgium |           0
        Brazil |           0
        Canada |           0
         Chile |           0
      Colombia |        .199
    Costa Rica |           0
       Denmark |           0
        France |           0
       Germany |           0
     Guatemala |         .08
         Italy |           0
         Japan |           0
        Mexico |           0
   Netherlands |           0
       Nigeria |        .086
      Paraguay |           0
          Peru |        .027
      Portugal |           0
         Spain |           0
        Sweden |           0
      Thailand |        .011
        Turkey |           0
United Kingdom |           0
       Uruguay |           0
----------------------------

Predictor Balance:

------------------------------------------------------
                               |   Treated  Synthetic 
-------------------------------+----------------------
                   VDEMy(1990) |      61.3    61.0487 
                   VDEMy(1991) |      62.4    62.4998 
                   VDEMy(1992) |      62.8    62.6194 
                   VDEMy(1993) |      62.8    63.0435 
                   VDEMy(1994) |        63    62.6904 
                   VDEMy(1995) |      63.3     62.784 
                   VDEMy(1996) |      62.4      62.98 
                   VDEMy(1997) |      62.5    62.7283 
                   VDEMy(1998) |      62.8    62.6956 
                   VDEMy(1999) |      63.2    63.7672 
                   VDEMy(2000) |      66.2    65.9252 
                   VDEMy(2001) |      67.1    66.7161 
                   VDEMy(2002) |      65.9    66.3678 
                   VDEMy(2003) |      64.7    66.2482 
------------------------------------------------------


Post-treatment results: Effects, p-values, standardized p-values

             | estimates      pvals  pvals_std 
-------------+--------------------------------
          c1 | -1.548202   .3333333   .1481481 
          c2 | -1.517096   .3333333   .1111111 
          c3 | -2.212902   .2592593   .1851852 
          c4 | -3.197699   .2222222   .1481481 
          c5 | -3.687599   .1851852   .0740741 
          c6 | -5.821997   .1851852    .037037 
          c7 | -6.979898   .1851852    .037037 
          c8 | -8.118599   .1851852    .037037 
          c9 |  -10.4305   .1111111    .037037 
         c10 |  -10.2637   .1111111    .037037 
         c11 | -8.750401   .1481481   .0740741 


Joint std. p-value (entire post-treatment): 0.037037 
// Same p-value as suggested baseline


*| Robustness Check 3 - Drop Developed Countries
*| -- Retain the same specification as in the paper


Loss: Root Mean Squared Prediction Error

---------------------
   RMSPE |  .8278021 
---------------------
----------------------------------------------------------------------------------------
Unit Weights:

------------------------
     Co_No | Unit_Weight
-----------+------------
   Algeria |           0
    Brazil |        .197
     Chile |           0
  Colombia |        .186
Costa Rica |        .458
 Guatemala |           0
    Mexico |           0
   Nigeria |        .159
  Paraguay |           0
      Peru |           0
  Thailand |           0
    Turkey |           0
   Uruguay |           0
------------------------
----------------------------------------------------------------------------------------
Predictor Balance:

------------------------------------------------------
                               |   Treated  Synthetic 
-------------------------------+----------------------
                          WGI1 |  .3447908   .3446003 
                          WGI2 | -.2347079  -.1256664 
                         VDEM1 |  83.37692   72.37288 
                         VDEM2 |  93.96923   87.36831 
                         VDEM5 |  46.26154   47.98989 
                           EFW |  6.348624   6.318961 
                   VDEMy(1994) |        63    62.6946 
                   VDEMy(1997) |      62.5    62.4754 
                   VDEMy(1998) |      62.8    62.8456 
                   VDEMy(2002) |      65.9    66.6426 
------------------------------------------------------

Post-treatment results: Effects, p-values, standardized p-values

             | estimates      pvals  pvals_std 
-------------+--------------------------------
          c1 | -1.760003   .6153846   .0769231 
          c2 | -1.508298   .6153846   .2307692 
          c3 | -3.038201   .5384615   .0769231 
          c4 | -4.476899   .3846154   .0769231 
          c5 | -4.813901   .3846154   .0769231 
          c6 |   -6.0387   .4615385          0 
          c7 |   -7.2834   .4615385          0 
          c8 | -8.108002   .3846154          0 
          c9 |  -10.5148   .2307692          0 
         c10 |  -10.4125   .2307692          0 
         c11 |  -10.0907   .2307692          0 


Joint std. p-value (entire post-treatment): 0  // Perfect p-value remains 


*| Robustness Check 4 - Only Latin American Donors
*| Same specification as the baseline 


Third Step: Obtain Results
----------------------------------------------------------------------------------------
Loss: Root Mean Squared Prediction Error

---------------------
   RMSPE |  1.168285 // Higher RMPSE, but not by much. 
---------------------

* Fit is still looks decent, but noticeably different than baseline

----------------------------------------------------------------------------------------
Unit Weights:

------------------------
     Co_No | Unit_Weight
-----------+------------
    Brazil |        .656
     Chile |           0
  Colombia |        .138
Costa Rica |        .078
 Guatemala |           0
    Mexico |        .037
  Paraguay |           0
      Peru |        .091
   Uruguay |           0
------------------------
----------------------------------------------------------------------------------------
Predictor Balance:

------------------------------------------------------
                               |   Treated  Synthetic 
-------------------------------+----------------------
                          WGI1 |  .3447908    .224375 
                          WGI2 | -.2347079  -.2952025 
                         VDEM1 |  83.37692   76.01799 
                         VDEM2 |  93.96923   85.54221 
                         VDEM5 |  46.26154   49.15852 
                           EFW |  6.348624   5.875361 
                   VDEMy(1994) |        63    61.9555 
                   VDEMy(1997) |      62.5    62.7604 
                   VDEMy(1998) |      62.8    62.8922 
                   VDEMy(2001) |      67.1    67.7053 
                   VDEMy(2002) |      65.9    68.6402 
------------------------------------------------------

Post-treatment results: Effects, p-values, standardized p-values

             | estimates      pvals  pvals_std 
-------------+--------------------------------
          c1 | -4.348102   .2222222          0 
          c2 | -4.293797   .3333333          0 
          c3 | -7.881503   .2222222   .1111111 
          c4 | -8.772001   .2222222   .1111111 
          c5 | -8.412499   .2222222          0 
          c6 | -9.625298   .2222222          0 
          c7 |  -10.7466   .2222222          0 
          c8 |  -11.4501   .2222222          0 
          c9 |   -13.405   .2222222          0 
         c10 |  -12.9532   .2222222          0 
         c11 |  -12.8029   .1111111          0 

		 
Joint std. p-value (entire post-treatment): 0 // perfect p-value remains 

********************************************************************************
********************************************************************************



** BOLIVIA 


** Baseline, as in the paper

Loss: Root Mean Squared Prediction Error

---------------------
   RMSPE |  .7443944 
---------------------
----------------------------------------------------------------------------------------
Unit Weights:

----------------------------
         Co_No | Unit_Weight
---------------+------------
       Algeria |           0
     Australia |           0
       Austria |           0
       Belgium |           0
        Brazil |           0
        Canada |        .158
         Chile |           0
      Colombia |           0
    Costa Rica |           0
       Denmark |           0
        France |           0
       Germany |           0
     Guatemala |           0
         Italy |        .199
         Japan |           0
        Mexico |           0
   Netherlands |           0
       Nigeria |           0
      Paraguay |        .644. // Relies on only one Latin American country
          Peru |           0
      Portugal |           0
         Spain |           0
        Sweden |           0
      Thailand |           0
        Turkey |           0
United Kingdom |           0
       Uruguay |           0
----------------------------

Predictor Balance:

------------------------------------------------------
                               |   Treated  Synthetic 
-------------------------------+----------------------
                         VDEM6 |     30.57   22.91238 
                       polity2 |       8.8     8.1424 
                         VDEM1 |      74.6   65.17762 
                          ICRG |  2.691667   2.562504 
                   VDEMy(1998) |      52.6    52.3961 
                   VDEMy(2000) |        53    52.6783 
                   VDEMy(2002) |      51.5    52.3734 
                   VDEMy(2004) |      54.9    55.0881 
------------------------------------------------------

Post-treatment results: Effects, p-values, standardized p-values

             | estimates      pvals  pvals_std 
-------------+--------------------------------
          c1 | -.6112011   .5555556   .6296296 
          c2 | -8.330401   .1111111    .037037 
          c3 | -9.600001   .1111111    .037037 
          c4 |  -12.6708   .0740741          0 
          c5 |  -15.0504    .037037          0 
          c6 |  -18.2648    .037037          0 
          c7 |  -17.9904   .0740741          0 
          c8 |  -17.3004   .0740741          0 
          c9 |  -13.1412   .1111111    .037037 
         c10 |  -14.6372   .1481481    .037037 
         c11 |  -16.5472   .1481481    .037037 


Joint std. p-value (entire post-treatment): .037037



** SUGGESTIONS: 
*| -- Start pre-treatment period in 1992
*| -- Include lags VDEMy(1992) VDEMy(1995)


Loss: Root Mean Squared Prediction Error

---------------------
   RMSPE |  .7814995 // Comparable RMSPE
---------------------
----------------------------------------------------------------------------------------
Unit Weights:

----------------------------
         Co_No | Unit_Weight
---------------+------------
       Algeria |           0
     Australia |           0
       Austria |           0
       Belgium |           0
        Brazil |           0
        Canada |           0
         Chile |           0
      Colombia |           0
    Costa Rica |           0
       Denmark |           0
        France |           0
       Germany |           0
     Guatemala |           0
         Italy |        .345
         Japan |           0
        Mexico |        .011 // Distribute donors slightly away from a single Latam
   Netherlands |           0
       Nigeria |           0
      Paraguay |        .572
          Peru |           0
      Portugal |           0
         Spain |           0
        Sweden |           0
      Thailand |        .072  
        Turkey |           0
United Kingdom |           0
       Uruguay |           0
----------------------------
----------------------------------------------------------------------------------------
Predictor Balance:

------------------------------------------------------
                               |   Treated  Synthetic 
-------------------------------+----------------------
                         VDEM6 |  31.63846   23.76163 
                       polity2 |  8.846154   8.205231 
                         VDEM1 |  74.04615   63.92859 
                          ICRG |  2.602564   2.338228 
                   VDEMy(1992) |      47.5    47.7226 
                   VDEMy(1995) |      50.3    50.4291 
                   VDEMy(1998) |      52.6    52.0236 
                   VDEMy(2000) |        53    52.3899 
                   VDEMy(2002) |      51.5    52.3541 
                   VDEMy(2004) |      54.9    54.6347 
------------------------------------------------------


Post-treatment results: Effects, p-values, standardized p-values

             | estimates      pvals  pvals_std 
-------------+--------------------------------
          c1 | -.5261004   .6666667   .7777778 
          c2 | -7.032401   .1481481    .037037 
          c3 | -8.412401   .1111111    .037037 
          c4 |   -12.103   .0740741          0 
          c5 |  -14.6274    .037037          0 
          c6 |  -17.5303    .037037          0 
          c7 |  -18.1777   .1111111          0 
          c8 |  -18.2787   .1111111          0 
          c9 |  -13.4313   .1111111    .037037 
         c10 |  -13.1181   .1481481   .0740741 
         c11 |  -14.9468   .1481481    .037037 

		 
		 

Joint std. p-value (entire post-treatment): 0 // More significangt p-value 

*| Robustness Check 1 - Drop Largest Donor
*| 	-- Largest Donor == Paraguay (0.572)
*| 	-- Same specification as suggestion above


* Fit looks pretty good as well

Loss: Root Mean Squared Prediction Error

---------------------
   RMSPE |  .8006907 // Just a tiny bit larger 
---------------------
----------------------------------------------------------------------------------------
Unit Weights:

----------------------------
         Co_No | Unit_Weight
---------------+------------
       Algeria |         .12
     Australia |           0
       Austria |           0
       Belgium |           0
        Brazil |           0
        Canada |        .051
         Chile |           0
      Colombia |        .222 // New 
    Costa Rica |           0
       Denmark |           0
        France |           0
       Germany |           0
     Guatemala |        .107 // New
         Italy |        .382 // Roughly the same
         Japan |           0
        Mexico |           0
   Netherlands |           0
       Nigeria |           0
          Peru |           0
      Portugal |           0
         Spain |           0
        Sweden |           0
      Thailand |        .118
        Turkey |           0
United Kingdom |           0
       Uruguay |           0
----------------------------

Predictor Balance:

------------------------------------------------------
                               |   Treated  Synthetic 
-------------------------------+----------------------
                         VDEM6 |  31.63846   22.50548 
                       polity2 |  8.846154   7.315231 
                         VDEM1 |  74.04615   62.84829 
                          ICRG |  2.602564   2.887506 
                   VDEMy(1992) |      47.5    47.9519 
                   VDEMy(1995) |      50.3    50.1509 
                   VDEMy(1998) |      52.6    52.1931 
                   VDEMy(2000) |        53    53.1071 
                   VDEMy(2002) |      51.5     52.983 
                   VDEMy(2004) |      54.9    53.2404 
------------------------------------------------------


Post-treatment results: Effects, p-values, standardized p-values

             | estimates      pvals  pvals_std 
-------------+--------------------------------
          c1 |  .7638994   .5384615   .5769231 
          c2 |   -5.0861   .1538462   .1538462 
          c3 | -6.029002   .1153846   .0384615 
          c4 | -8.002502   .1153846   .0384615 
          c5 | -9.972899   .1153846          0 
          c6 |  -13.3036   .1153846          0 
          c7 |   -15.293   .1153846          0 
          c8 |  -16.6651   .1153846          0 
          c9 |  -16.2275   .1153846          0 
         c10 |  -14.4873   .1538462   .0384615 
         c11 |  -16.7717   .1538462   .0384615 


Joint std. p-value (entire post-treatment): 0 // Same p-value


*| Robustness Check 2 - All Pre-Treatment Lags 
*| 	-- Following Ferman, Pinto & Possebom (2020)

Loss: Root Mean Squared Prediction Error

---------------------
   RMSPE |  .5669425 
---------------------
----------------------------------------------------------------------------------------
Unit Weights:

----------------------------
         Co_No | Unit_Weight
---------------+------------
       Algeria |        .129
     Australia |           0
       Austria |           0
       Belgium |           0
        Brazil |           0
        Canada |        .305 // Drops Italy in favor of Canada for developed
         Chile |           0
      Colombia |           0
    Costa Rica |           0
       Denmark |           0
        France |           0
       Germany |           0
     Guatemala |           0
         Italy |           0
         Japan |           0
        Mexico |        .037
   Netherlands |           0
       Nigeria |           0
      Paraguay |        .343
          Peru |           0
      Portugal |           0
         Spain |           0
        Sweden |           0
      Thailand |        .066
        Turkey |           0
United Kingdom |           0
       Uruguay |        .121
----------------------------
----------------------------------------------------------------------------------------
Predictor Balance:

------------------------------------------------------
                               |   Treated  Synthetic 
-------------------------------+----------------------
                   VDEMy(1992) |      47.5    47.3908 
                   VDEMy(1993) |      48.3    48.8065 
                   VDEMy(1994) |      49.4    49.6802 
                   VDEMy(1995) |      50.3    50.2836 
                   VDEMy(1996) |      50.3    51.0001 
                   VDEMy(1997) |      52.7    51.6818 
                   VDEMy(1998) |      52.6    52.2964 
                   VDEMy(1999) |      52.9    52.4593 
                   VDEMy(2000) |        53    52.9368 
                   VDEMy(2001) |      52.9    52.9961 
                   VDEMy(2002) |      51.5    52.7611 
                   VDEMy(2003) |        53    53.2075 
                   VDEMy(2004) |      54.9    54.2805 
                   VDEMy(2005) |      54.1    54.2736 
------------------------------------------------------

Post-treatment results: Effects, p-values, standardized p-values

             | estimates      pvals  pvals_std 
-------------+--------------------------------
          c1 | -.1736006   .9259259    .962963 
          c2 | -6.248801   .1111111   .0740741 
          c3 | -7.065602   .1111111   .0740741 
          c4 |  -10.0989   .1111111   .0740741 
          c5 |   -12.242   .1111111   .0740741 
          c6 |    -15.24   .0740741   .0740741 
          c7 |  -15.2429   .1111111   .0740741 
          c8 |   -15.231   .1111111   .0740741 
          c9 |  -12.2714   .1111111   .0740741 
         c10 |  -11.9267   .1481481   .0740741 
         c11 |  -13.7353   .1481481   .0740741 
		 
Joint std. p-value (entire post-treatment): 0.074074 
// Larger p-value, but still significant


*| Robustness Check 3 - Drop Developed Countries
*| -- Retain the same specification as suggestion above

* Fit is visually different, and better in quality (as per RMSPE)

Loss: Root Mean Squared Prediction Error

---------------------
   RMSPE |  .7253871 // RMPSE even better
---------------------
----------------------------------------------------------------------------------------
Unit Weights:

------------------------
     Co_No | Unit_Weight
-----------+------------
   Algeria |        .008
    Brazil |           0
     Chile |           0
  Colombia |           0
Costa Rica |           0
 Guatemala |           0
    Mexico |        .003
   Nigeria |           0
  Paraguay |        .654
      Peru |           0
  Thailand |        .023
    Turkey |           0
   Uruguay |        .311. // Playing the role of a developed country with high VDEMy
------------------------
----------------------------------------------------------------------------------------
Predictor Balance:

------------------------------------------------------
                               |   Treated  Synthetic 
-------------------------------+----------------------
                         VDEM6 |  31.63846    24.4233 
                       polity2 |  8.846154   7.933154 
                         VDEM1 |  74.04615   63.62034 
                          ICRG |  2.602564   2.221564 
                   VDEMy(1992) |      47.5    47.2579 
                   VDEMy(1995) |      50.3    50.4742 
                   VDEMy(1998) |      52.6     51.754 
                   VDEMy(2000) |        53    52.0054 
                   VDEMy(2002) |      51.5    52.2039 
                   VDEMy(2004) |      54.9    54.8171 
------------------------------------------------------

Post-treatment results: Effects, p-values, standardized p-values

             | estimates      pvals  pvals_std 
-------------+--------------------------------
          c1 | -.9153005   .8461538   .3846154 
          c2 | -7.868402   .2307692          0 
          c3 | -9.197001   .2307692          0 
          c4 |  -13.0116   .1538462          0 
          c5 |  -15.5914   .0769231          0 
          c6 |   -18.937   .0769231          0 
          c7 |  -19.0157   .0769231          0 
          c8 |  -18.4736   .2307692          0 
          c9 |  -13.2714   .2307692          0 
         c10 |  -14.2079   .3076923          0 
         c11 |  -15.6501   .3076923          0 



 Joint std. p-value (entire post-treatment): 0. // Perfect
 
 
*| Robustness Check 4 - Only Latin American Donor
*| -- Retain the same specification as the suggestion above
 
 
 Loss: Root Mean Squared Prediction Error
 
 // Fit looks almost identical to the dropping only developed countries 
 
 ---------------------
   RMSPE |   .719585 // RMPSE even better
---------------------
----------------------------------------------------------------------------------------
Unit Weights:

------------------------
     Co_No | Unit_Weight
-----------+------------
    Brazil |           0
     Chile |           0
  Colombia |           0
Costa Rica |           0
 Guatemala |        .006
    Mexico |        .043 // Gets the weights from Algeria and Thailand 
  Paraguay |        .637
      Peru |           0
   Uruguay |        .315
------------------------


Predictor Balance:

------------------------------------------------------
                               |   Treated  Synthetic 
-------------------------------+----------------------
                         VDEM6 |  31.63846   24.28339 
                       polity2 |  8.846154   7.928308 
                         VDEM1 |  74.04615   64.34548 
                          ICRG |  2.602564   2.250474 
                   VDEMy(1992) |      47.5    47.4341 
                   VDEMy(1995) |      50.3    50.5815 
                   VDEMy(1998) |      52.6    52.0653 
                   VDEMy(2000) |        53    52.7463 
                   VDEMy(2002) |      51.5    52.9609 
                   VDEMy(2004) |      54.9    55.6225 
------------------------------------------------------



Post-treatment results: Effects, p-values, standardized p-values

             | estimates      pvals  pvals_std 
-------------+--------------------------------
          c1 | -1.773201   .5555556   .1111111 
          c2 | -9.070601   .2222222          0 
          c3 |  -10.2474   .1111111          0 
          c4 |  -13.6279   .1111111          0 
          c5 |  -16.1885   .1111111          0 
          c6 |  -19.5682   .1111111          0 
          c7 |  -19.5447   .1111111          0 
          c8 |  -18.9303   .1111111          0 
          c9 |  -13.8684   .1111111          0 
         c10 |  -15.3448   .1111111          0 
         c11 |  -16.8331   .1111111          0 


Joint std. p-value (entire post-treatment): 0. // Again, perfect


********************************************************************************
********************************************************************************

 ** ECUADOR 
 
 * Baseline, as in the paper: 
 
 Loss: Root Mean Squared Prediction Error

---------------------
   RMSPE |   .466632 
---------------------
----------------------------------------------------------------------------------------
Unit Weights:

----------------------------
         Co_No | Unit_Weight
---------------+------------
       Algeria |        .027
     Australia |           0
       Austria |           0
       Belgium |           0
        Brazil |        .072
        Canada |           0
         Chile |           0
      Colombia |        .519
    Costa Rica |           0
       Denmark |           0
        France |           0
       Germany |           0
     Guatemala |           0
         Italy |        .015
         Japan |           0
        Mexico |           0
   Netherlands |        .091
       Nigeria |           0
      Paraguay |        .169
          Peru |           0
      Portugal |           0
         Spain |           0
        Sweden |           0
      Thailand |        .106
        Turkey |           0
United Kingdom |           0
       Uruguay |           0
----------------------------
----------------------------------------------------------------------------------------
Predictor Balance:

------------------------------------------------------
                               |   Treated  Synthetic 
-------------------------------+----------------------
                           EFW |  6.087119   6.563039 
                       polity2 |         7     7.2678 
                         VDEM4 |   -100.89  -37.05309 
                          ICRG |  2.879167     2.4563 
                   VDEMy(1997) |      47.2    46.8582 
                   VDEMy(2002) |      46.8    47.0665 
                   VDEMy(2003) |      47.9    47.5753 
                   VDEMy(2006) |      46.6    47.1075 
------------------------------------------------------

Post-treatment results: Effects, p-values, standardized p-values

             | estimates      pvals  pvals_std 
-------------+--------------------------------
          c1 | -6.034501   .0740741          0 
          c2 |  -15.5436          0          0 
          c3 |  -17.7037          0          0 
          c4 |   -20.957          0          0 
          c5 |  -23.4837          0          0 
          c6 |  -23.7772          0          0 
          c7 |  -25.6975          0          0 
          c8 |  -24.2148    .037037          0 
          c9 |  -23.9617   .0740741          0 
         c10 |  -23.3454   .1111111          0 
         c11 |  -16.2181   .1111111          0 

Joint std. p-value (entire post-treatment): 0 


** SUGGESTION: Extend pre-treatment to 1993, keep same specification 

Loss: Root Mean Squared Prediction Error

---------------------
   RMSPE |  .4401618 // Slightly better RMPSE
---------------------
----------------------------------------------------------------------------------------
Unit Weights:

----------------------------
         Co_No | Unit_Weight
---------------+------------
       Algeria |           0  // Goes out
     Australia |           0
       Austria |           0
       Belgium |           0
        Brazil |           0
        Canada |           0
         Chile |           0
      Colombia |         .52
    Costa Rica |           0
       Denmark |           0
        France |           0
       Germany |           0
     Guatemala |           0
         Italy |        .168
         Japan |           0
        Mexico |           0
   Netherlands |           0 // Goes out
       Nigeria |           0
      Paraguay |        .206
          Peru |           0
      Portugal |           0
         Spain |           0
        Sweden |           0
      Thailand |        .105 // Basically doesn't change
        Turkey |           0
United Kingdom |           0
       Uruguay |           0
----------------------------
----------------------------------------------------------------------------------------
Predictor Balance:

------------------------------------------------------
                               |   Treated  Synthetic 
-------------------------------+----------------------
                           EFW |   6.08495   6.685114 
                       polity2 |  7.571429   7.794714 
                         VDEM4 | -98.86429  -63.04114 
                          ICRG |  2.943452   2.368083 
                   VDEMy(1997) |      47.2    46.9743 
                   VDEMy(2002) |      46.8     47.069 
                   VDEMy(2003) |      47.9    47.5823 
                   VDEMy(2006) |      46.6    47.2467 
------------------------------------------------------

Post-treatment results: Effects, p-values, standardized p-values

             | estimates      pvals  pvals_std 
-------------+--------------------------------
          c1 | -6.134501   .1111111          0 
          c2 |  -15.4176          0          0 
          c3 |  -17.5461          0          0 
          c4 |  -20.9309          0          0 
          c5 |  -23.6211          0          0 
          c6 |  -23.9875          0          0 
          c7 |  -26.2229          0          0 
          c8 |  -24.8521    .037037          0 
          c9 |  -24.6235   .0740741          0 
         c10 |  -23.9808   .0740741          0 
         c11 |  -16.8585   .1111111          0 

Joint std. p-value (entire post-treatment): 0 // Doesn't affect the perfect results


*| Robustness Check 1 - Drop Largest Donor
*| 	-- Largest Donor == Colombia (0.520)
*| 	-- Same specification as suggestion above


Loss: Root Mean Squared Prediction Error

---------------------
   RMSPE |  1.297192 // Fit is way worse, but expected 
---------------------
----------------------------------------------------------------------------------------
Unit Weights:

----------------------------
         Co_No | Unit_Weight
---------------+------------
       Algeria |         .15
     Australia |           0
       Austria |           0
       Belgium |           0
        Brazil |           0
        Canada |        .023
         Chile |           0
    Costa Rica |           0
       Denmark |           0
        France |           0
       Germany |           0
     Guatemala |           0
         Italy |        .276. // Relies more on developed
         Japan |           0
        Mexico |           0
   Netherlands |           0
       Nigeria |           0
      Paraguay |        .454
          Peru |           0
      Portugal |           0
         Spain |           0
        Sweden |           0
      Thailand |        .097
        Turkey |           0
United Kingdom |           0
       Uruguay |           0
----------------------------
----------------------------------------------------------------------------------------
Predictor Balance:

------------------------------------------------------
                               |   Treated  Synthetic 
-------------------------------+----------------------
                           EFW |   6.08495   6.787398 
                       polity2 |  7.571429   6.666286 
                         VDEM4 | -98.86429  -42.75047 
                          ICRG |  2.943452   2.230932 
                   VDEMy(1997) |      47.2    46.2822 
                   VDEMy(2002) |      46.8    47.0996 
                   VDEMy(2003) |      47.9    47.9339 
                   VDEMy(2006) |      46.6    47.6218 
------------------------------------------------------


Post-treatment results: Effects, p-values, standardized p-values

             | estimates      pvals  pvals_std 
-------------+--------------------------------
          c1 |   -6.4348   .1153846          0 
          c2 |   -15.973          0          0 
          c3 |  -18.3559          0          0 
          c4 |  -20.0674          0          0 
          c5 |  -20.7358          0          0 
          c6 |   -20.799          0          0 
          c7 |  -21.0901   .0769231          0 
          c8 |   -19.673   .1153846          0 
          c9 |  -19.3446   .1153846   .0384615 
         c10 |  -18.8636   .1153846   .0384615 
         c11 |  -11.6625   .1538462   .0384615 

		 
Joint std. p-value (entire post-treatment):	0.03846 // Worse, but still 
																				significant 

* Robustness Check 2 - All Pre-Treatment Lags 
* 	-- Following Ferman, Pinto & Possebom (2020)

Loss: Root Mean Squared Prediction Error

---------------------
   RMSPE |  .3699185 // Best RMSPE possible, as expected 
---------------------
----------------------------------------------------------------------------------------
Unit Weights:

----------------------------
         Co_No | Unit_Weight
---------------+------------
       Algeria |           0
     Australia |           0
       Austria |           0
       Belgium |           0
        Brazil |           0
        Canada |           0
         Chile |           0
      Colombia |        .631 // More weight here
    Costa Rica |           0
       Denmark |           0
        France |           0
       Germany |           0
     Guatemala |           0
         Italy |         .16
         Japan |           0
        Mexico |           0
   Netherlands |           0
       Nigeria |           0
      Paraguay |        .095 // Less weight here
          Peru |           0
      Portugal |           0
         Spain |           0
        Sweden |           0
      Thailand |        .114
        Turkey |           0
United Kingdom |           0
       Uruguay |           0
----------------------------
----------------------------------------------------------------------------------------
Predictor Balance:

------------------------------------------------------
                               |   Treated  Synthetic 
-------------------------------+----------------------
                   VDEMy(1993) |        47    46.5711 
                   VDEMy(1994) |      46.3    46.5655 
                   VDEMy(1995) |      46.5    46.7693 
                   VDEMy(1996) |      46.7    46.4009 
                   VDEMy(1997) |      47.2    47.1516 
                   VDEMy(1998) |      47.6    47.0971 
                   VDEMy(1999) |        47    46.8234 
                   VDEMy(2000) |      46.6    47.2327 
                   VDEMy(2001) |      46.6    47.1782 
                   VDEMy(2002) |      46.8    47.0941 
                   VDEMy(2003) |      47.9    47.4268 
                   VDEMy(2004) |      47.6    47.6955 
                   VDEMy(2005) |      48.1    47.7836 
                   VDEMy(2006) |      46.6    46.8438 
------------------------------------------------------


             | estimates      pvals  pvals_std 
-------------+--------------------------------
          c1 | -5.722701   .1111111          0 
          c2 |  -14.4565    .037037          0 
          c3 |  -16.5238    .037037          0 
          c4 |  -20.1575    .037037          0 
          c5 |  -23.4279    .037037    .037037 
          c6 |  -24.3178    .037037    .037037 
          c7 |  -27.3223          0    .037037 
          c8 |  -25.5504   .0740741    .037037 
          c9 |  -25.3661   .1111111    .037037 
         c10 |   -24.692   .1111111    .037037 
         c11 |  -17.5483   .1481481    .037037 

Joint std. p-value (entire post-treatment): 0.037037 
// A little bit worse, but still significant


*| Robustness Check 3 - Drop Developed Countries
*| -- Retain the same specification as suggestion above

Loss: Root Mean Squared Prediction Error

---------------------
   RMSPE |  .5909388 // Almost just as good 
---------------------
----------------------------------------------------------------------------------------
Unit Weights:

------------------------
     Co_No | Unit_Weight
-----------+------------
   Algeria |           0
    Brazil |           0
     Chile |           0
  Colombia |        .769  // Even more weight to Colombia
Costa Rica |        .108  // This is new 
 Guatemala |           0
    Mexico |           0
   Nigeria |           0
  Paraguay |           0
      Peru |           0
  Thailand |         .05
    Turkey |        .073 // This is new
   Uruguay |           0
------------------------
----------------------------------------------------------------------------------------
Predictor Balance:

------------------------------------------------------
                               |   Treated  Synthetic 
-------------------------------+----------------------
                           EFW |   6.08495   6.456598 
                       polity2 |  7.571429   7.614571 
                         VDEM4 | -98.86429  -43.11877 
                          ICRG |  2.943452     2.6535 
                   VDEMy(1997) |      47.2    46.9156 
                   VDEMy(2002) |      46.8    47.1881 
                   VDEMy(2003) |      47.9    47.5364 
                   VDEMy(2006) |      46.6    48.0295 
------------------------------------------------------

Post-treatment results: Effects, p-values, standardized p-values

             | estimates      pvals  pvals_std 
-------------+--------------------------------
          c1 | -6.625301   .2307692          0 
          c2 |  -13.7818   .0769231          0 
          c3 |  -15.7084          0          0 
          c4 |   -19.578          0          0 
          c5 |  -22.9726          0          0 
          c6 |  -23.6934          0          0 
          c7 |  -27.3401          0          0 
          c8 |  -26.8273   .1538462          0 
          c9 |  -26.5559   .1538462          0 
         c10 |  -25.0931   .1538462          0 
         c11 |  -17.6499   .2307692          0 



Joint std. p-value (entire post-treatment): 0 // Perfect still 


*| Robustness Check 4 - Only Latin American Donor
*| -- Retain the same specification as the suggestion above


Loss: Root Mean Squared Prediction Error

---------------------
   RMSPE |  .9161874 // Worse here, but visually is nearly identical
---------------------
----------------------------------------------------------------------------------------
Unit Weights:

------------------------
     Co_No | Unit_Weight
-----------+------------
    Brazil |           0
     Chile |           0
  Colombia |        .888 // Even more weight to Colombia 
Costa Rica |        .105
 Guatemala |           0
    Mexico |           0
  Paraguay |           0
      Peru |        .007
   Uruguay |           0
------------------------

Predictor Balance:

------------------------------------------------------
                               |   Treated  Synthetic 
-------------------------------+----------------------
                           EFW |   6.08495   6.459449 
                       polity2 |  7.571429   7.545214 
                         VDEM4 | -98.86429  -44.87623 
                          ICRG |  2.943452   2.655485 
                   VDEMy(1997) |      47.2    47.1286 
                   VDEMy(2002) |      46.8    46.6278 
                   VDEMy(2003) |      47.9     46.997 
                   VDEMy(2006) |      46.6     48.966 
------------------------------------------------------

Post-treatment results: Effects, p-values, standardized p-values

             | estimates      pvals  pvals_std 
-------------+--------------------------------
          c1 | -7.775702   .1111111          0 
          c2 |  -14.6225          0          0 
          c3 |  -16.6197          0          0 
          c4 |  -21.1879          0          0 
          c5 |  -24.8833          0          0 
          c6 |  -25.5672          0          0 
          c7 |  -29.9594          0          0 
          c8 |   -31.023          0          0 
          c9 |  -30.9992          0          0 
         c10 |  -30.1817          0          0 
         c11 |  -23.0656          0          0 

		 
Joint std. p-value (entire post-treatment): 0 // Perfect still 

Normal joint p-value is also 0. // Very good 

********************************************************************************
********************************************************************************

 ** NICARAGUA 
 
 * Baseline, as in the paper: 
 
 Loss: Root Mean Squared Prediction Error

---------------------
   RMSPE |  2.328675   // Worst fit of all 
---------------------
----------------------------------------------------------------------------------------
Unit Weights:

----------------------------
         Co_No | Unit_Weight
---------------+------------
       Algeria |        .119
     Australia |           0
       Austria |           0
       Belgium |           0
        Brazil |           0
        Canada |           0
         Chile |           0
      Colombia |        .881
    Costa Rica |           0
       Denmark |           0
        France |           0
       Germany |           0
     Guatemala |           0
         Italy |           0
         Japan |           0
        Mexico |           0
   Netherlands |           0
       Nigeria |           0
      Paraguay |           0
          Peru |           0
      Portugal |           0
         Spain |           0
        Sweden |           0
      Thailand |           0
        Turkey |           0
United Kingdom |           0
       Uruguay |           0
----------------------------
----------------------------------------------------------------------------------------
Predictor Balance:

------------------------------------------------------
                               |   Treated  Synthetic 
-------------------------------+----------------------
                         VDEM2 |     87.69   72.78668 
                         VDEM4 |     -6.26  -59.26065 
                          WGI1 | -.0185309  -.4716221 
                       polity2 |         8      5.929 
                          WGI3 | -.6491392  -.3662565 
                   VDEMy(1996) |      45.8    39.9394 
                   VDEMy(2001) |      37.7     39.106 
                   VDEMy(2002) |      38.2    38.8417 
                   VDEMy(2004) |      37.8     39.406 
------------------------------------------------------

Post-treatment results: Effects, p-values, standardized p-values

             | estimates      pvals  pvals_std 
-------------+--------------------------------
          c1 | -7.867201   .1111111   .1481481 
          c2 |  -19.4264    .037037          0 
          c3 |  -21.2368          0    .037037 
          c4 |   -22.124          0    .037037 
          c5 |  -25.5888          0    .037037 
          c6 |   -29.428          0    .037037 
          c7 |  -32.9152          0    .037037 
          c8 |  -36.1152          0    .037037 
          c9 |  -36.8384          0    .037037 
         c10 |  -37.0512          0    .037037 
         c11 |   -37.436          0    .037037 

Joint std. p-value (entire post-treatment): 0.037037 

** No suggestions for this one

*| Robustness Check 1 - Drop Largest Donor
*| 	-- Largest Donor == Colombia (0.881)
*| 	-- Same specification as baseline


Loss: Root Mean Squared Prediction Error

---------------------
   RMSPE |  2.543893 // Fit is bad, but not much worse than the baseline
---------------------
---------------------------------------------------------------------------------------------
Unit Weights:

----------------------------
         Co_No | Unit_Weight
---------------+------------
       Algeria |         .64
     Australia |           0
       Austria |           0
       Belgium |           0
        Brazil |           0
        Canada |           0
         Chile |           0
    Costa Rica |           0
       Denmark |           0
        France |           0
       Germany |           0
     Guatemala |           0
         Italy |        .082
         Japan |           0
        Mexico |           0
   Netherlands |           0
       Nigeria |           0
      Paraguay |           0
          Peru |           0
      Portugal |           0
         Spain |        .278 // Relies more on developed countries
        Sweden |           0
      Thailand |           0
        Turkey |           0
United Kingdom |           0
       Uruguay |           0
----------------------------
---------------------------------------------------------------------------------------------
Predictor Balance:

------------------------------------------------------
                               |   Treated  Synthetic 
-------------------------------+----------------------
                         VDEM2 |     87.69    75.0702 
                         VDEM4 |     -6.26   72.78754 
                          WGI1 | -.0185309  -.2135149 
                       polity2 |         8       2.32 
                          WGI3 | -.6491392  -.0801364 
                   VDEMy(1996) |      45.8    39.1874 
                   VDEMy(2001) |      37.7    39.0916 
                   VDEMy(2002) |      38.2    39.1572 
                   VDEMy(2004) |      37.8    39.1514 
------------------------------------------------------

Post-treatment results: Effects, p-values, standardized p-values

             | estimates      pvals  pvals_std 
-------------+--------------------------------
          c1 | -5.996401   .1153846   .1923077 
          c2 |  -16.7011   .0384615   .0384615 
          c3 |  -18.4595          0   .0384615 
          c4 |  -19.3293          0   .0384615 
          c5 |  -19.8991          0   .0769231 
          c6 |  -20.4246          0   .0769231 
          c7 |  -23.1964          0   .0384615 
          c8 |  -25.5239          0   .0384615 
          c9 |   -25.689   .0384615   .1153846 
         c10 |   -25.291   .0769231   .1538462 
         c11 |  -25.4145   .0769231   .1923077 
		 
Joint std. p-value (entire post-treatment): 0.0384615 // Still significant 



* Robustness Check 2 - All Pre-Treatment Lags 
* 	-- Following Ferman, Pinto & Possebom (2020)


Loss: Root Mean Squared Prediction Error

---------------------
   RMSPE |  2.320275 
---------------------
-------------------------------------------------------------------------------------------------------------------------------
Unit Weights:

----------------------------
         Co_No | Unit_Weight
---------------+------------
       Algeria |        .111
     Australia |           0
       Austria |           0
       Belgium |           0
        Brazil |           0
        Canada |           0
         Chile |           0
      Colombia |        .889
    Costa Rica |           0
       Denmark |           0
        France |           0
       Germany |           0
     Guatemala |           0
         Italy |           0
         Japan |           0
        Mexico |           0
   Netherlands |           0
       Nigeria |           0
      Paraguay |           0
          Peru |           0
      Portugal |           0
         Spain |           0
        Sweden |           0
      Thailand |           0
        Turkey |           0
United Kingdom |           0
       Uruguay |           0
----------------------------
-------------------------------------------------------------------------------------------------------------------------------
Predictor Balance:

------------------------------------------------------
                               |   Treated  Synthetic 
-------------------------------+----------------------
                   VDEMy(1996) |      45.8    40.1586 
                   VDEMy(1997) |      41.3    39.9475 
                   VDEMy(1998) |      41.3    39.2252 
                   VDEMy(1999) |      38.6    38.8473 
                   VDEMy(2000) |      38.1    39.4029 
                   VDEMy(2001) |      37.7     39.314 
                   VDEMy(2002) |      38.2    39.0473 
                   VDEMy(2003) |      37.8     39.414 
                   VDEMy(2004) |      37.8     39.614 
                   VDEMy(2005) |      37.8     40.014 
                   VDEMy(2006) |      33.1    41.4364 
------------------------------------------------------


Post-treatment results: Effects, p-values, standardized p-values

             | estimates      pvals  pvals_std 
-------------+--------------------------------
          c1 | -8.336402   .1111111   .2592593 
          c2 |  -19.9143   .0740741   .2222222 
          c3 |  -21.7366    .037037   .2222222 
          c4 |  -22.6255          0   .1851852 
          c5 |  -26.1481          0   .2592593 
          c6 |  -30.0485          0   .2592593 
          c7 |  -33.5374          0   .1481481 
          c8 |  -36.7374          0   .2222222 
          c9 |  -37.4708          0   .2592593 
         c10 |  -37.6819          0   .2592593 
         c11 |   -38.082          0   .2962963 



Joint std. p-value (entire post-treatment) 0.259 // Not significant 



*| Robustness Check 3 - Drop Developed Countries
*| -- Retain the same specification as baseline


Loss: Root Mean Squared Prediction Error

---------------------
   RMSPE |  2.323989 // Effectively identical to baseline
---------------------
---------------------------------------------------------------------------------------------
Unit Weights:

------------------------
     Co_No | Unit_Weight
-----------+------------
   Algeria |        .116
    Brazil |           0
     Chile |           0
  Colombia |        .884 // Changes 0.002 from baseline
Costa Rica |           0
 Guatemala |           0
    Mexico |           0
   Nigeria |           0
  Paraguay |           0
      Peru |           0
  Thailand |           0
    Turkey |           0
   Uruguay |           0
------------------------
---------------------------------------------------------------------------------------------
Predictor Balance:

------------------------------------------------------
                               |   Treated  Synthetic 
-------------------------------+----------------------
                         VDEM2 |     87.69   72.81752 
                         VDEM4 |     -6.26   -59.6466 
                          WGI1 | -.0185309  -.4697452 
                       polity2 |         8      5.956 
                          WGI3 | -.6491392   -.364935 
                   VDEMy(1996) |      45.8    40.0216 
                   VDEMy(2001) |      37.7     39.184 
                   VDEMy(2002) |      38.2    38.9188 
                   VDEMy(2004) |      37.8     39.484 
------------------------------------------------------

Post-treatment results: Effects, p-values, standardized p-values

             | estimates      pvals  pvals_std 
-------------+--------------------------------
          c1 | -8.198401   .3076923   .2307692 
          c2 |  -19.7708   .0769231          0 
          c3 |  -21.5896          0          0 
          c4 |   -22.478          0   .0769231 
          c5 |  -25.9836          0          0 
          c6 |   -29.866          0          0 
          c7 |  -33.3544          0          0 
          c8 |  -36.5544          0          0 
          c9 |  -37.2848          0          0 
         c10 |  -37.4964          0          0 
         c11 |   -37.892          0          0 


Joint std. p-value (entire post-treatment)  =  0 
// Improves p-value by dropping countries, but fit is visually worse 


*| Robustness Check 4 - Only Latin American Donors
*| -- Retain the same specification as baseline


Loss: Root Mean Squared Prediction Error

---------------------
   RMSPE |  6.257906  // Pretty bad fit 
---------------------
---------------------------------------------------------------------------------------------
Unit Weights:

------------------------
     Co_No | Unit_Weight
-----------+------------
    Brazil |           0
     Chile |           0
  Colombia |        .172
Costa Rica |           0
 Guatemala |        .725
    Mexico |           0
  Paraguay |        .103
      Peru |           0
   Uruguay |           0
------------------------
---------------------------------------------------------------------------------------------
Predictor Balance:

------------------------------------------------------
                               |   Treated  Synthetic 
-------------------------------+----------------------
                         VDEM2 |     87.69   72.90913 
                         VDEM4 |     -6.26  -33.60844 
                          WGI1 | -.0185309  -.3389175 
                       polity2 |         8     7.7456 
                          WGI3 | -.6491392  -.7373139 
                   VDEMy(1996) |      45.8    31.3334 
                   VDEMy(2001) |      37.7    38.5972 
                   VDEMy(2002) |      38.2    38.6906 
                   VDEMy(2004) |      37.8    40.2933 
------------------------------------------------------


Post-treatment results: Effects, p-values, standardized p-values

             | estimates      pvals  pvals_std 
-------------+--------------------------------
          c1 | -7.495702   .1111111   .2222222 
          c2 |  -19.2472          0          0 
          c3 |  -21.8492          0          0 
          c4 |  -22.8419          0          0 
          c5 |  -23.8332          0          0 
          c6 |    -24.78          0          0 
          c7 |  -27.1006          0          0 
          c8 |   -31.175          0          0 
          c9 |  -31.9334          0          0 
         c10 |  -33.5319          0          0 
         c11 |   -35.554          0          0 

		 
Joint std. p-value (entire post-treatment)  =	 0 
// Just spurious given the fit. I would be very cautious in interpreting this one.


********************************************************************************
********************************************************************************

 ** VENEZUELA
 
 * Baseline, as in the paper: 
 
 Loss: Root Mean Squared Prediction Error

---------------------
   RMSPE |  1.099376 
---------------------
---------------------------------------------------------------------------------------------
Unit Weights: // Relatively large dependence on non-Latam

----------------------------
         Co_No | Unit_Weight
---------------+------------
       Algeria |           0
     Australia |           0
       Austria |           0
       Belgium |           0
        Brazil |           0
        Canada |           0
         Chile |           0
      Colombia |           0
    Costa Rica |        .437
       Denmark |           0
        France |           0
       Germany |           0
     Guatemala |           0
         Italy |        .279 
         Japan |           0
        Mexico |           0
   Netherlands |           0
       Nigeria |        .284
      Paraguay |           0
          Peru |           0
      Portugal |           0
         Spain |           0
        Sweden |           0
      Thailand |           0
        Turkey |           0
United Kingdom |           0
       Uruguay |           0
----------------------------
---------------------------------------------------------------------------------------------
Predictor Balance:

------------------------------------------------------
                               |   Treated  Synthetic 
-------------------------------+----------------------
                          WGI1 | -.0936463   .3446288 
                         VDEM2 |  89.64444   86.53838 
                         VDEM3 | -43.54444   9.844882 
                       polity2 |  8.666667   6.229111 
                           EFW |  5.690285   5.705011 
                          ICRG |  2.958333    3.79747 
                   VDEMy(1988) |      59.1    58.5035 
                   VDEMy(1991) |      62.6    60.4056 
                   VDEMy(1994) |      60.7    60.7937 
                   VDEMy(1997) |      60.9     60.909 
------------------------------------------------------

 Post-treatment results: Effects, p-values, standardized p-values

             | estimates      pvals  pvals_std 
-------------+--------------------------------
          c1 | -2.343099   .1481481    .037037 
          c2 |  -18.4085          0          0 
          c3 |  -34.9736          0          0 
          c4 |  -40.4795          0          0 
          c5 |  -44.1768          0          0 
          c6 |  -44.6137          0          0 
          c7 |  -47.2052          0          0 
          c8 |  -51.0819          0          0 
          c9 |  -52.2889          0          0 
         c10 |  -52.7013          0          0 
         c11 |  -53.6632          0          0 
         c12 |  -53.6912          0          0 
         c13 |  -54.8786          0          0 
         c14 |  -56.3244          0          0 
         c15 |  -56.9572          0          0 
         c16 |  -59.9699          0          0 
         c17 |  -60.5303          0          0 
         c18 |  -60.2011          0          0 
         c19 |  -58.5081          0          0 
         c20 |  -61.7958          0          0 
         c21 |  -63.2742          0          0 

Joint std. p-value (entire post-treatment)  =	 0 // Pretty good 


** SUGGESTION: Extend pre-treatment to 1980

* Results are identical to baseline in the paper, but it is good to show that our
* pre-treatment fit is longer 


*| Robustness Check 1 - Drop Largest Donor
*| 	-- Largest Donor == Costa Rica (0.437)
*| 	-- Same specification as suggestion above



Loss: Root Mean Squared Prediction Error

---------------------
   RMSPE |  1.188023 
---------------------
---------------------------------------------------------------------------------------------
Unit Weights:

----------------------------
         Co_No | Unit_Weight
---------------+------------
       Algeria |           0
     Australia |           0
       Austria |           0
       Belgium |           0
        Brazil |        .039
        Canada |           0
         Chile |           0
      Colombia |           0
       Denmark |           0
        France |           0
       Germany |           0
     Guatemala |           0
         Italy |        .543
         Japan |           0
        Mexico |           0
   Netherlands |           0
       Nigeria |        .244
      Paraguay |           0
          Peru |           0
      Portugal |           0
         Spain |        .174
        Sweden |           0
      Thailand |           0
        Turkey |           0
United Kingdom |           0
       Uruguay |           0
----------------------------
---------------------------------------------------------------------------------------------
Predictor Balance:

------------------------------------------------------
                               |   Treated  Synthetic 
-------------------------------+----------------------
                          WGI1 | -.0936463   .4731404 
                         VDEM2 |  89.64444    85.5026 
                         VDEM3 | -43.54444   38.69508 
                       polity2 |  8.666667   6.532889 
                           EFW |  5.690285   5.966464 
                          ICRG |  2.958333   3.406262 
                   VDEMy(1988) |      59.1     58.286 
                   VDEMy(1991) |      62.6    59.8622 
                   VDEMy(1994) |      60.7    60.3143 
                   VDEMy(1997) |      60.9    61.0239 
------------------------------------------------------

Post-treatment results: Effects, p-values, standardized p-values

             | estimates      pvals  pvals_std 
-------------+--------------------------------
          c1 | -2.300299   .1538462   .0384615 
          c2 |  -18.3677          0          0 
          c3 |  -34.9378          0          0 
          c4 |  -40.4032          0          0 
          c5 |  -44.0698          0          0 
          c6 |  -44.5064          0          0 
          c7 |  -47.1026          0          0 
          c8 |  -50.9914          0          0 
          c9 |  -52.1916          0          0 
         c10 |  -52.6057          0          0 
         c11 |  -53.5826          0          0 
		 
Joint std. p-value (entire post-treatment)  =	 0 // Perfect 



*| Robustness Check 2 - All Pre-Treatment Lags 
*| 	-- Following Ferman, Pinto & Possebom (2020)


Loss: Root Mean Squared Prediction Error

---------------------
   RMSPE |  .3130274 // Best fir possible 
---------------------
---------------------------------------------------------------------------------------------
Unit Weights:  // Much more dependent on developed countries

----------------------------
         Co_No | Unit_Weight
---------------+------------
       Algeria |           0
     Australia |        .421
       Austria |           0
       Belgium |           0
        Brazil |        .004
        Canada |           0
         Chile |        .021
      Colombia |        .068
    Costa Rica |           0
       Denmark |        .174
        France |           0
       Germany |           0
     Guatemala |           0
         Italy |           0
         Japan |           0
        Mexico |           0
   Netherlands |           0
       Nigeria |        .201
      Paraguay |           0
          Peru |        .035
      Portugal |           0
         Spain |           0
        Sweden |           0
      Thailand |           0
        Turkey |        .078
United Kingdom |           0
       Uruguay |           0
----------------------------
---------------------------------------------------------------------------------------------
Predictor Balance:

------------------------------------------------------
                               |   Treated  Synthetic 
-------------------------------+----------------------
                   VDEMy(1980) |        60    59.8927 
                   VDEMy(1981) |      59.6    59.6989 
                   VDEMy(1982) |      59.6     59.785 
                   VDEMy(1983) |      59.6    59.7552 
                   VDEMy(1984) |      59.1     59.018 
                   VDEMy(1985) |      58.8    59.0497 
                   VDEMy(1986) |      58.8    59.0319 
                   VDEMy(1987) |      58.8    58.9767 
                   VDEMy(1988) |      59.1    59.1492 
                   VDEMy(1989) |      59.3    59.2175 
                   VDEMy(1990) |      60.6    61.1036 
                   VDEMy(1991) |      62.6    62.0165 
                   VDEMy(1992) |      62.3    61.5911 
                   VDEMy(1993) |      62.3    62.3406 
                   VDEMy(1994) |      60.7    61.2763 
                   VDEMy(1995) |      61.1    61.2651 
                   VDEMy(1996) |      61.1    61.4074 
                   VDEMy(1997) |      60.9    61.1881 
------------------------------------------------------


Post-treatment results: Effects, p-values, standardized p-values

             | estimates      pvals  pvals_std 
-------------+--------------------------------
          c1 | -2.570098   .2222222    .037037 
          c2 |  -19.0365    .037037          0 
          c3 |  -35.5629          0          0 
          c4 |  -39.2308          0          0 
          c5 |  -42.8129          0          0 
          c6 |  -43.2782          0          0 
          c7 |  -45.8499          0          0 
          c8 |  -49.6671          0          0 
          c9 |  -51.0162          0          0 
         c10 |  -51.3091          0          0 
         c11 |  -51.8293          0          0 


Joint std. p-value (entire post-treatment)  =	 0 // Perfect 


*| Robustness Check 3 - Drop Developed Countries
*| -- Drop VDEM 3 and ICRG as predictors 


Loss: Root Mean Squared Prediction Error

---------------------
   RMSPE |  .8726937 
---------------------
------------------------------------------------------------------------------------------------------------
Unit Weights:

------------------------
     Co_No | Unit_Weight
-----------+------------
   Algeria |           0
    Brazil |           0
     Chile |           0
  Colombia |        .073
Costa Rica |         .65
 Guatemala |           0
    Mexico |           0
   Nigeria |         .22
  Paraguay |           0
      Peru |        .057
  Thailand |           0
    Turkey |           0
   Uruguay |           0
------------------------
------------------------------------------------------------------------------------------------------------
Predictor Balance:

------------------------------------------------------
                               |   Treated  Synthetic 
-------------------------------+----------------------
                   VDEMy(1988) |      59.1    59.3991 
                   VDEMy(1991) |      62.6    61.9919 
                   VDEMy(1994) |      60.7    60.9939 
                   VDEMy(1997) |      60.9    60.8041 
                          WGI1 | -.0936463   .2909916 
                         VDEM2 |  89.64444   85.97495 
                       polity2 |  8.666667   6.610778 
                           EFW |  5.690285    5.58229 
------------------------------------------------------

Post-treatment results: Effects, p-values, standardized p-values

             | estimates      pvals  pvals_std 
-------------+--------------------------------
          c1 | -2.686499   .3076923          0 
          c2 |   -19.252          0          0 
          c3 |  -35.4664          0          0 
          c4 |  -40.1308          0          0 
          c5 |  -44.0648          0          0 
          c6 |  -44.4595          0          0 
          c7 |  -46.9111          0          0 
          c8 |  -50.5274          0          0 
          c9 |  -52.1505          0          0 
         c10 |  -52.6827          0          0 
         c11 |   -53.186          0          0 


Joint std. p-value (entire post-treatment)  =	 0 // Perfect 


*| Robustness Check 4 - Latin American Only
*| -- Drop VDEM 3 and ICRG as predictors 


Loss: Root Mean Squared Prediction Error

---------------------
   RMSPE |  2.097512   // Larger RMPSE, but expected 
---------------------
------------------------------------------------------------------------------------------------------------
Unit Weights:

------------------------
     Co_No | Unit_Weight
-----------+------------
    Brazil |           0
     Chile |           0
  Colombia |        .259
Costa Rica |        .562
 Guatemala |           0
    Mexico |           0
  Paraguay |           0
      Peru |        .179
   Uruguay |           0
------------------------
------------------------------------------------------------------------------------------------------------

Predictor Balance:

------------------------------------------------------
                               |   Treated  Synthetic 
-------------------------------+----------------------
                          WGI1 | -.0936463   .3783633 
                         VDEM2 |  89.64444   83.95973 
                       polity2 |  8.666667   8.472111 
                           EFW |  5.690285   5.813485 
                   VDEMy(1988) |      59.1    60.9865 
                   VDEMy(1991) |      62.6    64.4677 
                   VDEMy(1994) |      60.7    60.6185 
                   VDEMy(1997) |      60.9    60.8943 
------------------------------------------------------


Post-treatment results: Effects, p-values, standardized p-values

             | estimates      pvals  pvals_std 
-------------+--------------------------------
          c1 | -2.273099   .7777778          0 
          c2 |  -15.6436   .1111111          0 
          c3 |    -30.96          0          0 
          c4 |   -40.254          0          0 
          c5 |  -45.1584          0          0 
          c6 |  -46.2077          0          0 
          c7 |  -48.9033          0          0 
          c8 |  -52.6482          0          0 
          c9 |  -54.3467          0          0 
         c10 |  -54.8237          0          0 
         c11 |  -55.4248          0          0 


Joint std. p-value (entire post-treatment)  =	 0 // Perfect 



 