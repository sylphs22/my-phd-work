#########sparsty level5######################
 ####MAE and RMSE
MAE_CF<-c(0.741086806,0.738620169,0.709289196,0.746288662,0.7462744)
MAE_values<-c(0.711820684,0.715642431,0.715193929,0.714591774,0.700627272)
t_5<-(t.test(MAE_CF,MAE_values, paired=TRUE,alt="less"))
cat("\n\n", file = "tests.txt", append = TRUE)
# export t-test output
cat("T-Test_5\n", file = "tests.txt", append = TRUE)
capture.output(t_5, file = "tests.txt", append = TRUE)

RMSE_CF<-c(1.012792119,0.99134818,0.958006233,0.998632841,0.998631834)
RMSE_values<-c(0.952043625,0.962307998,0.954429101,0.964981773,0.953146223)
T_5<-t.test(RMSE_CF,RMSE_values, paired=TRUE,alt="less")
cat("\n\n", file = "tests.txt", append = TRUE)
# export t-test output
cat("T-Test_5\n", file = "tests.txt", append = TRUE)
capture.output(T_5, file = "tests.txt", append = TRUE)

#####################sparsity level 10#####################
####MAE and RMSE
MAE_CF<-c(0.67435657,0.686269747,0.677466828,0.656849127,0.685870329)
MAE_values<-c(0.669827553,0.669962325,0.669637406,0.668615768,0.66317479)
t_10<-(t.test(MAE_CF,MAE_values, paired=TRUE,alt="less"))
cat("\n\n", file = "tests.txt", append = TRUE)
# export t-test output
cat("T-Test_10\n", file = "tests.txt", append = TRUE)
capture.output(t_10, file = "tests.txt", append = TRUE)

RMSE_CF<-c(0.908945487,0.926097668,0.89879634,0.866613389,0.925274381)
RMSE_values<-c(0.895914014,0.89274559,0.88919976,0.892706058,0.882246418)
T_10<-t.test(RMSE_CF,RMSE_values, paired=TRUE,alt="less")
cat("\n\n", file = "tests.txt", append = TRUE)
# export t-test output
cat("T-Test_10\n", file = "tests.txt", append = TRUE)
capture.output(T_10, file = "tests.txt", append = TRUE)
#####################sparsity level 15#####################
####MAE and RMSE
MAE_CF<-c(0.674930803,0.669197273,0.635944476,0.647350512,0.644704204)
MAE_values<-c(0.640701084,0.653418616,0.648523371,0.670301954,0.665362718)
t_15<-(t.test(MAE_CF,MAE_values, paired=TRUE,alt="less"))
cat("\n\n", file = "tests.txt", append = TRUE)
# export t-test output
cat("T-Test_15\n", file = "tests.txt", append = TRUE)
capture.output(t_15, file = "tests.txt", append = TRUE)

cat("\n\n", file = "tests.txt", append = TRUE)
# export t-test output
cat("T-Test_15\n", file = "tests.txt", append = TRUE)
capture.output(T_15, file = "tests.txt", append = TRUE)
#####################sparsity level 20#####################
####MAE and RMSE
MAE_CF<-c(0.648106904,0.662817552,0.679569892,0.633474576,0.663669852)
MAE_values<-c(0.650862069,0.64494382,0.645788337,0.662763466,0.668981481)
t_20<-(t.test(MAE_CF,MAE_values, paired=TRUE,alt="less"))
cat("\n\n", file = "tests.txt", append = TRUE)
# export t-test output
cat("T-Test_20\n", file = "tests.txt", append = TRUE)
capture.output(t_20, file = "tests.txt", append = TRUE)

RMSE_CF<-c(0.648106904,0.662817552,0.679569892,0.633474576,0.663669852)
RMSE_values<-c(0.650862069,0.64494382,0.645788337,0.662763466,0.668981481)
T_20<-t.test(RMSE_CF,RMSE_values, paired=TRUE,alt="less")
cat("\n\n", file = "tests.txt", append = TRUE)
# export t-test output
cat("T-Test_20\n", file = "tests.txt", append = TRUE)
capture.output(T_20, file = "tests.txt", append = TRUE)
#####################sparsity level 2#####################
####MAE and RMSE
MAE_CF<-c(1.03670117,1.03670117,1.03670117,1.03670117,1.03670117)
MAE_values<-c(0.842336225,0.895693186,0.90054031,0.849196799,0.843433252)
t_2<-(t.test(MAE_CF,MAE_values, paired=TRUE,alt="less"))
cat("\n\n", file = "tests.txt", append = TRUE)
# export t-test output
cat("T-Test_2\n", file = "tests.txt", append = TRUE)
capture.output(t_2, file = "tests.txt", append = TRUE)

RMSE_CF<-c(1.305145056,1.305145056,1.305145056,1.305145056,1.305145056)
RMSE_values<-c(1.115761121,1.149865383,1.172477941,1.12062126,1.124698476)
T_2<-t.test(RMSE_CF,RMSE_values, paired=TRUE,alt="less")
cat("\n\n", file = "tests.txt", append = TRUE)
# export t-test output
cat("T-Test_2\n", file = "tests.txt", append = TRUE)
capture.output(T_2, file = "tests.txt", append = TRUE)
