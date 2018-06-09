data=read.csv("C:/Users/bip/Desktop/Cricket_Train_dataset_sir_v3_onlysheet_discarded_csv_v2.csv",header=T)
library(dplyr)
dpl=filter(data,Innings == "1")
dpl$score <- ave(dpl$Total.Runs,dpl$MatchNo,FUN=max)
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
dpl$runrate<-ave(dpl$Run.Rate,dpl$MatchNo,FUN=function(x) shift(x,-1))
dpl$out<-ave(dpl$Wickets.fallen,dpl$MatchNo,FUN=function(x) shift(x,-1))
dpl$tot<-ave(dpl$Total.Runs,dpl$MatchNo,FUN=function(x) shift(x,-1))
dpl$venueavg=ave(dpl$score,dpl$Venue,FUN=mean)

dpl1<- subset(dpl, dpl$Over>=20)
str(dpl1)
summary=summary(fit)
forml=lm(score~runrate+tot+out+BattingTeam+Bowling.Team +Venue+Strike.rate.of.last.few.balls+
  Batsman_strikerate+Balls+venueavg)
fit <- step(fit,data=dpl1,direction="both")
            
fit=lm(forml,data=dpl1)
newd=predict(fit,newdata=dpl1)
dpl2 <- cbind(dpl1, newd)
dpl2$MAE=abs(dpl2$newd-dpl2$score)
mean(dpl2$MAE)
RMSE=sqrt(mean(dpl2$MAE*dpl2$MAE))
mean(dpl2$MAE)
sink(file="summary_logit.txt") 
summary(logit) 
sink(NULL)
forml=score~runrate+tot+out+Recent.Score.last.5.match.+Strike.rate.of.last.few.balls+Partnership.lag.+bowling.team.economy+Bowling.team.wickets.taken+
  Bowling.Team.runs.conceded+Bowler.Strike.Rate +Bowler.Economy+Batsman_strikerate+Batsman_average+Per_Ball_runs_model
  factor(Venue)+factor(BattingTeam)+factor(Bowling.Team)

write.csv(,row.names=FALSE,col.names=T, "E:/train.csv", sep="\t")
library(leaps)
library(MASS)
fit <- step(lm(forml,data=dpl1,direction="both")
step <- stepAIC(fit, direction="both")
fit

fit<-regsubsets(forml,data=dpl1,nbest=1)
summary(fit)
##############test data##############
data=read.csv("C:/Users/bip/Desktop/Cricket_Test_Dataset_v1_discarded_csv_v3.csv",header=T)
library(dplyr)
dpl=filter(data,Innings == "1")
dpl$score <- ave(dpl$Total.Runs,dpl$MatchNo,FUN=max)
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
dpl$runrate<-ave(dpl$Run.Rate,dpl$MatchNo,FUN=function(x) shift(x,-1))
dpl$out<-ave(dpl$Wickets.fallen,dpl$MatchNo,FUN=function(x) shift(x,-1))
dpl$tot<-ave(dpl$Total.Runs,dpl$MatchNo,FUN=function(x) shift(x,-1))
dpl1<- subset(dpl, dpl$Over>=20)
predictions<-predict(fit,newdata=dpl1)
dpl2 <- cbind(dpl1, predictions)
dpl2$MAE=abs(dpl2$predictions-dpl2$score)
mean(dpl2$MAE)
RMSE=sqrt(mean(dpl2$MAE*dpl2$MAE))
mean(dpl2$MAE)
*******************************probabilitytestimation******************
train= filter(data,Innings == "2") 
train$battingteam=as.numeric(2)
train$n=(train$battingteam-train$WonBy)
train$result=ifelse(train$n==1,0,1)

