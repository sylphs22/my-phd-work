data1=read.csv("C:/Users/bip/Desktop/DPL Datasets & Problem statements/Cricket_Craze_Problem/Cricket_Craze_Problem/Cricket_Test_Dataset.csv",header=T,)
data=read.csv("C:/Users/bip/Desktop/DPL Datasets & Problem statements/Cricket_Craze_Problem/Cricket_Craze_Problem/Cricket_Train_dataset.csv",header=T,)

#library(bigmemory.sri)
#library ( biglm )
#####################################################
library(dplyr)
newdata=filter(data,Innings == "1")
newdata$csum <- ave(newdata$Runs_Total, newdata$MatchNo, FUN=cumsum)
newdata$runrate=(newdata$csum/newdata$Balls)*6
newdata$w=ifelse(newdata$Wicket_kind=="",0,1)
newdata$wicket=ave(newdata$w, newdata$MatchNo, FUN=cumsum)
newdata$score <- ave(newdata$csum,newdata$MatchNo,FUN=max)
str(newdata)
shift<-function(x,shift_by){
  stopifnot(is.numeric(shift_by))
  stopifnot(is.numeric(x))
  
  if (length(shift_by)>1)
    return(sapply(shift_by,shift, x=x))
  
  out<-NULL
  abs_shift_by=abs(shift_by)
  if (shift_by > 0 )
    out<-c(tail(x,-abs_shift_by),rep(0,abs_shift_by))
  else if (shift_by < 0 )
    out<-c(rep(0,abs_shift_by), head(x,-abs_shift_by))
  else
    out<-x
  out
}
newdata$rrlag<- ave(newdata$runrate,newdata$MatchNo,FUN=function(x) shift(x,-1))
newdata$out<-ave(newdata$wicket,newdata$MatchNo,FUN=function(x) shift(x,-1))
newdata$tot<-ave(newdata$csum,newdata$MatchNo,FUN=function(x) shift(x,-1))
newdata$bowlingTeam<-ifelse(newdata$BattingTeam==as.character(newdata$Team1),as.character(newdata$Team2),as.character(newdata$Team1))
newdata$time=(as.Date(as.character(newdata$Date), format="%d-%m-%y")-as.Date(as.character("1/12/2014",format="%d/%m/%y")))
newdata$avg<-ave(newdata$score,newdata$BattingTeam,FUN=mean)
newdata$venueavg=ave(newdata$score,newdata$Venue,newdata$BattingTeam,FUN=mean)
newdata1<- subset(newdata, newdata$Over>=10)
library(leaps)
library(MASS)
forml=score~rrlag+avg+Balls+venueavg+Venue+BattingTeam+tot+bowlingTeam+out

fit=lm(forml,data=newdata1)
##layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page 
plot(fit)
library(cars)
newd=predict(fit,newdata1)
newdata <- cbind(newdata1, newd)
newdata$MAE=abs(newdata$newd-newdata$score)
mean(newdata$MAE)
RMSE=sqrt(mean(newdata$MAE*newdata$MAE))
str(fit)
************************************************************
forml=score~rrlag+tot+out+avg+Balls+factor(venueavg)+factor(BattingTeam)+factor(venueavg)+
  factor(bowlingTeam)+factor()
forml=score~rrlag+tot+out+avg+as.factor(BattingTeam)+as.factor(Venue)+as.factor(bowlingTeam)+time
***END**********************************
library(leaps)
fit_bss<-regsubsets(forml,data=newdata,nbest=1)
require(biglm)
library(biglm)
library(ffbase)
library(ff)
fit1=lm(formula=score~rrlag+tot+out+avg+time+as.factor(Venue)+as.factor(NonStriker)+as.factor(bowlingTeam)+as.factor(Batsman),data=newdata)
newd1=fit2$fitted.values
newd1=fit1$fitted.values
newdata$newd1=NULL
bigfit=score~rrlag+tot+out+avg+time+as.factor(Venue)+as.factor(NonStriker)+as.factor(bowlingTeam)+as.factor(BattingTeam)+as.factor(Bowler)+as.factor(Batsman)
fit2=biglm(formula=bigfit,data=newdata1,chunksize=100,sandwich=TRUE,family=gaussian())
***********************testdata**********
library(dplyr)
newdata1=filter(data1, Innings == "1")
newdata1$csum <- ave(newdata1$Runs_Total, newdata1$MatchNo, FUN=cumsum)
newdata1$runrate=(newdata1$csum/newdata1$Balls)*6
newdata1$w=ifelse(newdata1$Wicket_kind=="",0,1)
newdata1$wicket=ave(newdata1$w, newdata1$MatchNo, FUN=cumsum)
newdata1$score <- ave(newdata1$csum,newdata1$MatchNo,FUN=function(x) max(x, na.rm=TRUE))
shift<-function(x,shift_by){
  stopifnot(is.numeric(shift_by))
  stopifnot(is.numeric(x))
  
  if (length(shift_by)>1)
    return(sapply(shift_by,shift, x=x))
  
  out<-NULL
  abs_shift_by=abs(shift_by)
  if (shift_by > 0 )
    out<-c(tail(x,-abs_shift_by),rep(0,abs_shift_by))
  else if (shift_by < 0 )
    out<-c(rep(0,abs_shift_by), head(x,-abs_shift_by))
  else
    out<-x
  out
}
newdata1$rrlag<- ave(newdata1$runrate,newdata1$MatchNo,FUN=function(x) shift(x,-1))
newdata1$out<-ave(newdata1$wicket,newdata1$MatchNo,FUN=function(x) shift(x,-1))
newdata1$tot<-ave(newdata1$csum,newdata1$MatchNo,FUN=function(x) shift(x,-1))
newdata1$bowlingTeam<-ifelse(newdata1$BattingTeam==as.character(newdata1$Team1),as.character(newdata1$Team2),as.character(newdata1$Team1))
newdata1$time=(as.Date(as.character(newdata1$Date), format="%d-%m-%Y")-as.Date(as.character("1/12/2014",format="%d/%m/%Y")))
newdata1$avg<-ave(newdata1$score,newdata1$BattingTeam,FUN=mean)
newdata1$venueavg=ave(newdata1$score,newdata1$Venue,FUN=mean)
newdata1<- subset(newdata1, newdata1$Over>=20)
predictions<-predict(fit,newdata=newdata1)
library(MASS)
library(caret)
newdata1 <- cbind(newdata1, predictions)
newdata1$MAE=abs(newdata1$predictions-newdata1$score)
RMSE=sqrt(mean(newdata1$MAE*newdata1$MAE))
mean(newdata1$MAE)

********************
df=cbind(as.character(newdata$BattingTeam),newdata$avg)
colnames(df)=c("BattingTeam","avg")
library(plyr)
d1=as.data.frame(df)
d=as.data.frame(newdata1)
joined<-join(d,d1,by="BattingTeam")
*****************probability estimation**************###########$$$$$
training=filter(data, Innings == "2")
newdat=filter(data, Innings == "1")
newdat$csum <- ave(newdat$Runs_Total, newdat$MatchNo, FUN=cumsum)
training$csum <- ave(training$Runs_Total, training$MatchNo, FUN=cumsum)
train<-rbind(newdat,training)
train$totscore <- ave(train$Runs_Total,train$MatchNo,FUN=cumsum)
train1=filter(train, Innings == "2")
train1$RR<- ave(train1$totscore,train1$MatchNo,FUN=function(x) min(x, na.rm=TRUE))
train1$R=train1$RR-train1$csum
train1$extra=train1$Runs_Extras_Wides+train1$Runs_Extras_NoBall+train1$Runs_Extras_Byes
train1$ext=ave(train1$extra, train1$MatchNo, FUN=cumsum)
train1$RRR=ifelse(train1$extra==1,(train1$R/(300-train1$Balls)*6),(train1$R/((300+train1$ext)-train1$Balls)*6))
train1$w=ifelse(train1$Wicket_kind=="",0,1)
train1$wicket=ave(train1$w, train1$MatchNo, FUN=cumsum)
train1$CRR=(train1$csum/train1$Balls)*6
train1$max=ave(train1$csum,train1$MatchNo,FUN=function(x) max(x, na.rm=TRUE))
train1$time=(as.Date(as.character(train1$Date), format="%d-%m-%y")-as.Date(as.character("1/12/2014",format="%d/%m/%y")))
train1$avg<-ave(train1$max,train1$BattingTeam,FUN=mean)
train1$result=as.factor(ifelse(train1$RR>train1$max,0,1))
formula=result~CRR+wicket+R+csum+BattingTeam+avg
logit <- glm(result~CRR+wicket+R+csum+as.factor(Venue)+avg, data = train1, family = "binomial")
library(caret)
pred=predict(logit, train1,type="response")
train1$predict=ifelse(pred>0.5,1,0)
table(train1$predict, train1$result)

summary=summary(logit)
library(ISLR)

length(predict)
train1$predicts=predict(logit, newdata = train1)
confusionMatrix(predict, train1$result)
predict=predict(logit, train1,type="response")
train1 <- cbind(train1, predict)
train1<- subset(train1, train1$MatchNo==142)

#########################testdataprobabaility estimation##########
test=filter(data1, Innings == "2")
newdat1=filter(data1, Innings == "1")

newdat1$csum <- ave(newdat1$Runs_Total, newdat1$MatchNo, FUN=cumsum)
test$csum <- ave(test$Runs_Total, test$MatchNo, FUN=cumsum)
testing<-rbind(newdat1,test)
testing$totscore <- ave(testing$Runs_Total,testing$MatchNo,FUN=cumsum)
test1=filter(testing, Innings == "2")
test1$RR<- ave(test1$totscore,test1$MatchNo,FUN=function(x) min(x, na.rm=TRUE))
test1$R=test1$RR-test1$csum
test1$extra=test1$Runs_Extras_Wides+test1$Runs_Extras_NoBall+test1$Runs_Extras_Byes
test1$ext=ave(test1$extra, test1$MatchNo, FUN=cumsum)
test1$RRR=ifelse(test1$extra==1,(test1$R/(300-test1$Balls)*6),(test1$R/((300+test1$ext)-test1$Balls)*6))
test1$w=ifelse(test1$Wicket_kind=="",0,1)
test1$wicket=ave(test1$w, test1$MatchNo, FUN=cumsum)
test1$CRR=(test1$csum/test1$Balls)*6
test1$max=ave(test1$csum,test1$MatchNo,FUN=function(x) max(x, na.rm=TRUE))
test1$time=(as.Date(as.character(test1$Date), format="%d-%m-%Y")-as.Date(as.character("1/12/2014",format="%d/%m/%Y")))
test1$avg<-ave(test1$max,test1$BattingTeam,FUN=mean)
test1<- subset(test1, test1$Over>=20)
test1$result=as.factor(ifelse(test1$RR>test1$max,0,1))
pred=predict(logit, test1,type="response")
test1$predict=ifelse(pred>0.5,1,0)
table(test1$predict, test1$result)

//////////////CART********************

PP=round(predict(logit, test1,type="response"),4)
b=confusion.glm(test1,logit)
b
test1 <- cbind(test1,PP)
library(randomForest)
fitrf=randomForest(formula,data=train1)

////////////***************infographics*******************//////////////////////////////////////////////////////////////////////
info=rbind(data,data1)
info1=filter(info,Innings == "1")
info2=filter(info,Innings == "2")
info=rbind(info1,info2)

info$runTeam <- ave(info$Runs_Total, info$BattingTeam, FUN=sum)
info$wicketteam<-ave(info$w,info$bowlingTeam,Fun=sum)

info1$tot=ave(info1$run, info1$MatchNo, FUN=max)
info2$run <- ave(info2$Runs_Total, info2$MatchNo, FUN=sum)
info$matches=ifelse(info$MatchNo=="",0,1)
info$runs=ave(info$Runs_Total,info$MatchNo ,FUN=sum)
& info$Innings
info$w=ifelse(info$Wicket_kind==""  ,0,1)
info$w1=ifelse(info$Wicket_kind=="run out",1,0)
info$wicket=
info$bowler=ave(info$wicket,info$Bowler ,FUN=sum)
info$balls=ifelse(info$Balls=="",0,1)
info$bowlerballs=ave(info$balls,info$Bowler ,FUN=sum)
library(Lahman)


info$extra=info$Runs_Extras_Wides+info$Runs_Extras_NoBall+info$Runs_Extras_Byes+info$Runs_Extras_legbyes

info$totalrun=ave(info$Runs_Total,info$Batsman,info$MatchNo,FUN=cumsum)

info$bowlingTeam<-ifelse(info$BattingTeam==as.character(info$Team1),as.character(info$Team2),as.character(info$Team1))
info$wicket=ave(info$w,info$bowlingTeam,FUN=sum)
info=filter(info,=="obstructing the field")
info$bowl=ifelse(info$Wicket_kind=="run out",1,0)
info$batsman=ave(info$Runs_Batsman,info$Batsman,FUN=sum)
info$batbow=ave(info$bowl,info$Batsman,FUN=sum)
max(info$sumcaught)
info=subset(info,info$Balls==1)
info$max=ave(info$sumcaught,info$Wicket_Fielders,FUN=max)
max(data$MatchNo)
info=rbind(data1,data)
info1=filter(info, Innings == "1")
info1=as.(info1)
info2=filter(info, Innings == "2")
library(lubridate)
newdata$year=as.Date(newdata$Date, "%d-%m-%Y")
newdata$Year=year(newdata$year)
newdata$Date=NULL
data$Match_Type=NULL
newdata$Toss_Decision=NULL
newdata$Toss_winner=NULL

newdata$Team1=NULL
newdata$Team2=NULL

newdata$Batsman=NULL
newdata$Bowler=NULL
newdata$NonStriker=NULL
  newdata$Runs_Batsman=NULL
  newdata$Runs_Extras_Wides=NULL
  newdata$Runs_Extras_NoBall=NULL
  newdata$Runs_Extras_Byes=NULL
  newdata$Runs_Extras_legbyes=NULL
  newdata$Runs_Total=NULL
newdata$Wicket_kind=NULL
  newdata$Wicket_Fielders=NULL
  newdata$Player_out=NULL
  newdata$w=NULL
  newdata$year=NULL
df=cbind(train1$MatchNo,train1$result)
df1=cbind(test1$MatchNo,test1$result)
colnames(df1)=c("MatchNo","result")
info=merge(newdata,df1,by="MatchNo")
train$extra=train$Runs_Extras_Wides+train$Runs_Extras_NoBall+train$Runs_Extras_Byes
train$ext=ave(train$extra, train$MatchNo, FUN=cumsum)

  newdata$
  newdata$
  newdata$
train1$extra=ave(train1$ext, train1$MatchNo, FUN=max)
newdata=train
str(newdata)
train1$year=as.Date(train1$Date, "%d-%m-%Y")
train1$Year=year(train1$year)
info=rbind(info1,info2)
newdata$yR=ave(newdata$avg,newdata$Year,FUN=mean)
info1=cbind(as.character(newdata$Year),newdata$yR)
write.table(info,row.names=FALSE,col.names=T, "bowler.txt", sep="\t")
