similar=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/novelty/novelty/dump.txt",header=F, skip=" ")
similar1=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/novelty/novelty/dump.txt",header=F, skip=" ")
#similar<-similar1[500001:900000,]
similar<-similar1[1:500000,]
similar1.2_0.1=similar[1:20000,]
similar1.4_0.1=similar[20001:40000,]
similar1.6_0.1=similar[40001:60000,]
similar1.8_0.1=similar[60001:80000,]
similar2_0.1=similar[80001:100000,]
####################################################
similar1.2_0.2=similar[100001:120000,]
similar1.4_0.2=similar[120001:140000,]
similar1.6_0.2=similar[140001:160000,]
similar1.8_0.2=similar[160001:180000,]
similar2_0.2=similar[180001:200000,]
####################################################
similar1.2_0.3=similar[200001:220000,]
similar1.4_0.3=similar[220001:240000,]
similar1.6_0.3=similar[240001:260000,]
similar1.8_0.3=similar[260001:280000,]
similar2_0.3=similar[280001:300000,]
##################################################
similar1.2_0.4=similar[300001:320000,]
similar1.4_0.4=similar[320001:340000,]
similar1.6_0.4=similar[340001:360000,]
similar1.8_0.4=similar[360001:380000,]
similar2_0.4=similar[380001:400000,]
######################################################
similar1.2_0.5=similar[400001:420000,]
similar1.4_0.5=similar[420001:440000,]
similar1.6_0.5=similar[440001:460000,]
similar1.8_0.5=similar[460001:480000,]
similar2_0.5=similar[480001:500000,]
####################################################
#similar=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/boolean/boolean/Similarity_dump.txt",header=F, skip=" ")
#data=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/personality/personality/dump.txt",header=F,sep='\t')
data_test<-read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u1.test")
#data_test<-read.table("C:/Users/bip/Desktop/thesis/data/amazon/test1.txt")
data_train<-read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u1.base")
#data_train<-read.table("C:/Users/bip/Desktop/thesis/data/amazon/train1.txt")
data<-subset(data_train,data_train$V3>0)
data<-rbind(data,data_test)
#data1<-read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/novelty/novelty/similar.txt",header=F, skip=" ")
data$V4=NULL
data$V1=data$V1-1
data$V2=data$V2-1
data$V4<-ifelse(data$V3>4,1,0)
data$v5<-ave(data$V4,data$V2,FUN=sum)
library(data.table)
data=data.table(data,key=c("V1","V2"))
similar=data.table(similar1.2_0.1,key=c("V1","V2"))
prec <- similar[data, nomatch=0]
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

#out<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#ou1t<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
out2<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out3<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out4<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out5<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out6<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)

#out<-rbind(out2,out3,out4,out5,out6)
#write.csv(out,"C:/Users/bip/Desktop/expnov/novdive0.1_2.csv")
###########################################################################  
#similar=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/boolean/boolean/Similarity_dump.txt",header=F, skip=" ")
#data=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/personality/personality/dump.txt",header=F,sep='\t')
#data<-read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u5.test")
#data1<-read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/novelty/novelty/similar.txt",header=F, skip=" ")
#data$V4=NULL
#data$V1=data$V1-1
#data$V2=data$V2-1
#data=data.table(data,key=c("V1","V2"))
similar=data.table(similar1.4_0.1,key=c("V1","V2"))
prec <- similar[data, nomatch=0]
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

#out<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#ou1t<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out2<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
out3<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out4<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out5<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out6<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)

#out<-rbind(out2,out3,out4,out5,out6)
#write.csv(out,"C:/Users/bip/Desktop/expnov/novdiv0.6_1.csv")
########################################################################### 
#similar=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/boolean/boolean/Similarity_dump.txt",header=F, skip=" ")
#data=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/personality/personality/dump.txt",header=F,sep='\t')
#data<-read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u5.test")
#data1<-read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/novelty/novelty/similar.txt",header=F, skip=" ")
#data$V4=NULL
#data$V1=data$V1-1
#data$V2=data$V2-1
#data=data.table(data,key=c("V1","V2"))
similar=data.table(similar1.6_0.1,key=c("V1","V2"))
prec <- similar[data, nomatch=0]
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

#out<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#ou1t<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out2<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out3<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
out4<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out5<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out6<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)

#out<-rbind(out2,out3,out4,out5,out6)
#write.csv(out,"C:/Users/bip/Desktop/expnov/novdiv0.6_1.csv")
########################################################################### 
#similar=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/boolean/boolean/Similarity_dump.txt",header=F, skip=" ")
#data=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/personality/personality/dump.txt",header=F,sep='\t')
#data<-read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u5.test")
#data1<-read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/novelty/novelty/similar.txt",header=F, skip=" ")
#data$V4=NULL
#data$V1=data$V1-1
#data$V2=data$V2-1
#data=data.table(data,key=c("V1","V2"))
similar=data.table(similar1.8_0.1,key=c("V1","V2"))
prec <- similar[data, nomatch=0]
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

#out<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#ou1t<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out2<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out3<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out4<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
out5<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out6<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)

#out<-rbind(out2,out3,out4,out5,out6)
#write.csv(out,"C:/Users/bip/Desktop/expnov/novdiv0.6_1.csv")
########################################################################### 
#similar=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/boolean/boolean/Similarity_dump.txt",header=F, skip=" ")
#data=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/personality/personality/dump.txt",header=F,sep='\t')
#data<-read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u5.test")
#data1<-read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/novelty/novelty/similar.txt",header=F, skip=" ")
#data$V4=NULL
#data$V1=data$V1-1
#data$V2=data$V2-1
#data=data.table(data,key=c("V1","V2"))
similar=data.table(similar2_0.1,key=c("V1","V2"))
prec <- similar[data, nomatch=0]
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

#out<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#ou1t<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#5<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
out6<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)

out<-rbind(out2,out3,out4,out5,out6)
write.csv(out,"C:/Users/bip/Desktop/expnov/novdiv0.1_5.csv")
########################################################################### 
similar=data.table(similar1.2_0.2,key=c("V1","V2"))
prec <- similar[data, nomatch=0]
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

#out<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#ou1t<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
out2<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out3<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out4<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out5<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out6<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)

#out<-rbind(out2,out3,out4,out5,out6)
#write.csv(out,"C:/Users/bip/Desktop/expnov/novdiv0.1_5.csv")
###########################################################################  
#similar=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/boolean/boolean/Similarity_dump.txt",header=F, skip=" ")
#data=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/personality/personality/dump.txt",header=F,sep='\t')
#data<-read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u5.test")
#data1<-read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/novelty/novelty/similar.txt",header=F, skip=" ")
#data$V4=NULL
#data$V1=data$V1-1
#data$V2=data$V2-1
#data=data.table(data,key=c("V1","V2"))
similar=data.table(similar1.4_0.2,key=c("V1","V2"))
prec <- similar[data, nomatch=0]
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

#out<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#ou1t<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out2<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
out3<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out4<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out5<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out6<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)

#out<-rbind(out2,out3,out4,out5,out6)
#write.csv(out,"C:/Users/bip/Desktop/expnov/novdiv0.6_1.csv")
########################################################################### 
#similar=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/boolean/boolean/Similarity_dump.txt",header=F, skip=" ")
#data=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/personality/personality/dump.txt",header=F,sep='\t')
#data<-read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u5.test")
#data1<-read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/novelty/novelty/similar.txt",header=F, skip=" ")
#data$V4=NULL
#data$V1=data$V1-1
#data$V2=data$V2-1
#data=data.table(data,key=c("V1","V2"))
similar=data.table(similar1.6_0.2,key=c("V1","V2"))
prec <- similar[data, nomatch=0]
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

#out<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#ou1t<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out2<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out3<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
out4<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out5<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out6<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)

#out<-rbind(out2,out3,out4,out5,out6)
#write.csv(out,"C:/Users/bip/Desktop/expnov/novdiv0.6_1.csv")
########################################################################### 
#similar=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/boolean/boolean/Similarity_dump.txt",header=F, skip=" ")
#data=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/personality/personality/dump.txt",header=F,sep='\t')
#data<-read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u5.test")
#data1<-read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/novelty/novelty/similar.txt",header=F, skip=" ")
#data$V4=NULL
#data$V1=data$V1-1
#data$V2=data$V2-1
#data=data.table(data,key=c("V1","V2"))
similar=data.table(similar1.8_0.2,key=c("V1","V2"))
prec <- similar[data, nomatch=0]
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

#out<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#ou1t<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out2<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out3<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out4<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
out5<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out6<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)

#out<-rbind(out2,out3,out4,out5,out6)
#write.csv(out,"C:/Users/bip/Desktop/expnov/novdiv0.6_1.csv")
########################################################################### 
#similar=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/boolean/boolean/Similarity_dump.txt",header=F, skip=" ")
#data=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/personality/personality/dump.txt",header=F,sep='\t')
#data<-read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u5.test")
#data1<-read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/novelty/novelty/similar.txt",header=F, skip=" ")
#data$V4=NULL
#data$V1=data$V1-1
#data$V2=data$V2-1
#data=data.table(data,key=c("V1","V2"))
similar=data.table(similar2_0.2,key=c("V1","V2"))
prec <- similar[data, nomatch=0]
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

#out<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#ou1t<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#5<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
out6<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)

out<-rbind(out2,out3,out4,out5,out6)
write.csv(out,"C:/Users/bip/Desktop/expnov/novdiv0.2_5.csv")
########################################################################### 
similar=data.table(similar1.2_0.3,key=c("V1","V2"))
prec <- similar[data, nomatch=0]
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

#out<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#ou1t<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
out2<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out3<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out4<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out5<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out6<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)

#out<-rbind(out2,out3,out4,out5,out6)
#write.csv(out,"C:/Users/bip/Desktop/expnov/novdiv0.1_5.csv")
###########################################################################  
#similar=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/boolean/boolean/Similarity_dump.txt",header=F, skip=" ")
#data=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/personality/personality/dump.txt",header=F,sep='\t')
#data<-read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u5.test")
#data1<-read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/novelty/novelty/similar.txt",header=F, skip=" ")
#data$V4=NULL
#data$V1=data$V1-1
#data$V2=data$V2-1
#data=data.table(data,key=c("V1","V2"))
similar=data.table(similar1.4_0.3,key=c("V1","V2"))
prec <- similar[data, nomatch=0]
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

#out<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#ou1t<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out2<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
out3<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out4<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out5<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out6<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)

#out<-rbind(out2,out3,out4,out5,out6)
#write.csv(out,"C:/Users/bip/Desktop/expnov/novdiv0.6_1.csv")
########################################################################### 
#similar=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/boolean/boolean/Similarity_dump.txt",header=F, skip=" ")
#data=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/personality/personality/dump.txt",header=F,sep='\t')
#data<-read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u5.test")
#data1<-read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/novelty/novelty/similar.txt",header=F, skip=" ")
#data$V4=NULL
#data$V1=data$V1-1
#data$V2=data$V2-1
#data=data.table(data,key=c("V1","V2"))
similar=data.table(similar1.6_0.3,key=c("V1","V2"))
prec <- similar[data, nomatch=0]
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

#out<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#ou1t<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out2<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out3<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
out4<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out5<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out6<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)

#out<-rbind(out2,out3,out4,out5,out6)
#write.csv(out,"C:/Users/bip/Desktop/expnov/novdiv0.6_1.csv")
########################################################################### 
#similar=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/boolean/boolean/Similarity_dump.txt",header=F, skip=" ")
#data=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/personality/personality/dump.txt",header=F,sep='\t')
#data<-read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u5.test")
#data1<-read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/novelty/novelty/similar.txt",header=F, skip=" ")
#data$V4=NULL
#data$V1=data$V1-1
#data$V2=data$V2-1
#data=data.table(data,key=c("V1","V2"))
similar=data.table(similar1.8_0.3,key=c("V1","V2"))
prec <- similar[data, nomatch=0]
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

#out<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#ou1t<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out2<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out3<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out4<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
out5<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out6<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)

#out<-rbind(out2,out3,out4,out5,out6)
#write.csv(out,"C:/Users/bip/Desktop/expnov/novdiv0.6_1.csv")
########################################################################### 
#similar=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/boolean/boolean/Similarity_dump.txt",header=F, skip=" ")
#data=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/personality/personality/dump.txt",header=F,sep='\t')
#data<-read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u5.test")
#data1<-read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/novelty/novelty/similar.txt",header=F, skip=" ")
#data$V4=NULL
#data$V1=data$V1-1
#data$V2=data$V2-1
#data=data.table(data,key=c("V1","V2"))
similar=data.table(similar2_0.3,key=c("V1","V2"))
prec <- similar[data, nomatch=0]
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

#out<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#ou1t<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#5<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
out6<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)

out<-rbind(out2,out3,out4,out5,out6)
write.csv(out,"C:/Users/bip/Desktop/expnov/novdiv0.3_5.csv")
########################################################################### 
similar=data.table(similar1.2_0.4,key=c("V1","V2"))
prec <- similar[data, nomatch=0]
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

#out<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#ou1t<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
out2<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out3<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out4<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out5<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out6<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)

#out<-rbind(out2,out3,out4,out5,out6)
#write.csv(out,"C:/Users/bip/Desktop/expnov/novdiv0.1_5.csv")
###########################################################################  
#similar=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/boolean/boolean/Similarity_dump.txt",header=F, skip=" ")
#data=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/personality/personality/dump.txt",header=F,sep='\t')
#data<-read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u5.test")
#data1<-read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/novelty/novelty/similar.txt",header=F, skip=" ")
#data$V4=NULL
#data$V1=data$V1-1
#data$V2=data$V2-1
#data=data.table(data,key=c("V1","V2"))
similar=data.table(similar1.4_0.4,key=c("V1","V2"))
prec <- similar[data, nomatch=0]
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

#out<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#ou1t<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out2<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
out3<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out4<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out5<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out6<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)

#out<-rbind(out2,out3,out4,out5,out6)
#write.csv(out,"C:/Users/bip/Desktop/expnov/novdiv0.6_1.csv")
########################################################################### 
#similar=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/boolean/boolean/Similarity_dump.txt",header=F, skip=" ")
#data=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/personality/personality/dump.txt",header=F,sep='\t')
#data<-read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u5.test")
#data1<-read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/novelty/novelty/similar.txt",header=F, skip=" ")
#data$V4=NULL
#data$V1=data$V1-1
#data$V2=data$V2-1
#data=data.table(data,key=c("V1","V2"))
similar=data.table(similar1.6_0.4,key=c("V1","V2"))
prec <- similar[data, nomatch=0]
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

#out<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#ou1t<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out2<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out3<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
out4<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out5<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out6<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)

#out<-rbind(out2,out3,out4,out5,out6)
#write.csv(out,"C:/Users/bip/Desktop/expnov/novdiv0.6_1.csv")
########################################################################### 
#similar=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/boolean/boolean/Similarity_dump.txt",header=F, skip=" ")
#data=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/personality/personality/dump.txt",header=F,sep='\t')
#data<-read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u5.test")
#data1<-read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/novelty/novelty/similar.txt",header=F, skip=" ")
#data$V4=NULL
#data$V1=data$V1-1
#data$V2=data$V2-1
#data=data.table(data,key=c("V1","V2"))
similar=data.table(similar1.8_0.4,key=c("V1","V2"))
prec <- similar[data, nomatch=0]
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

#out<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#ou1t<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out2<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out3<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out4<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
out5<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out6<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)

#out<-rbind(out2,out3,out4,out5,out6)
#write.csv(out,"C:/Users/bip/Desktop/expnov/novdiv0.6_1.csv")
########################################################################### 
#similar=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/boolean/boolean/Similarity_dump.txt",header=F, skip=" ")
#data=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/personality/personality/dump.txt",header=F,sep='\t')
#data<-read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u5.test")
#data1<-read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/novelty/novelty/similar.txt",header=F, skip=" ")
#data$V4=NULL
#data$V1=data$V1-1
#data$V2=data$V2-1
#data=data.table(data,key=c("V1","V2"))
similar=data.table(similar2_0.4,key=c("V1","V2"))
prec <- similar[data, nomatch=0]
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

#out<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#ou1t<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#5<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
out6<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)

out<-rbind(out2,out3,out4,out5,out6)
write.csv(out,"C:/Users/bip/Desktop/expnov/novdiv0.4_5.csv")
########################################################################### 
similar=data.table(similar1.2_0.5,key=c("V1","V2"))
prec <- similar[data, nomatch=0]
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

#out<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#ou1t<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
out2<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out3<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out4<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out5<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out6<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)

#out<-rbind(out2,out3,out4,out5,out6)
#write.csv(out,"C:/Users/bip/Desktop/expnov/novdiv0.1_5.csv")
###########################################################################  
#similar=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/boolean/boolean/Similarity_dump.txt",header=F, skip=" ")
#data=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/personality/personality/dump.txt",header=F,sep='\t')
#data<-read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u5.test")
#data1<-read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/novelty/novelty/similar.txt",header=F, skip=" ")
#data$V4=NULL
#data$V1=data$V1-1
#data$V2=data$V2-1
#data=data.table(data,key=c("V1","V2"))
similar=data.table(similar1.4_0.5,key=c("V1","V2"))
prec <- similar[data, nomatch=0]
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

#out<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#ou1t<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out2<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
out3<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out4<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out5<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out6<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)

#out<-rbind(out2,out3,out4,out5,out6)
#write.csv(out,"C:/Users/bip/Desktop/expnov/novdiv0.6_1.csv")
########################################################################### 
#similar=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/boolean/boolean/Similarity_dump.txt",header=F, skip=" ")
#data=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/personality/personality/dump.txt",header=F,sep='\t')
#data<-read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u5.test")
#data1<-read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/novelty/novelty/similar.txt",header=F, skip=" ")
#data$V4=NULL
#data$V1=data$V1-1
#data$V2=data$V2-1
#data=data.table(data,key=c("V1","V2"))
similar=data.table(similar1.6_0.5,key=c("V1","V2"))
prec <- similar[data, nomatch=0]
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

#out<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#ou1t<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out2<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out3<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
out4<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out5<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out6<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)

#out<-rbind(out2,out3,out4,out5,out6)
#write.csv(out,"C:/Users/bip/Desktop/expnov/novdiv0.6_1.csv")
########################################################################### 
#similar=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/boolean/boolean/Similarity_dump.txt",header=F, skip=" ")
#data=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/personality/personality/dump.txt",header=F,sep='\t')
#data<-read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u5.test")
#data1<-read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/novelty/novelty/similar.txt",header=F, skip=" ")
#data$V4=NULL
#data$V1=data$V1-1
#data$V2=data$V2-1
#data=data.table(data,key=c("V1","V2"))
similar=data.table(similar1.8_0.5,key=c("V1","V2"))
prec <- similar[data, nomatch=0]
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

#out<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#ou1t<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out2<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out3<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out4<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
out5<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#out6<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)

#out<-rbind(out2,out3,out4,out5,out6)
#write.csv(out,"C:/Users/bip/Desktop/expnov/novdiv0.6_1.csv")
########################################################################### 
#similar=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/boolean/boolean/Similarity_dump.txt",header=F, skip=" ")
#data=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/personality/personality/dump.txt",header=F,sep='\t')
#data<-read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u5.test")
#data1<-read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/novelty/novelty/similar.txt",header=F, skip=" ")
#data$V4=NULL
#data$V1=data$V1-1
#data$V2=data$V2-1
#data=data.table(data,key=c("V1","V2"))
similar=data.table(similar2_0.5,key=c("V1","V2"))
prec <- similar[data, nomatch=0]
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

#out<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#ou1t<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
#5<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)
out6<-cbind(precision_5,precision_10,novelty_5,novelty_10,diversity_5,diversity_10)

out<-rbind(out2,out3,out4,out5,out6)
write.csv(out,"C:/Users/bip/Desktop/expnov/novdiv0.5_5.csv")
########################################################################### 
