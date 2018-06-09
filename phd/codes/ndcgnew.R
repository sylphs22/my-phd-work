similar1=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/rankcos/rankcos/dump.txt",header=F, skip=" ")
#test1=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/ranking1/ranking1/IN.txt",header=F, skip=" ")
#similar1=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/boolean/boolean/dump.txt",header=F, skip=" ")
similar1=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/svd/svd/dump.txt",header=F, skip=" ")
test1<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/ranking/ranking/test.txt",header=F, skip=" ")
#test1=read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u.data")
#similar1=read.tab
#similar1=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/rankcos/rankcos/dump.txt",header=F, skip=" ")
#test1=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/ranking1/ranking1/IN.txt",header=F, skip=" ")
#test1=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/ranking/ranking/test.txt",header=F, skip=" ")
#similar1=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/svd/svd/dump.txt",header=F, skip=" ")
test1$V4=NULL
test1$V1<-test1$V1-1
test1$V2<-test1$V2-1
test2<-test1
test2=test2[order(test2$V1,-test2$V3),]
V4=1
test2<-cbind(test2,V4)
test2$V5=ave(test2$V4, test2$V1, FUN = cumsum)
test3<-subset(test2,test2$V5<=10)
library(data.table)
test1=data.table(test1,key=c("V1","V2"))
similar1=data.table(similar1,key=c("V1","V2"))
Final1 <- test1[similar1, nomatch=0]
prec<-Final1
prec=prec[order(V1,-i.V3),]
a=1
prec<-cbind(prec,a)
prec$c=ave(prec$a, prec$V1, FUN = cumsum)
prec1<-subset(prec,prec$c<=10)
#prec1<- prec[ave(-prec$i.V3, prec$V1, FUN = rank) <= 10, ] 
#prec1$V4=ifelse(prec1$V3>4,1,0) 
V4=test3$V3
V5=1
prec1<-cbind(prec1,V4,V5)
prec1$V6<-ave(prec1$V5,prec1$V1,FUN=cumsum)
prec1$b<-ave(prec1$V5,prec1$V1,FUN=sum)
#prec1<-subset(prec1,prec1$b==10)
prec1$V7=((2^(prec1$V3)-1)/log2(1+prec1$V6))
prec1$V8<-((2^(prec1$V4)-1)/log2(1+prec1$V6))
prec1$V9<-ave(prec1$V7,prec1$V1,FUN=sum)
prec1$V10<-ave(prec1$V8,prec1$V1,FUN=sum)
#prec2<-prec1[ave(-prec1$i.V3, prec1$V1, FUN = rank) <=1, ]
prec2<-subset(prec1,prec1$V6<=1)
prec2$V11<-prec2$V9/prec2$V10
mean(prec2$V11)
