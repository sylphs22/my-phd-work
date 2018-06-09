#reading data
#similar=read.table("E:/New Volume/Users/user/Desktop/exp/dump.txt",header=F)
library(data.table)
#similar1=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/svd/svd/dump u/dump3.txt",header=F, skip=" ")
#similar1=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/clustering/clustering/IN.txt",header=F)
#similar1=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/clustering/clustering/dump_film/cluster/dump30.txt",header=F)
similar1=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/boolean/boolean/dump.txt",header=F)
similar1<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/rankcos/rankcos/dump.txt",header=F)
#similar3=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/needs/dump_20/dump3.txt",header=F)
#similar4=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/needs/dump_20/dump4.txt",header=F)
#similar5=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/needs/dump_20/dump5.txt",header=F)
#similar<-rbind(similar1,similar2,similar3,similar4,similar5)
#max(similar1$V1)
max(similar1$V2)
#similar<-subset(similar,similar$V3!=-1.00000)
#test=read.table("C:/Users/bip/Desktop/thesis/data/amazon/test1.txt",header=F)
test1=read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u.data")
test1<-read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/clustering/clustering/test4.txt")
test1<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/traintest5/test1.txt")

#test1<-read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u1.test")
#test2<-read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u2.test")
#test3<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/traintest20/test3.txt")
#test4<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/traintest20/test4.txt")
#test5<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/traintest20/test5.txt")
#train<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/traintest20/train2.txt")
#data<-read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u.data")
#data$V4=NULL
#test=rbind(test1,test2,test3,test4,test5)
test1$V4=NULL
test1$V1<-test1$V1-1
test1$V2<-test1$V2-1
library(data.table)
test1=data.table(test1,key=c("V1","V2"))
similar1=data.table(similar1,key=c("V1","V2"))
Final1 <- test1[similar1, nomatch=0]
Final1$V4=ifelse(Final1$i.V3>5,5,Final1$i.V3) 
Final1$V5=ifelse(Final1$i.V3<1,1,Final1$V4)
Final1$MAE=abs(Final1$V3-Final1$V5)
MAE1=mean(Final1$MAE)
Final1$MSE=Final1$MAE*Final1$MAE
RMSE1=(mean(Final1$MSE))
RMSE1=sqrt(RMSE1)
prec<-Final1
prec=prec[order(V1,-i.V3),]
prec1<- prec[ave(-prec$i.V3, prec$V1, FUN = rank) <= 5, ] 
prec1$V6=ifelse(prec1$V3>4,1,0) 
precision_51=mean(prec1$V6)
test1$V4=ifelse(test1$V3>4,1,0)
recall_51=sum(prec1$V6)/sum(test1$V4)
prec2 <- prec[ave(-prec$i.V3, prec$V1, FUN = rank) <= 10, ] 
prec2$V4=ifelse(prec2$V3>4,1,0) 
precision_101=mean(prec2$V4)
#data$V4=ifelse(data$V3>4,1,0)
recall_101=sum(prec2$V4)/sum(test1$V4)
#coverage1=nrow(Final1)/nrow(test1)

out<-cbind(MAE1,RMSE1,precision_51,precision_101,recall_51,recall_101)
#out2<-cbind(MAE2,RMSE2,precision_52,precision_102,recall_52,recall_102)
#out3<-cbind(MAE3,RMSE3,precision_53,precision_103,recall_53,recall_103,coverage3)
#out4<-cbind(MAE4,RMSE4,precision_54,precision_104,recall_55,recall_104,coverage4)
#out5<-cbind(MAE5,RMSE5,precision_55,precision_105,recall_55,recall_105,coverage5)
#out<-rbind(out1,out2)
#out1<-data.frame(colMeans(out))
write.csv(out,"C:/Users/bip/Desktop/film/out_20.csv")
write.csv(out1,"C:/Users/bip/Desktop/film/cluster/out_10.csv")

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
prec1<- prec[ave(-prec$i.V3, prec$V1, FUN = rank) <= 5, ] 
prec1$V6=ifelse(prec1$V3>4,1,0) 
precision_52=mean(prec1$V6)
test2$V4=ifelse(test2$V3>4,1,0)
recall_52=sum(prec1$V6)/sum(test2$V4)
prec2 <- prec[ave(-prec$i.V3, prec$V1, FUN = rank) <= 10, ] 
prec2$V4=ifelse(prec2$V3>4,1,0) 
precision_102=mean(prec2$V4)
#data$V4=ifelse(data$V3>4,1,0)
recall_102=sum(prec2$V4)/sum(test2$V4)
#coverage2=nrow(Final2)/nrow(test2)
###############################################

#######################################
out1<-cbind(MAE1,RMSE1,precision_51,precision_101,recall_51,recall_101)
out2<-cbind(MAE2,RMSE2,precision_52,precision_102,recall_52,recall_102)
#out3<-cbind(MAE3,RMSE3,precision_53,precision_103,recall_53,recall_103,coverage3)
#out4<-cbind(MAE4,RMSE4,precision_54,precision_104,recall_55,recall_104,coverage4)
#out5<-cbind(MAE5,RMSE5,precision_55,precision_105,recall_55,recall_105,coverage5)
out<-rbind(out1,out2)
out1<-data.frame(colMeans(out))
write.csv(out1,"C:/Users/bip/Desktop/ml100/cluster/out_50.csv")
#######################################################################################
