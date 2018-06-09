#reading data
#similar=read.table("E:/New Volume/Users/user/Desktop/exp/dump.txt",header=F)
library(data.table)
?fread
similar=fread("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/ConsoleApplication1/ConsoleApplication1/dump.txt",header=F, skip=" ")
similar[1:5,1:3]
test=read.table("E:/New Volume/Users/user/Desktop/exp/testdata1.txt",header=F)
test$V4=NULL
max(test$V2)
test[1:3,1:3]
x=test$V1
V1=x-1
y=test$V2
V2=y-1
V1[1:3]
x[1:3]
V2[1:4]
test1=cbind(V1,V2)
test1[1:3,]
z=test$V3
z[1:3]
test1=cbind(V1,V2,z)
test1[1:3,]
similar[1:3,]
library(data.table)
test1=data.table(test1,key=c("V1","V2"))
similar=data.table(similar,key=c("V1","V2"))
Final <- test1[similar, nomatch=0]
Final$V4=ifelse(Final$V3>5,5,Final$V3) 
Final$V5=ifelse(Final$V3<1,1,Final$V4)
Final[1:30,]
Final$MAE=abs(Final$z-Final$V5)
mean(Final$MAE)
Final$MSE=Final$MAE*Final$MAE
RMSE1=(mean(Final$MSE))
RMSE=sqrt(RMSE1)
#################################multinomial logistic model############
library(VGAM)
vglmFitMN <- vglm(z ~ V3.x+V3.y, family=multinomial, data=train)
summary(vglmFitMN)
exp(coef(vglmFitMN))
str(vglmFitMN)
prediction=predict(vglmFitMN,data=train,type="response")
prediction=predict(vglmFitMN,newdata=test,type="response")
fit=fitted(vglmFitMN,newdata=test)
##########order logistic model##############
require(foreign)
require(ggplot2)
require(MASS)
require(Hmisc)
require(reshape2)
library(MASS)
m <- polr(as.factor(z) ~ V3.x+V3.y, data = train)
prediction=predict(m,newdata=test,type="probs")
write.table(prediction,row.names=FALSE,col.names=FALSE, "E:/pred.txt", sep="\t")
data=read.table("E:/pred.txt")
Final=cbind(data,test)
##############testing################
test3=read.table("E:/New Volume/Users/user/Desktop/exp/u1.txt",header=F)
test2[1:3,1:3]
x=test3$V1
V1=x-1
y=test3$V2
V2=y-1
V1[1:3]
x1[1:3]
V2[1:4]
test2=cbind(V1,V2)
test2[1:3,]
z=test3$V3
z[1:3]
test2=cbind(V1,V2,z)
test2[1:3,]
similar[1:3,]
test<- merge(test2,similar,by=c("V1","V2"))
test=merge(test,similar1,by=c("V1","V2"))
test[1:3,]
lm_fit
similar2=0.3393+  0.6424*similar$V3+0.2658*similar1$V3
dataframe=data.frame(similar$V1,similar$V2,similar2)
names(dataframe)[1:2] <- paste("V", 1:2, sep="")
Final<- merge(test1,dataframe,by=c("V1","V2"))
predictions<-predict(fit,newdata=newdata1)
error<-sqrt((sum((testing$z-predictions)^2))/nrow(testing))
###########random forest#############
library(e1071)
rf_fit<-randomForest(y~x1+x2+x3,data=training,ntree=500)
predictions<-predict(rf_fit,newdata=testing)
error<-sqrt((sum((testing$y-predictions)^2))/nrow(testing))
###############Baggging################
set.seed(10)
positions <- sample(nrow(train),size=floor((nrow(train)/4)*3))
training<- train[positions,]
testing<- train[-positions,]
lm_fit<-lm(z~V3.x+V3.y,data=train)
lm_fit
library(foreach)
length_divisor<-4
iterations<-1000
predictions<-foreach(m=1:iterations,.combine=cbind) %do% {
  training_positions <- sample(nrow(training), size=floor((nrow(training)/length_divisor)))
  train_pos<-1:nrow(training) %in% training_positions
  lm_fit<-lm(z~V3.x+V3.y,data=training[train_pos,])
  predict(lm_fit,newdata=testing)}
lm_fit
predictions<-rowMeans(predictions)
error<-sqrt((sum((testing$z-predictions)^2))/nrow(testing))
##############error calculation##############
error
Final$V4=ifelse(Final$similar2>5,5,Final$similar2) 
Final$V5=ifelse(Final$similar2<1,1,Final$V4)
Final[1:30,]
Final$MAE=abs(Final$z-Final$V6)
Final$MAE=abs(Final$z-Final$V8)
mean(Final$MAE)
Final$MSE=Final$MAE*Final$MAE
RMSE1=(mean(Final$MSE))
RMSE=sqrt(RMSE1)
RMSE

