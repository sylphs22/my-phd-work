time=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_time/new_dump1.txt",header=F)
daytype<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_daytype/new_dump1.txt",header=F)
season<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_season/new_dump1.txt",header=F)
location<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_location/new_dump1.txt",header=F)
weather<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_weather/new_dump1.txt",header=F)
social<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_social/new_dump1.txt",header=F)
endemo<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_emo/new_dump1.txt",header=F)
dominant<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_dominant/new_dump1.txt",header=F)
mood<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_mood/new_dump1.txt",header=F)
physical<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_physical/new_dump1.txt",header=F)
decision<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_decision/new_dump1.txt",header=F)
interaction<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_interaction/new_dump1.txt",header=F)
##################################################################################
ttime=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_time/train1.txt",header=F)
tdaytype<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_daytype/train1.txt",header=F)
tseason<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_season/train1.txt",header=F)
tlocation<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_location/train1.txt",header=F)
tweather<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_weather/train1.txt",header=F)
tsocial<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_social/train1.txt",header=F)
tendemo<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_emo/train1.txt",header=F)
tdominant<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_dominant/train1.txt",header=F)
tmood<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_mood/train1.txt",header=F)
tphysical<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_physical/train1.txt",header=F)
tdecision<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_decision/train1.txt",header=F)
tinteraction<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_interaction/train1.txt",header=F)
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
ridge<-as.data.frame(cbind(trtime$V3,trtime$time,trdaytype$daytype,trlocation$location,trweather$weather,trsocial$social,trendemo$endemo,trdominant$dominant,trmood$mood,trphysical$physical,trdecision$decision))
library(ridge)
reg<-lm(V1~ ., data=as.data.frame(ridge))
write.table(ridge,row.names=F,col.names=T,"C:/Users/bip/Desktop/CBRS/ridge.txt",sep="\t")
################################################################################
ttime=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_time/test1.txt",header=F)
tdaytype<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_daytype/test1.txt",header=F)
tseason<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_season/test1.txt",header=F)
tlocation<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_location/test1.txt",header=F)
tweather<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_weather/test1.txt",header=F)
tsocial<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_social/test1.txt",header=F)
tendemo<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_emo/test1.txt",header=F)
tdominant<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_dominant/test1.txt",header=F)
tmood<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_mood/test1.txt",header=F)
tphysical<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_physical/test1.txt",header=F)
tdecision<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_decision/test1.txt",header=F)
tinteraction<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_interaction/test1.txt",header=F)
##############################################################################################3##############3#######
ridge1<-as.data.frame(cbind(trtime$V3,trtime$time,trdaytype$daytype,trlocation$location,trweather$weather,trsocial$social,trendemo$endemo,trdominant$dominant,trmood$mood,trphysical$physical,trdecision$decision))
ridge1$V1=NULL
a=ridge1$V1
pred<-predict(reg,as.data.frame((ridge1)))
pred<-data.frame(pred,a)
pred$MAE=abs(pred$a-pred$pred)
MAE=mean(pred$MAE)
pred$MSE=pred$MAE*pred$MAE
RMSE1=(mean(pred$MSE))
RMSE=sqrt(RMSE1)