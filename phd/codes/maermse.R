#reading data
#similar=read.table("E:/New Volume/Users/user/Desktop/exp/dump.txt",header=F)
library(data.table)
#similar=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/clustering/clustering/dump1.txt",header=F, skip=" ")
similar=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/slope one/slope one/dump_ml100.txt",header=F)
#max(similar$V1)
#similar=read.table("C:/bipul/train5/5/dump.txt",header=F)

similar<-subset(similar,similar$V3!=-1.00000)
#test=read.table("C:/Users/bip/Desktop/thesis/data/amazon/test1.txt",header=F)
#test<-read.table("C:/bipul/test1.txt")
#test<-read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/clustering/clustering/test4.txt")
test=read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u.data")

#test=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/simple/simple/test1.txt")
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

library(data.table)
test1=data.table(test1,key=c("V1","V2"))
similar=data.table(similar,key=c("V1","V2"))
Final <- test1[similar, nomatch=0]
Final$V4=ifelse(Final$V3>5,5,Final$V3) 
Final$V5=ifelse(Final$V3<1,1,Final$V4)
Final$MAE=abs(Final$z-Final$V5)
MAE=mean(Final$MAE)
Final$MSE=Final$MAE*Final$MAE
RMSE1=(mean(Final$MSE))
RMSE=sqrt(RMSE1)
###################################################
#data<-rbind(data,test)
#data$V5<- ifelse(data$V3>4,1,0)
#data$V6<-ave(data$V5,data$V2,FUN=sum)
#max(data$V6)
library(data.table)
#similar=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/novelty/novelty/dump.txt",header=F, skip=" ")
#similar=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/boolean/boolean/dump.txt",header=F, skip=" ")
#data=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/personality/personality/dump.txt",header=F,sep='\t')
data<-read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u1.test")
#data_test<-read.table("C:/Users/bip/Desktop/thesis/data/amazon/test1.txt")
#data_train<-read.table("C:/Users/bip/Desktop/thesis/data/amazon/train1.txt")
#data<-subset(data_train,data_train$V3>0)
#data<-rbind(data,data_test)
#data1<-read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/novelty/novelty/similar.txt",header=F, skip=" ")
data$V4=NULL
data$V1=data$V1-1
data$V2=data$V2-1
data$V4<-ifelse(data$V3>4,1,0)
#data$v5<-ave(data$V4,data$V2,FUN=sum)
data=data.table(data,key=c("V1","V2"))
similar=data.table(similar,key=c("V1","V2"))
prec <- similar[data, nomatch=0]
#prec$V4<-ifelse(prec$i.V3>3,1,0)
#prec$v5<-ave(prec$V4,prec$V2,FUN=sum)
prec=prec[order(V1,-V3),]
prec_5<-prec[ave(-prec$V3, prec$V1, FUN = rank) <= 5, ]
precision_5=mean(prec_5$V4)
prec_5$V6<-ifelse(prec_5$v5<36,1,0)
novelty_5<-sum(prec_5$V6)
a=1
prec_5<-cbind(prec_5,a)
prec_5$V7<-ave(prec_5$a,prec_5$V2,FUN=sum)
prec_v1<-prec_5[!duplicated(prec_5$V1),]
b=sum(prec_v1$V1>=0)
prec_5$V8<-(prec_5$V7/b)
prec_entropy<-prec_5[!duplicated(prec_5$V2),]
prec_entropy$V9<-(-log(prec_entropy$V8,2))
diversity_5<-sum(prec_entropy$V9)

prec_10<-prec[ave(-prec$V3, prec$V1, FUN = rank) <= 10, ]
precision_10=mean(prec_10$V4)
prec_10$V6<-ifelse(prec_10$v5<36,1,0)
novelty_10<-sum(prec_10$V6)
d=1
prec_10<-cbind(prec_10,d)
prec_10$V7<-ave(prec_10$d,prec_10$V2,FUN=sum)
prec_V1<-prec_10[!duplicated(prec_10$V1),]
c=sum(prec_V1$V1>=0)
prec_10$V8<-(prec_10$V7/c)
prec_entropy_10<-prec_10[!duplicated(prec_10$V2),]
prec_entropy_10$V9<-(-log(prec_entropy_10$V8,2))
diversity_10<-sum(prec_entropy_10$V9)

out<-cbind(MAE,RMSE,precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
ou1t<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
out2<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
out3<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
out4<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
out5<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
out6<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)

out<-rbind(out2,out3,out4,out5,out6)
write.csv(out,"C:/Users/bip/Desktop/expnov/svdml5.csv")
###########################################################
data1<-data.table(data1,key=c("V1","V2"))
prec<-data.table(prec,key=c("V1","V2"))
prec<-prec[data1,nomatch=0]
prec1_2 <- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 5, ] 
fact1<-as.factor(prec1_2$V2)


write.csv(prec1_1,"E:/prec1_5.csv")
###########################################
prec1$V4=ifelse(prec1$i.V3>4,1,0) 
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
