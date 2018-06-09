similar1=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/svd/svd/dump.txt",header=F, skip=" ")
similar1=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/rankcos/rankcos/dump1.txt",header=F, skip=" ")
#test1=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/ranking1/ranking1/IN.txt",header=F, skip=" ")
test1=read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u.data")
#similar1=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/svd/svd/dump u/dump5.txt",header=F, skip=" ")
test1$V4=NULL
test1$V1<-test1$V1-1
test1$V2<-test1$V2-1
library(data.table)
test1=data.table(test1,key=c("V1","V2"))
similar1=data.table(similar1,key=c("V1","V2"))
Final1 <- test1[similar1, nomatch=0]
prec<-Final1
#prec$i.V3=(1-prec$i.V3)
prec=prec[order(V1,-i.V3),]
prec1<- prec[ave(-prec$i.V3, prec$V1, FUN = rank) <= 10, ] 
#prec1$V4=ifelse(prec1$V3>4,1,0) 
V4=5
V5=1
prec1<-cbind(prec1,V4,V5)
prec1$V6<-ave(prec1$V5,prec1$V1,FUN=cumsum)
prec1$b<-ave(prec1$V5,prec1$V1,FUN=sum)
prec1<-subset(prec1,prec1$b==10)
prec1$V7=((2^(prec1$V3)-1)/log2(1+prec1$V6))
prec1$V8<-((2^(prec1$V4)-1)/log2(1+prec1$V6))
prec1$V9<-ave(prec1$V7,prec1$V1,FUN=sum)
prec1$V10<-ave(prec1$V8,prec1$V1,FUN=sum)
prec2<-prec1[ave(-prec1$i.V3, prec1$V1, FUN = rank) <=1, ]
prec2$V11<-prec2$V9/prec2$V10
mean(prec2$V11)
##########################################################################
test2<-Final1
test2$i.V3=NULL
test2<-test2[order(test2$V1,-test2$V3),]
a=1
test2<-cbind(test2,a)
test2$V4<-ave(test2$a,test2$V1,FUN=cumsum)
test3<-subset(test2,test2$V4<11)
test3$b<-ave(test3$a,test3$V1,FUN=sum)
test3<-subset(test3,test3$b==10)

test3$V5<-((2^(test3$V3)-1)/log2(1+test3$V4))
test3$V6<-ave(test3$V5,test3$V1,FUN=sum)
test4<-subset(test3,test3$V4<2)
V7=prec2$V9
test4<-cbind(test4,V7)
test4$V8<-test4$V7/test4$V6
mean(test4$V8)


##############################################
test3<-test2[ave(-test2$V3, test2$V1, FUN = rank) <= 2, ]
max(test3$V1)
