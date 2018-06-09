data=read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u.data")
V5=1
data=cbind(data,V5)
data$V6<-ave(data$V5,data$V1,FUN=sum)
data1<-subset(data,data$V6>=30)
#data1 <- data1[order(data1$V1, data1$V2),] 
data1$V5<-NULL
data1$V6=NULL
data1$V7=NULL
set.seed(10)
library(devtools)
source_gist("https://gist.github.com/mrdwab/6424112")
train<-stratified(data1, group = 1, size = 20)
#write.table(train,row.names=FALSE,col.names=FALSE, "C:/Users/bip/Documents/Visual Studio 2012/Projects/ranking/ranking/train1.txt",sep='\t')
#test$V3<-0
index<-as.numeric(rownames(train))
index1<-as.numeric(rownames(data1))
test<-data[-index,]
test<-subset(test,test$V6>=30)
test <- test[order(test$V1, test$V2),]
test$V5<-NULL
test$V6<-NULL
write.table(test,row.names=FALSE,col.names=FALSE, "C:/Users/bip/Documents/Visual Studio 2012/Projects/ranking/ranking/test.txt",sep='\t')
test$V3<-0
train<-rbind(train,test)
train <- train[order(train$V1, train$V2),] 
write.table(train,row.names=FALSE,col.names=FALSE, "C:/Users/bip/Documents/Visual Studio 2012/Projects/ranking/ranking/train.txt",sep='\t')
#write.table(test,row.names=FALSE,col.names=FALSE, "C:/Users/bip/Documents/Visual Studio 2012/Projects/ranking/ranking/test.txt",sep='\t')
set.seed(20)
test<-stratified(data1, group = 1, size = 10)
index<-as.numeric(rownames(test))
train<-data1[-index,]
write.table(train,row.names=FALSE,col.names=FALSE, "C:/Users/bip/Documents/Visual Studio 2012/Projects/ranking/ranking/train2.txt",sep='\t')
write.table(test,row.names=FALSE,col.names=FALSE, "C:/Users/bip/Documents/Visual Studio 2012/Projects/ranking/ranking/test2.txt",sep='\t')
set.seed(30)
test<-stratified(data1, group = 1, size = 10)
index<-as.numeric(rownames(test))
train<-data1[-index,]
write.table(train,row.names=FALSE,col.names=FALSE, "C:/Users/bip/Documents/Visual Studio 2012/Projects/ranking/ranking/train3.txt",sep='\t')
write.table(test,row.names=FALSE,col.names=FALSE, "C:/Users/bip/Documents/Visual Studio 2012/Projects/ranking/ranking/test3.txt",sep='\t')
set.seed(40)
test<-stratified(data1, group = 1, size = 10)
index<-as.numeric(rownames(test))
train<-data1[-index,]
write.table(train,row.names=FALSE,col.names=FALSE, "C:/Users/bip/Documents/Visual Studio 2012/Projects/ranking/ranking/train4.txt",sep='\t')
write.table(test,row.names=FALSE,col.names=FALSE, "C:/Users/bip/Documents/Visual Studio 2012/Projects/ranking/ranking/test4.txt",sep='\t')
set.seed(50)
test<-stratified(data1, group = 1, size = 10)
index<-as.numeric(rownames(test))
train<-data1[-index,]
write.table(train,row.names=FALSE,col.names=FALSE, "C:/Users/bip/Documents/Visual Studio 2012/Projects/ranking/ranking/train5.txt",sep='\t')
write.table(test,row.names=FALSE,col.names=FALSE, "C:/Users/bip/Documents/Visual Studio 2012/Projects/ranking/ranking/test5.txt",sep='\t')
set.seed(60)
test<-stratified(data1, group = 1, size = 10)
index<-as.numeric(rownames(test))
train<-data1[-index,]
write.table(train,row.names=FALSE,col.names=FALSE, "C:/Users/bip/Documents/Visual Studio 2012/Projects/ranking/ranking/train6.txt",sep='\t')
write.table(test,row.names=FALSE,col.names=FALSE, "C:/Users/bip/Documents/Visual Studio 2012/Projects/ranking/ranking/test6.txt",sep='\t')
set.seed(70)
test<-stratified(data1, group = 1, size = 10)
index<-as.numeric(rownames(test))
train<-data1[-index,]
write.table(train,row.names=FALSE,col.names=FALSE, "C:/Users/bip/Documents/Visual Studio 2012/Projects/ranking/ranking/train7.txt",sep='\t')
write.table(test,row.names=FALSE,col.names=FALSE, "C:/Users/bip/Documents/Visual Studio 2012/Projects/ranking/ranking/test7.txt",sep='\t')
set.seed(80)
test<-stratified(data1, group = 1, size = 10)
index<-as.numeric(rownames(test))
train<-data1[-index,]
write.table(train,row.names=FALSE,col.names=FALSE, "C:/Users/bip/Documents/Visual Studio 2012/Projects/ranking/ranking/train8.txt",sep='\t')
write.table(test,row.names=FALSE,col.names=FALSE, "C:/Users/bip/Documents/Visual Studio 2012/Projects/ranking/ranking/test8.txt",sep='\t')
set.seed(90)
test<-stratified(data1, group = 1, size = 10)
index<-as.numeric(rownames(test))
train<-data1[-index,]
write.table(train,row.names=FALSE,col.names=FALSE, "C:/Users/bip/Documents/Visual Studio 2012/Projects/ranking/ranking/train9.txt",sep='\t')
write.table(test,row.names=FALSE,col.names=FALSE, "C:/Users/bip/Documents/Visual Studio 2012/Projects/ranking/ranking/test9.txt",sep='\t')
set.seed(100)
test<-stratified(data1, group = 1, size = 10)
index<-as.numeric(rownames(test))
train<-data1[-index,]
write.table(train,row.names=FALSE,col.names=FALSE, "C:/Users/bip/Documents/Visual Studio 2012/Projects/ranking/ranking/train10.txt",sep='\t')
write.table(test,row.names=FALSE,col.names=FALSE, "C:/Users/bip/Documents/Visual Studio 2012/Projects/ranking/ranking/test10.txt",sep='\t')
