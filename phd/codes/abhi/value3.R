#reading data
#similar=read.table("E:/New Volume/Users/user/Desktop/exp/dump.txt",header=F)
library(data.table)
#similar=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/svd/svd/dump u/dump5.txt",header=F, skip=" ")
similar1=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/values/dump_20/dump1.txt",header=F)
similar2=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/values/dump_20/dump2.txt",header=F)
similar3=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/values/dump_20/dump3.txt",header=F)
similar4=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/values/dump_20/dump4.txt",header=F)
similar5=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/values/dump_20/dump5.txt",header=F)
#similar<-rbind(similar1,similar2,similar3,similar4,similar5)
#max(similar$V1)
similar<-subset(similar,similar$V3!=-1.00000)
#test=read.table("C:/Users/bip/Desktop/thesis/data/amazon/test1.txt",header=F)
#test=read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u.data")
test1<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/traintest20/test1.txt")
test2<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/traintest20/test2.txt")
test3<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/traintest20/test3.txt")
test4<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/traintest20/test4.txt")
test5<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/traintest20/test5.txt")
train<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/traintest20/train2.txt")
data<-rbind(train,test2)
data$V4=NULL
#test=rbind(test1,test2,test3,test4,test5)
test1$V4=NULL
test1$V1<-test1$V1-1
test1$V2<-test1$V2-1
library(data.table)
test1=data.table(test1,key=c("V1","V2"))
similar1=data.table(similar1,key=c("V1","V2"))
Final1 <- test1[similar1, nomatch=0]
Final1$V4=ifelse(Final1$i.V3>5,5,Final1$i.V3) 
Final1$V5=ifelse(Final1$i.V3<1,3,Final1$V4)
Final1$MAE=abs(Final1$V3-Final1$V5)
MAE1=mean(Final1$MAE)
Final1$MSE=Final1$MAE*Final1$MAE
RMSE1=(mean(Final1$MSE))
RMSE1=sqrt(RMSE1)
prec<-Final1
prec1<- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 5, ] 
prec1$V6=ifelse(prec1$i.V3>4,1,0) 
precision_51=mean(prec1$V6)
data$V4=ifelse(data$V3>4,1,0)
recall_51=sum(prec1$V6)/sum(data$V4)
prec2 <- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 10, ] 
prec2$V4=ifelse(prec2$i.V3>4,1,0) 
precision_101=mean(prec2$V4)
data$V4=ifelse(data$V3>4,1,0)
recall_101=sum(prec2$V4)/sum(data$V4)
coverage1=nrow(Final1)/nrow(test1)
###################################################
test2$V4=NULL
test2$V1<-test2$V1-1
test2$V2<-test2$V2-1
library(data.table)
test2=data.table(test2,key=c("V1","V2"))
similar2=data.table(similar2,key=c("V1","V2"))
Final2 <- test2[similar2, nomatch=0]
Final2$V4=ifelse(Final2$i.V3>5,5,Final2$i.V3) 
Final2$V5=ifelse(Final2$i.V3<1,3,Final2$V4)
Final2$MAE=abs(Final2$V3-Final2$V5)
MAE2=mean(Final2$MAE)
Final2$MSE=Final2$MAE*Final2$MAE
RMSE2=(mean(Final2$MSE))
RMSE2=sqrt(RMSE2)
prec<-Final2
prec1<- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 5, ] 
prec1$V6=ifelse(prec1$i.V3>4,1,0) 
precision_52=mean(prec1$V6)
data$V4=ifelse(data$V3>4,1,0)
recall_52=sum(prec1$V6)/sum(data$V4)
prec2 <- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 10, ] 
prec2$V4=ifelse(prec2$i.V3>4,1,0) 
precision_102=mean(prec2$V4)
data$V4=ifelse(data$V3>4,1,0)
recall_102=sum(prec2$V4)/sum(data$V4)
coverage2=nrow(Final2)/nrow(test2)
###############################################
test3$V4=NULL
test3$V1<-test3$V1-1
test3$V2<-test3$V2-1
library(data.table)
test3=data.table(test3,key=c("V1","V2"))
similar3=data.table(similar3,key=c("V1","V2"))
Final3 <- test3[similar3, nomatch=0]
Final3$V4=ifelse(Final3$i.V3>5,5,Final3$i.V3) 
Final3$V5=ifelse(Final3$i.V3<1,3,Final3$V4)
Final3$MAE=abs(Final3$V3-Final3$V5)
MAE3=mean(Final3$MAE)
Final3$MSE=Final3$MAE*Final3$MAE
RMSE3=(mean(Final3$MSE))
RMSE3=sqrt(RMSE3)
prec<-Final3
prec1<- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 5, ] 
prec1$V6=ifelse(prec1$i.V3>4,1,0) 
precision_53=mean(prec1$V6)
data$V4=ifelse(data$V3>4,1,0)
recall_53=sum(prec1$V6)/sum(data$V4)
prec2 <- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 10, ] 
prec2$V4=ifelse(prec2$i.V3>4,1,0) 
precision_103=mean(prec2$V4)
data$V4=ifelse(data$V3>4,1,0)
recall_103=sum(prec2$V4)/sum(data$V4)
coverage3=nrow(Final3)/nrow(test3)
############################################
test4$V4=NULL
test4$V1<-test4$V1-1
test4$V2<-test4$V2-1
library(data.table)
test4=data.table(test4,key=c("V1","V2"))
similar4=data.table(similar4,key=c("V1","V2"))
Final4 <- test4[similar4, nomatch=0]
Final4$V4=ifelse(Final4$i.V3>5,5,Final4$i.V3) 
Final4$V5=ifelse(Final4$i.V3<1,3,Final4$V4)
Final4$MAE=abs(Final4$V3-Final4$V5)
MAE4=mean(Final4$MAE)
Final4$MSE=Final4$MAE*Final4$MAE
RMSE4=(mean(Final4$MSE))
RMSE4=sqrt(RMSE4)
prec<-Final4
prec1<- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 5, ] 
prec1$V6=ifelse(prec1$i.V3>4,1,0) 
precision_54=mean(prec1$V6)
data$V4=ifelse(data$V3>4,1,0)
recall_54=sum(prec1$V6)/sum(data$V4)
prec2 <- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 10, ] 
prec2$V4=ifelse(prec2$i.V3>4,1,0) 
precision_104=mean(prec2$V4)
data$V4=ifelse(data$V3>4,1,0)
recall_104=sum(prec2$V4)/sum(data$V4)
coverage4=nrow(Final2)/nrow(test2)
#####################################
test5$V4=NULL
test5$V1<-test5$V1-1
test5$V2<-test5$V2-1
library(data.table)
test5=data.table(test5,key=c("V1","V2"))
similar5=data.table(similar5,key=c("V1","V2"))
Final5 <- test5[similar5, nomatch=0]
Final5$V4=ifelse(Final5$i.V3>5,5,Final5$i.V3) 
Final5$V5=ifelse(Final5$i.V3<1,3,Final4$V4)
Final5$MAE=abs(Final5$V3-Final5$V5)
MAE5=mean(Final5$MAE)
Final5$MSE=Final5$MAE*Final5$MAE
RMSE5=(mean(Final5$MSE))
RMSE5=sqrt(RMSE5)
prec<-Final5
prec1<- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 5, ] 
prec1$V6=ifelse(prec1$i.V3>4,1,0) 
precision_55=mean(prec1$V6)
data$V4=ifelse(data$V3>4,1,0)
recall_55=sum(prec1$V6)/sum(data$V4)
prec2 <- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 10, ] 
prec2$V4=ifelse(prec2$i.V3>4,1,0) 
precision_105=mean(prec2$V4)
data$V4=ifelse(data$V3>4,1,0)
recall_105=sum(prec2$V4)/sum(data$V4)
coverage5=nrow(Final5)/nrow(test5)
#######################################
out1<-cbind(MAE1,RMSE1,precision_51,precision_101,recall_51,recall_101,coverage1)
out2<-cbind(MAE2,RMSE2,precision_52,precision_102,recall_52,recall_102,coverage2)
out3<-cbind(MAE3,RMSE3,precision_53,precision_103,recall_53,recall_103,coverage3)
out4<-cbind(MAE4,RMSE4,precision_54,precision_104,recall_55,recall_104,coverage4)
out5<-cbind(MAE5,RMSE5,precision_55,precision_105,recall_55,recall_105,coverage5)
out<-rbind(out1,out2,out3,out4,out5)
write.csv(out,"C:/Users/bip/Desktop/Abhishek/exp/values/20/out20_5.csv")
#######################################################################################
#reading data
#similar=read.table("E:/New Volume/Users/user/Desktop/exp/dump.txt",header=F)
library(data.table)
#similar=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/svd/svd/dump u/dump5.txt",header=F, skip=" ")
similar1=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/values/dump_20/dump1_10.txt",header=F)
similar2=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/values/dump_20/dump2_10.txt",header=F)
similar3=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/values/dump_20/dump3_10.txt",header=F)
similar4=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/values/dump_20/dump4_10.txt",header=F)
similar5=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/values/dump_20/dump5_10.txt",header=F)
#similar<-rbind(similar1,similar2,similar3,similar4,similar5)
#max(similar$V1)
similar<-subset(similar,similar$V3!=-1.00000)
#test=read.table("C:/Users/bip/Desktop/thesis/data/amazon/test1.txt",header=F)
#test=read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u.data")
test1<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/traintest20/test1.txt")
test2<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/traintest20/test2.txt")
test3<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/traintest20/test3.txt")
test4<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/traintest20/test4.txt")
test5<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/traintest20/test5.txt")
train<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/traintest20/train2.txt")
data<-rbind(train,test2)
data$V4=NULL
#test=rbind(test1,test2,test3,test4,test5)
test1$V4=NULL
test1$V1<-test1$V1-1
test1$V2<-test1$V2-1
library(data.table)
test1=data.table(test1,key=c("V1","V2"))
similar1=data.table(similar1,key=c("V1","V2"))
Final1 <- test1[similar1, nomatch=0]
Final1$V4=ifelse(Final1$i.V3>5,5,Final1$i.V3) 
Final1$V5=ifelse(Final1$i.V3<1,3,Final1$V4)
Final1$MAE=abs(Final1$V3-Final1$V5)
MAE1=mean(Final1$MAE)
Final1$MSE=Final1$MAE*Final1$MAE
RMSE1=(mean(Final1$MSE))
RMSE1=sqrt(RMSE1)
prec<-Final1
prec1<- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 5, ] 
prec1$V6=ifelse(prec1$i.V3>4,1,0) 
precision_51=mean(prec1$V6)
data$V4=ifelse(data$V3>4,1,0)
recall_51=sum(prec1$V6)/sum(data$V4)
prec2 <- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 10, ] 
prec2$V4=ifelse(prec2$i.V3>4,1,0) 
precision_101=mean(prec2$V4)
data$V4=ifelse(data$V3>4,1,0)
recall_101=sum(prec2$V4)/sum(data$V4)
coverage1=nrow(Final1)/nrow(test1)
###################################################
test2$V4=NULL
test2$V1<-test2$V1-1
test2$V2<-test2$V2-1
library(data.table)
test2=data.table(test2,key=c("V1","V2"))
similar2=data.table(similar2,key=c("V1","V2"))
Final2 <- test2[similar2, nomatch=0]
Final2$V4=ifelse(Final2$i.V3>5,5,Final2$i.V3) 
Final2$V5=ifelse(Final2$i.V3<1,3,Final2$V4)
Final2$MAE=abs(Final2$V3-Final2$V5)
MAE2=mean(Final2$MAE)
Final2$MSE=Final2$MAE*Final2$MAE
RMSE2=(mean(Final2$MSE))
RMSE2=sqrt(RMSE2)
prec<-Final2
prec1<- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 5, ] 
prec1$V6=ifelse(prec1$i.V3>4,1,0) 
precision_52=mean(prec1$V6)
data$V4=ifelse(data$V3>4,1,0)
recall_52=sum(prec1$V6)/sum(data$V4)
prec2 <- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 10, ] 
prec2$V4=ifelse(prec2$i.V3>4,1,0) 
precision_102=mean(prec2$V4)
data$V4=ifelse(data$V3>4,1,0)
recall_102=sum(prec2$V4)/sum(data$V4)
coverage2=nrow(Final2)/nrow(test2)
###############################################
test3$V4=NULL
test3$V1<-test3$V1-1
test3$V2<-test3$V2-1
library(data.table)
test3=data.table(test3,key=c("V1","V2"))
similar3=data.table(similar3,key=c("V1","V2"))
Final3 <- test3[similar3, nomatch=0]
Final3$V4=ifelse(Final3$i.V3>5,5,Final3$i.V3) 
Final3$V5=ifelse(Final3$i.V3<1,3,Final3$V4)
Final3$MAE=abs(Final3$V3-Final3$V5)
MAE3=mean(Final3$MAE)
Final3$MSE=Final3$MAE*Final3$MAE
RMSE3=(mean(Final3$MSE))
RMSE3=sqrt(RMSE3)
prec<-Final3
prec1<- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 5, ] 
prec1$V6=ifelse(prec1$i.V3>4,1,0) 
precision_53=mean(prec1$V6)
data$V4=ifelse(data$V3>4,1,0)
recall_53=sum(prec1$V6)/sum(data$V4)
prec2 <- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 10, ] 
prec2$V4=ifelse(prec2$i.V3>4,1,0) 
precision_103=mean(prec2$V4)
data$V4=ifelse(data$V3>4,1,0)
recall_103=sum(prec2$V4)/sum(data$V4)
coverage3=nrow(Final3)/nrow(test3)
############################################
test4$V4=NULL
test4$V1<-test4$V1-1
test4$V2<-test4$V2-1
library(data.table)
test4=data.table(test4,key=c("V1","V2"))
similar4=data.table(similar4,key=c("V1","V2"))
Final4 <- test4[similar4, nomatch=0]
Final4$V4=ifelse(Final4$i.V3>5,5,Final4$i.V3) 
Final4$V5=ifelse(Final4$i.V3<1,3,Final4$V4)
Final4$MAE=abs(Final4$V3-Final4$V5)
MAE4=mean(Final4$MAE)
Final4$MSE=Final4$MAE*Final4$MAE
RMSE4=(mean(Final4$MSE))
RMSE4=sqrt(RMSE4)
prec<-Final4
prec1<- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 5, ] 
prec1$V6=ifelse(prec1$i.V3>4,1,0) 
precision_54=mean(prec1$V6)
data$V4=ifelse(data$V3>4,1,0)
recall_54=sum(prec1$V6)/sum(data$V4)
prec2 <- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 10, ] 
prec2$V4=ifelse(prec2$i.V3>4,1,0) 
precision_104=mean(prec2$V4)
data$V4=ifelse(data$V3>4,1,0)
recall_104=sum(prec2$V4)/sum(data$V4)
coverage4=nrow(Final2)/nrow(test2)
#####################################
test5$V4=NULL
test5$V1<-test5$V1-1
test5$V2<-test5$V2-1
library(data.table)
test5=data.table(test5,key=c("V1","V2"))
similar5=data.table(similar5,key=c("V1","V2"))
Final5 <- test5[similar5, nomatch=0]
Final5$V4=ifelse(Final5$i.V3>5,5,Final5$i.V3) 
Final5$V5=ifelse(Final5$i.V3<1,3,Final4$V4)
Final5$MAE=abs(Final5$V3-Final5$V5)
MAE5=mean(Final5$MAE)
Final5$MSE=Final5$MAE*Final5$MAE
RMSE5=(mean(Final5$MSE))
RMSE5=sqrt(RMSE5)
prec<-Final5
prec1<- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 5, ] 
prec1$V6=ifelse(prec1$i.V3>4,1,0) 
precision_55=mean(prec1$V6)
data$V4=ifelse(data$V3>4,1,0)
recall_55=sum(prec1$V6)/sum(data$V4)
prec2 <- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 10, ] 
prec2$V4=ifelse(prec2$i.V3>4,1,0) 
precision_105=mean(prec2$V4)
data$V4=ifelse(data$V3>4,1,0)
recall_105=sum(prec2$V4)/sum(data$V4)
coverage5=nrow(Final5)/nrow(test5)
#######################################
out1<-cbind(MAE1,RMSE1,precision_51,precision_101,recall_51,recall_101,coverage1)
out2<-cbind(MAE2,RMSE2,precision_52,precision_102,recall_52,recall_102,coverage2)
out3<-cbind(MAE3,RMSE3,precision_53,precision_103,recall_53,recall_103,coverage3)
out4<-cbind(MAE4,RMSE4,precision_54,precision_104,recall_55,recall_104,coverage4)
out5<-cbind(MAE5,RMSE5,precision_55,precision_105,recall_55,recall_105,coverage5)
out<-rbind(out1,out2,out3,out4,out5)
write.csv(out,"C:/Users/bip/Desktop/Abhishek/exp/values/20/out20_10.csv")
#######################################################################################
#reading data
#similar=read.table("E:/New Volume/Users/user/Desktop/exp/dump.txt",header=F)
library(data.table)
#similar=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/svd/svd/dump u/dump5.txt",header=F, skip=" ")
similar1=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/values/dump_20/dump1_15.txt",header=F)
similar2=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/values/dump_20/dump2_15.txt",header=F)
similar3=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/values/dump_20/dump3_15.txt",header=F)
similar4=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/values/dump_20/dump4_15.txt",header=F)
similar5=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/values/dump_20/dump5_15.txt",header=F)
#similar<-rbind(similar1,similar2,similar3,similar4,similar5)
#max(similar$V1)
similar<-subset(similar,similar$V3!=-1.00000)
#test=read.table("C:/Users/bip/Desktop/thesis/data/amazon/test1.txt",header=F)
#test=read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u.data")
test1<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/traintest20/test1.txt")
test2<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/traintest20/test2.txt")
test3<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/traintest20/test3.txt")
test4<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/traintest20/test4.txt")
test5<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/traintest20/test5.txt")
train<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/traintest20/train2.txt")
data<-rbind(train,test2)
data$V4=NULL
#test=rbind(test1,test2,test3,test4,test5)
test1$V4=NULL
test1$V1<-test1$V1-1
test1$V2<-test1$V2-1
library(data.table)
test1=data.table(test1,key=c("V1","V2"))
similar1=data.table(similar1,key=c("V1","V2"))
Final1 <- test1[similar1, nomatch=0]
Final1$V4=ifelse(Final1$i.V3>5,5,Final1$i.V3) 
Final1$V5=ifelse(Final1$i.V3<1,3,Final1$V4)
Final1$MAE=abs(Final1$V3-Final1$V5)
MAE1=mean(Final1$MAE)
Final1$MSE=Final1$MAE*Final1$MAE
RMSE1=(mean(Final1$MSE))
RMSE1=sqrt(RMSE1)
prec<-Final1
prec1<- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 5, ] 
prec1$V6=ifelse(prec1$i.V3>4,1,0) 
precision_51=mean(prec1$V6)
data$V4=ifelse(data$V3>4,1,0)
recall_51=sum(prec1$V6)/sum(data$V4)
prec2 <- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 10, ] 
prec2$V4=ifelse(prec2$i.V3>4,1,0) 
precision_101=mean(prec2$V4)
data$V4=ifelse(data$V3>4,1,0)
recall_101=sum(prec2$V4)/sum(data$V4)
coverage1=nrow(Final1)/nrow(test1)
###################################################
test2$V4=NULL
test2$V1<-test2$V1-1
test2$V2<-test2$V2-1
library(data.table)
test2=data.table(test2,key=c("V1","V2"))
similar2=data.table(similar2,key=c("V1","V2"))
Final2 <- test2[similar2, nomatch=0]
Final2$V4=ifelse(Final2$i.V3>5,5,Final2$i.V3) 
Final2$V5=ifelse(Final2$i.V3<1,3,Final2$V4)
Final2$MAE=abs(Final2$V3-Final2$V5)
MAE2=mean(Final2$MAE)
Final2$MSE=Final2$MAE*Final2$MAE
RMSE2=(mean(Final2$MSE))
RMSE2=sqrt(RMSE2)
prec<-Final2
prec1<- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 5, ] 
prec1$V6=ifelse(prec1$i.V3>4,1,0) 
precision_52=mean(prec1$V6)
data$V4=ifelse(data$V3>4,1,0)
recall_52=sum(prec1$V6)/sum(data$V4)
prec2 <- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 10, ] 
prec2$V4=ifelse(prec2$i.V3>4,1,0) 
precision_102=mean(prec2$V4)
data$V4=ifelse(data$V3>4,1,0)
recall_102=sum(prec2$V4)/sum(data$V4)
coverage2=nrow(Final2)/nrow(test2)
###############################################
test3$V4=NULL
test3$V1<-test3$V1-1
test3$V2<-test3$V2-1
library(data.table)
test3=data.table(test3,key=c("V1","V2"))
similar3=data.table(similar3,key=c("V1","V2"))
Final3 <- test3[similar3, nomatch=0]
Final3$V4=ifelse(Final3$i.V3>5,5,Final3$i.V3) 
Final3$V5=ifelse(Final3$i.V3<1,3,Final3$V4)
Final3$MAE=abs(Final3$V3-Final3$V5)
MAE3=mean(Final3$MAE)
Final3$MSE=Final3$MAE*Final3$MAE
RMSE3=(mean(Final3$MSE))
RMSE3=sqrt(RMSE3)
prec<-Final3
prec1<- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 5, ] 
prec1$V6=ifelse(prec1$i.V3>4,1,0) 
precision_53=mean(prec1$V6)
data$V4=ifelse(data$V3>4,1,0)
recall_53=sum(prec1$V6)/sum(data$V4)
prec2 <- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 10, ] 
prec2$V4=ifelse(prec2$i.V3>4,1,0) 
precision_103=mean(prec2$V4)
data$V4=ifelse(data$V3>4,1,0)
recall_103=sum(prec2$V4)/sum(data$V4)
coverage3=nrow(Final3)/nrow(test3)
############################################
test4$V4=NULL
test4$V1<-test4$V1-1
test4$V2<-test4$V2-1
library(data.table)
test4=data.table(test4,key=c("V1","V2"))
similar4=data.table(similar4,key=c("V1","V2"))
Final4 <- test4[similar4, nomatch=0]
Final4$V4=ifelse(Final4$i.V3>5,5,Final4$i.V3) 
Final4$V5=ifelse(Final4$i.V3<1,3,Final4$V4)
Final4$MAE=abs(Final4$V3-Final4$V5)
MAE4=mean(Final4$MAE)
Final4$MSE=Final4$MAE*Final4$MAE
RMSE4=(mean(Final4$MSE))
RMSE4=sqrt(RMSE4)
prec<-Final4
prec1<- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 5, ] 
prec1$V6=ifelse(prec1$i.V3>4,1,0) 
precision_54=mean(prec1$V6)
data$V4=ifelse(data$V3>4,1,0)
recall_54=sum(prec1$V6)/sum(data$V4)
prec2 <- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 10, ] 
prec2$V4=ifelse(prec2$i.V3>4,1,0) 
precision_104=mean(prec2$V4)
data$V4=ifelse(data$V3>4,1,0)
recall_104=sum(prec2$V4)/sum(data$V4)
coverage4=nrow(Final2)/nrow(test2)
#####################################
test5$V4=NULL
test5$V1<-test5$V1-1
test5$V2<-test5$V2-1
library(data.table)
test5=data.table(test5,key=c("V1","V2"))
similar5=data.table(similar5,key=c("V1","V2"))
Final5 <- test5[similar5, nomatch=0]
Final5$V4=ifelse(Final5$i.V3>5,5,Final5$i.V3) 
Final5$V5=ifelse(Final5$i.V3<1,3,Final4$V4)
Final5$MAE=abs(Final5$V3-Final5$V5)
MAE5=mean(Final5$MAE)
Final5$MSE=Final5$MAE*Final5$MAE
RMSE5=(mean(Final5$MSE))
RMSE5=sqrt(RMSE5)
prec<-Final5
prec1<- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 5, ] 
prec1$V6=ifelse(prec1$i.V3>4,1,0) 
precision_55=mean(prec1$V6)
data$V4=ifelse(data$V3>4,1,0)
recall_55=sum(prec1$V6)/sum(data$V4)
prec2 <- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 10, ] 
prec2$V4=ifelse(prec2$i.V3>4,1,0) 
precision_105=mean(prec2$V4)
data$V4=ifelse(data$V3>4,1,0)
recall_105=sum(prec2$V4)/sum(data$V4)
coverage5=nrow(Final5)/nrow(test5)
#######################################
out1<-cbind(MAE1,RMSE1,precision_51,precision_101,recall_51,recall_101,coverage1)
out2<-cbind(MAE2,RMSE2,precision_52,precision_102,recall_52,recall_102,coverage2)
out3<-cbind(MAE3,RMSE3,precision_53,precision_103,recall_53,recall_103,coverage3)
out4<-cbind(MAE4,RMSE4,precision_54,precision_104,recall_55,recall_104,coverage4)
out5<-cbind(MAE5,RMSE5,precision_55,precision_105,recall_55,recall_105,coverage5)
out<-rbind(out1,out2,out3,out4,out5)
write.csv(out,"C:/Users/bip/Desktop/Abhishek/exp/values/20/out20_15.csv")
#######################################################################################
#reading data
#similar=read.table("E:/New Volume/Users/user/Desktop/exp/dump.txt",header=F)
library(data.table)
#similar=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/svd/svd/dump u/dump5.txt",header=F, skip=" ")
similar1=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/values/dump_20/dump1_20.txt",header=F)
similar2=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/values/dump_20/dump2_20.txt",header=F)
similar3=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/values/dump_20/dump3_20.txt",header=F)
similar4=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/values/dump_20/dump4_20.txt",header=F)
similar5=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/values/dump_20/dump5_20.txt",header=F)
#similar<-rbind(similar1,similar2,similar3,similar4,similar5)
#max(similar$V1)
similar<-subset(similar,similar$V3!=-1.00000)
#test=read.table("C:/Users/bip/Desktop/thesis/data/amazon/test1.txt",header=F)
#test=read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u.data")
test1<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/traintest20/test1.txt")
test2<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/traintest20/test2.txt")
test3<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/traintest20/test3.txt")
test4<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/traintest20/test4.txt")
test5<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/traintest20/test5.txt")
train<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/traintest20/train2.txt")
data<-rbind(train,test2)
data$V4=NULL
#test=rbind(test1,test2,test3,test4,test5)
test1$V4=NULL
test1$V1<-test1$V1-1
test1$V2<-test1$V2-1
library(data.table)
test1=data.table(test1,key=c("V1","V2"))
similar1=data.table(similar1,key=c("V1","V2"))
Final1 <- test1[similar1, nomatch=0]
Final1$V4=ifelse(Final1$i.V3>5,5,Final1$i.V3) 
Final1$V5=ifelse(Final1$i.V3<1,3,Final1$V4)
Final1$MAE=abs(Final1$V3-Final1$V5)
MAE1=mean(Final1$MAE)
Final1$MSE=Final1$MAE*Final1$MAE
RMSE1=(mean(Final1$MSE))
RMSE1=sqrt(RMSE1)
prec<-Final1
prec1<- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 5, ] 
prec1$V6=ifelse(prec1$i.V3>4,1,0) 
precision_51=mean(prec1$V6)
data$V4=ifelse(data$V3>4,1,0)
recall_51=sum(prec1$V6)/sum(data$V4)
prec2 <- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 10, ] 
prec2$V4=ifelse(prec2$i.V3>4,1,0) 
precision_101=mean(prec2$V4)
data$V4=ifelse(data$V3>4,1,0)
recall_101=sum(prec2$V4)/sum(data$V4)
coverage1=nrow(Final1)/nrow(test1)
###################################################
test2$V4=NULL
test2$V1<-test2$V1-1
test2$V2<-test2$V2-1
library(data.table)
test2=data.table(test2,key=c("V1","V2"))
similar2=data.table(similar2,key=c("V1","V2"))
Final2 <- test2[similar2, nomatch=0]
Final2$V4=ifelse(Final2$i.V3>5,5,Final2$i.V3) 
Final2$V5=ifelse(Final2$i.V3<1,3,Final2$V4)
Final2$MAE=abs(Final2$V3-Final2$V5)
MAE2=mean(Final2$MAE)
Final2$MSE=Final2$MAE*Final2$MAE
RMSE2=(mean(Final2$MSE))
RMSE2=sqrt(RMSE2)
prec<-Final2
prec1<- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 5, ] 
prec1$V6=ifelse(prec1$i.V3>4,1,0) 
precision_52=mean(prec1$V6)
data$V4=ifelse(data$V3>4,1,0)
recall_52=sum(prec1$V6)/sum(data$V4)
prec2 <- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 10, ] 
prec2$V4=ifelse(prec2$i.V3>4,1,0) 
precision_102=mean(prec2$V4)
data$V4=ifelse(data$V3>4,1,0)
recall_102=sum(prec2$V4)/sum(data$V4)
coverage2=nrow(Final2)/nrow(test2)
###############################################
test3$V4=NULL
test3$V1<-test3$V1-1
test3$V2<-test3$V2-1
library(data.table)
test3=data.table(test3,key=c("V1","V2"))
similar3=data.table(similar3,key=c("V1","V2"))
Final3 <- test3[similar3, nomatch=0]
Final3$V4=ifelse(Final3$i.V3>5,5,Final3$i.V3) 
Final3$V5=ifelse(Final3$i.V3<1,3,Final3$V4)
Final3$MAE=abs(Final3$V3-Final3$V5)
MAE3=mean(Final3$MAE)
Final3$MSE=Final3$MAE*Final3$MAE
RMSE3=(mean(Final3$MSE))
RMSE3=sqrt(RMSE3)
prec<-Final3
prec1<- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 5, ] 
prec1$V6=ifelse(prec1$i.V3>4,1,0) 
precision_53=mean(prec1$V6)
data$V4=ifelse(data$V3>4,1,0)
recall_53=sum(prec1$V6)/sum(data$V4)
prec2 <- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 10, ] 
prec2$V4=ifelse(prec2$i.V3>4,1,0) 
precision_103=mean(prec2$V4)
data$V4=ifelse(data$V3>4,1,0)
recall_103=sum(prec2$V4)/sum(data$V4)
coverage3=nrow(Final3)/nrow(test3)
############################################
test4$V4=NULL
test4$V1<-test4$V1-1
test4$V2<-test4$V2-1
library(data.table)
test4=data.table(test4,key=c("V1","V2"))
similar4=data.table(similar4,key=c("V1","V2"))
Final4 <- test4[similar4, nomatch=0]
Final4$V4=ifelse(Final4$i.V3>5,5,Final4$i.V3) 
Final4$V5=ifelse(Final4$i.V3<1,3,Final4$V4)
Final4$MAE=abs(Final4$V3-Final4$V5)
MAE4=mean(Final4$MAE)
Final4$MSE=Final4$MAE*Final4$MAE
RMSE4=(mean(Final4$MSE))
RMSE4=sqrt(RMSE4)
prec<-Final4
prec1<- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 5, ] 
prec1$V6=ifelse(prec1$i.V3>4,1,0) 
precision_54=mean(prec1$V6)
data$V4=ifelse(data$V3>4,1,0)
recall_54=sum(prec1$V6)/sum(data$V4)
prec2 <- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 10, ] 
prec2$V4=ifelse(prec2$i.V3>4,1,0) 
precision_104=mean(prec2$V4)
data$V4=ifelse(data$V3>4,1,0)
recall_104=sum(prec2$V4)/sum(data$V4)
coverage4=nrow(Final2)/nrow(test2)
#####################################
test5$V4=NULL
test5$V1<-test5$V1-1
test5$V2<-test5$V2-1
library(data.table)
test5=data.table(test5,key=c("V1","V2"))
similar5=data.table(similar5,key=c("V1","V2"))
Final5 <- test5[similar5, nomatch=0]
Final5$V4=ifelse(Final5$i.V3>5,5,Final5$i.V3) 
Final5$V5=ifelse(Final5$i.V3<1,3,Final4$V4)
Final5$MAE=abs(Final5$V3-Final5$V5)
MAE5=mean(Final5$MAE)
Final5$MSE=Final5$MAE*Final5$MAE
RMSE5=(mean(Final5$MSE))
RMSE5=sqrt(RMSE5)
prec<-Final5
prec1<- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 5, ] 
prec1$V6=ifelse(prec1$i.V3>4,1,0) 
precision_55=mean(prec1$V6)
data$V4=ifelse(data$V3>4,1,0)
recall_55=sum(prec1$V6)/sum(data$V4)
prec2 <- prec[ave(-prec$V3, prec$V1, FUN = rank) <= 10, ] 
prec2$V4=ifelse(prec2$i.V3>4,1,0) 
precision_105=mean(prec2$V4)
data$V4=ifelse(data$V3>4,1,0)
recall_105=sum(prec2$V4)/sum(data$V4)
coverage5=nrow(Final5)/nrow(test5)
#######################################
out1<-cbind(MAE1,RMSE1,precision_51,precision_101,recall_51,recall_101,coverage1)
out2<-cbind(MAE2,RMSE2,precision_52,precision_102,recall_52,recall_102,coverage2)
out3<-cbind(MAE3,RMSE3,precision_53,precision_103,recall_53,recall_103,coverage3)
out4<-cbind(MAE4,RMSE4,precision_54,precision_104,recall_55,recall_104,coverage4)
out5<-cbind(MAE5,RMSE5,precision_55,precision_105,recall_55,recall_105,coverage5)
out<-rbind(out1,out2,out3,out4,out5)
write.csv(out,"C:/Users/bip/Desktop/Abhishek/exp/values/20/out20_20.csv")
#######################################################################################
