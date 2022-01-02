compute openness = (big5_7 + big5_8 + big5_9)/3.
compute conscientousness = (big_13+ (8 - big5_14_R) + big5_15) /3.
compute extraversion = (big5_4 + big5_5 + (8 - big5_6_R)) / 3.
compute agreeableness = ((8 - big5_10_R) + big5_11 + big5_12) / 3.
compute neuroticism = (big5_1 + big5_2 + (8-big5_3_R)) / 3.
execute.

GLM average_opinion BY gender
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /lmatrix 'Male vs. Female' gender 1 -1 0
  /lmatrix 'Male vs. Female + OTHER' gender 2 -1 -1
  /POSTHOC=gender(BONFERRONI) 
  /EMMEANS=TABLES(OVERALL) 
  /PRINT=ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=gender.


GLM average_opinion BY polid
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
   /lmatrix 'R vs. D' polid 1 -1 0 0 0
  /lmatrix 'R+D vs I+L' polid 1 1 -1 -1 0
  /lmatrix 'R vs D+I+L+O' polid 4 -1 -1 -1 -1
   /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(polid) 
  /CRITERIA=ALPHA(.05)
  /DESIGN=polid.


GLM average_opinion BY minutewatch
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
   /lmatrix '1,2,3 vs 4,5' minutewatch 1/3 1/3 1/3 -1/2 -1/2 0
   /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(minutewatch) 
  /CRITERIA=ALPHA(.05)
  /DESIGN=minutewatch.


GLM importance_views BY gender citizen
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /POSTHOC=gender(BONFERRONI) 
  /PLOT=PROFILE(gender*citizen)
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(gender) COMPARE ADJ(LSD)
  /EMMEANS=TABLES(citizen) COMPARE ADJ(LSD)
  /EMMEANS=TABLES(gender*citizen) 
  /PRINT=OPOWER ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=gender citizen gender*citizen.


GLM importance_views BY gender citizen
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /POSTHOC=gender(BONFERRONI) 
  /PLOT=PROFILE(gender*citizen)
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(gender) COMPARE 
  /EMMEANS=TABLES(citizen) COMPARE 
  /EMMEANS=TABLES(gender*citizen) compare(gender) adj(bonf)
  /PRINT=OPOWER ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=gender citizen gender*citizen.

GLM average_opinion BY minutewatch educ
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /POSTHOC=minutewatch educ(BONFERRONI) 
  /PLOT=PROFILE(minutewatch*educ)
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(minutewatch) 
  /EMMEANS=TABLES(educ) 
  /EMMEANS=TABLES(minutewatch*educ) compare(educ) adj(bonf)
  /PRINT=OPOWER ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=minutewatch educ minutewatch*educ.
