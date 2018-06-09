#reading data
#similar=read.table("E:/New Volume/Users/user/Desktop/exp/dump.txt",header=F)
library(data.table)
#similar=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/svd/svd/dumpa/dump5.txt",header=F, skip=" ")

similar=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/lb/lb/dump amazon/dump5.txt",header=F, skip=" ")

#similar=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/dump.txt",header=F)
similar<-subset(similar,similar$V3!=-1.00000)
#test=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/test.txt",header=F)
test=read.table("C:/Users/bip/Desktop/thesis/data/amazon/test5.txt")
test$V4=NULL
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
Final$V5=ifelse(Final$V3<1,3,Final$V4)
Final$MAE=abs(Final$z-Final$V5)
MAE=mean(Final$MAE)
Final$MSE=Final$MAE*Final$MAE
RMSE1=(mean(Final$MSE))
RMSE=sqrt(RMSE1)
###################################################
library(data.table)
similar=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/novelty/novelty/dump.txt",header=F, skip=" ")
#similar=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/boolean/boolean/Similarity_dump.txt",header=F, skip=" ")
#data=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/personality/personality/dump.txt",header=F,sep='\t')
data<-read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u.data")
data1<-read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/novelty/novelty/similar.txt",header=F, skip=" ")
data$V4=NULL
data$V1=data$V1-1
data$V2=data$V2-1
data$V4<-ifelse(data$V3>4,1,0)
data$v5<-ave(data$V4,data$V2,FUN=sum)
data=data.table(data,key=c("V1","V2"))
similar=data.table(similar,key=c("V1","V2"))
prec <- similar[data, nomatch=0]
data1<-data.table(data1,key=c("V1","V2"))
prec<-data.table(prec,key=c("V1","V2"))
prec<-prec[data1,nomatch=0]
prec=prec[order(V1,-V3),]
prec1_2 <- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 5, ] 
fact1<-as.factor(prec1_2$V2)


write.csv(prec1_1,"E:/prec1_5.csv")
###########################################
prec1$V4=ifelse(prec1$i.V3>4,1,0) 
precision_5=mean(prec1$V4)
data$V4=ifelse(data$V3>4,1,0)
recall_5=sum(prec1$V4)/sum(data$V4)
prec2 <- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 10, ] 
prec2$V4=ifelse(prec2$i.V3>4,1,0) 
precision_10=mean(prec2$V4)
data$V4=ifelse(data$V3>4,1,0)
recall_10=sum(prec2$V4)/sum(data$V4)
coverage=nrow(Final)/nrow(test)
#########################################
mean(prec1$i.V3.1)
