time=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_time/new_dump2.txt",header=F)
daytype<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_daytype/new_dump2.txt",header=F)
season<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_season/new_dump2.txt",header=F)
location<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_location/new_dump2.txt",header=F)
weather<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_weather/new_dump2.txt",header=F)
social<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_social/new_dump2.txt",header=F)
endemo<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_emo/new_dump2.txt",header=F)
dominant<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_dominant/new_dump2.txt",header=F)
mood<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_mood/new_dump2.txt",header=F)
physical<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_physical/new_dump2.txt",header=F)
decision<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_decision/new_dump2.txt",header=F)
interaction<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_interaction/new_dump2.txt",header=F)
##################################################################################
ttime=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_time/train2.txt",header=F)
tdaytype<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_daytype/train2.txt",header=F)
tseason<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_season/train2.txt",header=F)
tlocation<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_location/train2.txt",header=F)
tweather<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_weather/train2.txt",header=F)
tsocial<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_social/train2.txt",header=F)
tendemo<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_emo/train2.txt",header=F)
tdominant<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_dominant/train2.txt",header=F)
tmood<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_mood/train2.txt",header=F)
tphysical<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_physical/train2.txt",header=F)
tdecision<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_decision/train2.txt",header=F)
tinteraction<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_interaction/train2.txt",header=F)
##################################################################################################################################
ttime$V1<-ttime$V1-1
ttime$V2<-ttime$V2-1
tdaytype$V1<-tdaytype$V1-1
tdaytype$V2<-tdaytype$V2-1
tseason$V1<-tseason$V1-1
tseason$V2<-tseason$V2-1
tlocation$V2<-tlocation$V2-1
tlocation$V1<-tlocation$V1-1
tweather$V2<-tweather$V2-1
tweather$V1<-tweather$V1-1
tsocial$V1<-tsocial$V1-1
tsocial$V2<-tsocial$V2-1
tendemo$V1<-tendemo$V1-1
tendemo$V2<-tendemo$V2-1
tdominant$V2<-tdominant$V2-1
tdominant$V1<-tdominant$V1-1
tphysical$V2<-tphysical$V2-1
tphysical$V1<-tphysical$V1-1
tmood$V1<-tmood$V1-1
tmood$V2<-tmood$V2-1
tdecision$V2<-tdecision$V2-1
tdecision$V1<-tdecision$V1-1
tinteraction$V1<-tinteraction$V1-1
tinteraction$V2<-tinteraction$V2-1

library(data.table)
time=data.table(time,key=c("V1","V2","V3"))
ttime=data.table(ttime,key=c("V1","V2","V4"))
trtime<-ttime[time,nomatch=0]
colnames(trtime)[5] <- "time"
daytype=data.table(daytype,key=c("V1","V2","V3"))
tdaytype=data.table(tdaytype,key=c("V1","V2","V4"))
trdaytype<-tdaytype[daytype,nomatch=0]
colnames(trdaytype)[5] <- "daytype"
#season=data.table(season,key=c("V1","V2"))
#ttime=data.table(ttime,key=c("V1","V2"))
#trseason<-ttime[season,nomatch=0]
#colnames(trseason)[5] <- "season"
location=data.table(location,key=c("V1","V2","V3"))
tlocation=data.table(tlocation,key=c("V1","V2","V4"))
trlocation<-tlocation[location,nomatch=0]
colnames(trlocation)[5] <- "location"
weather=data.table(weather,key=c("V1","V2","V3"))
tweather=data.table(tweather,key=c("V1","V2","V4"))
trweather<-tweather[weather,nomatch=0]
colnames(trweather)[5] <- "weather"
social=data.table(social,key=c("V1","V2","V3"))
tsocial=data.table(tsocial,key=c("V1","V2","V4"))
trsocial<-tsocial[social,nomatch=0]
colnames(trsocial)[5] <- "social"
endemo=data.table(endemo,key=c("V1","V2","V3"))
tendemo=data.table(tendemo,key=c("V1","V2","V4"))
trendemo<-tendemo[endemo,nomatch=0]
colnames(trendemo)[5] <- "endemo"
dominant=data.table(dominant,key=c("V1","V2","V3"))
tdominant=data.table(tdominant,key=c("V1","V2","V4"))
trdominant<-tdominant[dominant,nomatch=0]
colnames(trdominant)[5] <- "dominant"
mood=data.table(mood,key=c("V1","V2","V3"))
tmood=data.table(tmood,key=c("V1","V2","V4"))
trmood<-tmood[mood,nomatch=0]
colnames(trmood)[5] <- "mood"
physical=data.table(physical,key=c("V1","V2","V3"))
tphysical=data.table(tphysical,key=c("V1","V2","V4"))
trphysical<-tphysical[physical,nomatch=0]
colnames(trphysical)[5] <- "physical"
decision=data.table(decision,key=c("V1","V2","V3"))
tdecision=data.table(tdecision,key=c("V1","V2","V4"))
trdecision<-tdecision[decision,nomatch=0]
colnames(trdecision)[5] <- "decision"
#interaction=data.table(interaction,key=c("V1","V2","V3"))
#tinteraction=data.table(tinteraction,key=c("V1","V2","V4"))
#trinteraction<-tinteraction[interaction,nomatch=0]
#colnames(trinteraction)[5] <- "interaction"
#################################################################################
ridge<-as.data.frame(cbind(trtime$time,trdaytype$daytype,trlocation$location,trweather$weather,trsocial$social,trendemo$endemo,trdominant$dominant,trmood$mood,trphysical$physical,trdecision$decision,trtime$V3))
#ridge=ridge[1:100,]
library(ridge)
library(glmnet)
x <- as.matrix(ridge[,1:10])
y <- as.matrix(ridge[,11])
reg<-glmnet(x,y, lambda=0.5)
#write.table(ridge,row.names=F,col.names=T,"C:/Users/bip/Desktop/CBRS/ridge.txt",sep="\t")
############################################################################################################
ttime=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_time/test2.txt",header=F)
tdaytype<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_daytype/test2.txt",header=F)
tseason<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_season/test2.txt",header=F)
tlocation<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_location/test2.txt",header=F)
tweather<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_weather/test2.txt",header=F)
tsocial<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_social/test2.txt",header=F)
tendemo<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_emo/test2.txt",header=F)
tdominant<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_dominant/test2.txt",header=F)
tmood<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_mood/test2.txt",header=F)
tphysical<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_physical/test2.txt",header=F)
tdecision<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_decision/test2.txt",header=F)
tinteraction<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_interaction/test2.txt",header=F)
##############################################################################################3##############3#######
ttime$V1<-ttime$V1-1
ttime$V2<-ttime$V2-1
tdaytype$V1<-tdaytype$V1-1
tdaytype$V2<-tdaytype$V2-1
tseason$V1<-tseason$V1-1
tseason$V2<-tseason$V2-1
tlocation$V2<-tlocation$V2-1
tlocation$V1<-tlocation$V1-1
tweather$V2<-tweather$V2-1
tweather$V1<-tweather$V1-1
tsocial$V1<-tsocial$V1-1
tsocial$V2<-tsocial$V2-1
tendemo$V1<-tendemo$V1-1
tendemo$V2<-tendemo$V2-1
tdominant$V2<-tdominant$V2-1
tdominant$V1<-tdominant$V1-1
tphysical$V2<-tphysical$V2-1
tphysical$V1<-tphysical$V1-1
tmood$V1<-tmood$V1-1
tmood$V2<-tmood$V2-1
tdecision$V2<-tdecision$V2-1
tdecision$V1<-tdecision$V1-1
tinteraction$V1<-tinteraction$V1-1
tinteraction$V2<-tinteraction$V2-1

library(data.table)
time=data.table(time,key=c("V1","V2","V3"))
ttime=data.table(ttime,key=c("V1","V2","V4"))
trtime<-ttime[time,nomatch=0]
colnames(trtime)[5] <- "time"
daytype=data.table(daytype,key=c("V1","V2","V3"))
tdaytype=data.table(tdaytype,key=c("V1","V2","V4"))
trdaytype<-tdaytype[daytype,nomatch=0]
colnames(trdaytype)[5] <- "daytype"
#season=data.table(season,key=c("V1","V2"))
#ttime=data.table(ttime,key=c("V1","V2"))
#trseason<-ttime[season,nomatch=0]
#colnames(trseason)[5] <- "season"
location=data.table(location,key=c("V1","V2","V3"))
tlocation=data.table(tlocation,key=c("V1","V2","V4"))
trlocation<-tlocation[location,nomatch=0]
colnames(trlocation)[5] <- "location"
weather=data.table(weather,key=c("V1","V2","V3"))
tweather=data.table(tweather,key=c("V1","V2","V4"))
trweather<-tweather[weather,nomatch=0]
colnames(trweather)[5] <- "weather"
social=data.table(social,key=c("V1","V2","V3"))
tsocial=data.table(tsocial,key=c("V1","V2","V4"))
trsocial<-tsocial[social,nomatch=0]
colnames(trsocial)[5] <- "social"
endemo=data.table(endemo,key=c("V1","V2","V3"))
tendemo=data.table(tendemo,key=c("V1","V2","V4"))
trendemo<-tendemo[endemo,nomatch=0]
colnames(trendemo)[5] <- "endemo"
dominant=data.table(dominant,key=c("V1","V2","V3"))
tdominant=data.table(tdominant,key=c("V1","V2","V4"))
trdominant<-tdominant[dominant,nomatch=0]
colnames(trdominant)[5] <- "dominant"
mood=data.table(mood,key=c("V1","V2","V3"))
tmood=data.table(tmood,key=c("V1","V2","V4"))
trmood<-tmood[mood,nomatch=0]
colnames(trmood)[5] <- "mood"
physical=data.table(physical,key=c("V1","V2","V3"))
tphysical=data.table(tphysical,key=c("V1","V2","V4"))
trphysical<-tphysical[physical,nomatch=0]
colnames(trphysical)[5] <- "physical"
decision=data.table(decision,key=c("V1","V2","V3"))
tdecision=data.table(tdecision,key=c("V1","V2","V4"))
trdecision<-tdecision[decision,nomatch=0]
colnames(trdecision)[5] <- "decision"
#interaction=data.table(interaction,key=c("V1","V2","V3"))
#tinteraction=data.table(tinteraction,key=c("V1","V2","V4"))
#trinteraction<-tinteraction[interaction,nomatch=0]
#colnames(trinteraction)[5] <- "interaction"
#############################################################################################################################################################################################################################
trtime$MAE<-abs(trtime$time-trtime$V3)
MAE_time<-mean(trtime$MAE)
trtime$RMSE<-trtime$MAE*trtime$MAE
RMSE_time<-sqrt(mean(trtime$RMSE))
trdaytype$MAE<-abs(trdaytype$daytype-trdaytype$V3)
MAE_daytype<-mean(trdaytype$MAE)
trdaytype$RMSE<-trdaytype$MAE*trdaytype$MAE
RMSE_daytype<-sqrt(mean(trdaytype$RMSE))
trlocation$MAE<-abs(trlocation$location-trlocation$V3)
MAE_location<-mean(trlocation$MAE)
trlocation$RMSE<-trlocation$MAE*trlocation$MAE
RMSE_location<-sqrt(mean(trlocation$RMSE))  
trweather$MAE<-abs(trweather$weather-trweather$V3)
MAE_weather<-mean(trweather$MAE)
trweather$RMSE<-trweather$MAE*trweather$MAE
RMSE_weather<-sqrt(mean(trweather$RMSE))  
trsocial$MAE<-abs(trsocial$social-trsocial$V3)
MAE_social<-mean(trsocial$MAE)
trsocial$RMSE<-trsocial$MAE*trsocial$MAE
RMSE_social<-sqrt(mean(trsocial$RMSE))
trendemo$MAE<-abs(trendemo$endemo-trendemo$V3)
MAE_endemo<-mean(trendemo$MAE)
trendemo$RMSE<-trendemo$MAE*trendemo$MAE
RMSE_endemo<-sqrt(mean(trendemo$RMSE))
trdominant$MAE<-abs(trdominant$dominant-trdominant$V3)
MAE_dominant<-mean(trdominant$MAE)
trdominant$RMSE<-trdominant$MAE*trdominant$MAE
RMSE_dominant<-sqrt(mean(trdominant$RMSE))
trmood$MAE<-abs(trmood$mood-trmood$V3)
MAE_mood<-mean(trmood$MAE)
trmood$RMSE<-trmood$MAE*trmood$MAE
RMSE_mood<-sqrt(mean(trmood$RMSE))
trphysical$MAE<-abs(trphysical$physical-trphysical$V3)
MAE_physical<-mean(trphysical$MAE)
trphysical$RMSE<-trphysical$MAE*trphysical$MAE
RMSE_physical<-sqrt(mean(trphysical$RMSE))
trdecision$MAE<-abs(trdecision$decision-trdecision$V3)
MAE_decision<-mean(trdecision$MAE)
trdecision$RMSE<-trdecision$MAE*trdecision$MAE
RMSE_decision<-sqrt(mean(trdecision$RMSE))
#######################################################################
ridge1<-as.data.frame(cbind(trtime$time,trdaytype$daytype,trlocation$location,trweather$weather,trsocial$social,trendemo$endemo,trdominant$dominant,trmood$mood,trphysical$physical,trdecision$decision,trtime$V3))
a=ridge1$V11
ridge1$V11=NULL
ridge1$pred=rowMeans(ridge1)
ridge1<-cbind(ridge1,a)
ridge1$MAE=abs(ridge1$a-ridge1$pred)
MAE=mean(ridge1$MAE)
ridge1$MSE=ridge1$MAE*ridge1$MAE
RMSE=(mean(ridge1$MSE))
RMSE=sqrt(RMSE)

x <- as.matrix(ridge1[,1:10])
pred<-predict(reg,x)
pred<-data.frame(pred,a)
pred$MAE=abs(pred$a-pred$s0)
MAE2=mean(pred$MAE)
pred$MSE=pred$MAE*pred$MAE
RMSE1=mean(pred$MSE)
RMSE1=sqrt(RMSE1)
#######################################################################
b<-rbind(MAE_time,MAE_daytype,MAE_location,MAE_weather,MAE_social,MAE_endemo,MAE_dominant,MAE_mood,MAE_physical,MAE_decision,MAE,MAE2)
c<-rbind(RMSE_time,RMSE_daytype,RMSE_location,RMSE_weather,RMSE_social,RMSE_endemo,RMSE_dominant,RMSE_mood,RMSE_physical,RMSE_decision,RMSE,RMSE1)
fold1<-cbind(b,c)