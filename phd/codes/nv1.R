sum#reading data
#similar=read.table("E:/New Volume/Users/user/Desktop/exp/dump.txt",header=F)
library(data.table)
#similar=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/lb/lb/dump.txt",header=F, skip=" ")
similar=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/new_dump.txt",header=F)
similar<-subset(similar,similar$V3!=-1.00000)
test=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/cod_daytype/test2.txt",header=F)
x=test$V1
V1=x-1
y=test$V2
V2=y-1
V1[1:3]
x[1:3]
V2[1:4]
V3=test$V4
test1=cbind(V1,V2,V3)
test1[1:3,]
z=test$V3
z[1:3]
test1=cbind(V1,V2,V3,z)
test1[1:3,]
similar[1:3,]
library(data.table)
test1=data.table(test1,key=c("V1","V2","V3"))
similar=data.table(similar,key=c("V1","V2","V3"))
Final <- test1[similar, nomatch=0]
Final1<-Final
Final2<-Final
Final3<-Final
Final4<-Final
Final5<-Final
Final$V4<-NULL
Final$V5<-NULL
Final$V6<-NULL
Final$MAE<-NULL
Final$MSE<-NULL
Final1<-cbind(Final2$V4,Final3$V4,Final4$V4,Final5$V4)
Final1<-as.data.frame(Final1)
Final1$V5<-(Final1$V1+Final1$V2+Final$V3+Final$V4)/4
Final$V4<-Final1$V5

Final$V5=ifelse(Final$V4>5,5,Final$V4) 
Final$V6=ifelse(Final$V4<1,1,Final$V5)
Final$MAE=abs(Final$z-Final$V6)
MAE=mean(Final$MAE)
Final$MSE=Final$MAE*Final$MAE
RMSE1=(mean(Final$MSE))
RMSE=sqrt(RMSE1)
###################################################
library(data.table)
data=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/personality/personality/dump.txt",header=F,sep='\t')
data=data.table(data,key=c("V1","V2"))
similar=data.table(similar,key=c("V1","V2"))
prec <- similar[data, nomatch=0]
prec=prec[order(V1,-V3),]
prec1 <- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 5, ] 
prec1$V4=ifelse(prec1$i.V3>3,1,0) 
precision_5=mean(prec1$V4)
data$V4=ifelse(data$V3>3,1,0)
recall_5=nrow(prec1)/sum(data$V4)
prec2 <- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 10, ] 
prec2$V4=ifelse(prec2$i.V3>3,1,0) 
precision_10=mean(prec2$V4)
data$V4=ifelse(data$V3>3,1,0)
recall_10=nrow(prec2)/sum(data$V4)
coverage=nrow(Final)/nrow(test)
#########################################
