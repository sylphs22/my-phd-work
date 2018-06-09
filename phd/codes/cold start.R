t1<-read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/svd/svd/train5.txt")
t2<-read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/svd/svd/test5.txt")
t2$V4=1
t2$V3=0
t<-rbind(t1,t2)
t3<-t[order(t$V1,t$V2),]
write.table(t3,row.names=FALSE,col.names=FALSE, "E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/svd/svd/train5.txt", sep="\t")
######################################
test=read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u.data")
test1=test[sample(1:nrow(test), 0.20*nrow(test)),]
t<-test1[order(test1$V1,test1$V2),]
set.seed(10)
a=data.frame(sample(1:943,10))
data<-subset(test,test$V1==a[1:10,1])
train <- subset(test,test$V1!=a[1:10,1])
write.table(train,row.names=FALSE,col.names=FALSE, "E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/svd/svd/train.txt", sep="\t")
write.table(data,row.names=FALSE,col.names=FALSE, "E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/svd/svd/train.txt", sep="\t")
