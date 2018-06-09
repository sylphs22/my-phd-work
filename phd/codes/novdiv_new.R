#similar=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/novelty/novelty/dump.txt",header=F, skip=" ")
similar1.2_0.1=similar[1:10999,]
similar1.4_0.1=similar[11000:21998,]
similar1.6_0.1=similar[21999:32997,]
similar1.8_0.1=similar[32998:43996,]
similar2_0.1=similar[43997:54995,]
####################################################
similar1.2_0.2=similar[54996:65994,]
similar1.4_0.2=similar[65995:76993,]
similar1.6_0.2=similar[76994:87992,]
similar1.8_0.2=similar[87993:98991,]
similar2_0.2=similar[98992:109990,]
####################################################
similar1.2_0.3=similar[109991:120989,]
similar1.4_0.3=similar[120990:131988,]
similar1.6_0.3=similar[131989:142987,]
similar1.8_0.3=similar[142988:153986,]
similar2_0.3=similar[153987:164985,]
##################################################
similar1.2_0.4=similar[164986:175984,]
similar1.4_0.4=similar[175985:186983,]
similar1.6_0.4=similar[186984:197982,]
similar1.8_0.4=similar[197983:208981,]
similar2_0.4=similar[208982:219980,]
######################################################
similar1.2_0.5=similar[219981:230979,]
similar1.4_0.5=similar[230980:241978,]
similar1.6_0.5=similar[241979:252977,]
similar1.8_0.5=similar[252978:263976,]
similar2_0.5=similar[263977:274975,]
####################################################
#similar=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/boolean/boolean/Similarity_dump.txt",header=F, skip=" ")
#data=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/personality/personality/dump.txt",header=F,sep='\t')
data_test<-read.table("C:/Users/bip/Desktop/thesis/data/amazon/test1.txt")
data_train<-read.table("C:/Users/bip/Desktop/thesis/data/amazon/train1.txt")
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
prec_5$V6<-ifelse(prec_5$v5<2,1,0)
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
prec_10$V6<-ifelse(prec_10$v5<2,1,0)
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
prec_5$V6<-ifelse(prec_5$v5<2,1,0)
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
prec_10$V6<-ifelse(prec_10$v5<2,1,0)
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
prec_5$V6<-ifelse(prec_5$v5<2,1,0)
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
prec_10$V6<-ifelse(prec_10$v5<2,1,0)
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
prec_5$V6<-ifelse(prec_5$v5<2,1,0)
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
prec_10$V6<-ifelse(prec_10$v5<2,1,0)
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
prec_5$V6<-ifelse(prec_5$v5<2,1,0)
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
prec_10$V6<-ifelse(prec_10$v5<2,1,0)
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
write.csv(out,"C:/Users/bip/Desktop/expnov/novdiv0.6_3.csv")
########################################################################### 
similar=data.table(similar1.2_0.2,key=c("V1","V2"))
prec <- similar[data, nomatch=0]
prec=prec[order(V1,-V3),]
prec_5<-prec[ave(-prec$V3, prec$V1, FUN = rank) <= 5, ]
precision_5=mean(prec_5$V4)
prec_5$V6<-ifelse(prec_5$v5<2,1,0)
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
prec_10$V6<-ifelse(prec_10$v5<2,1,0)
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
prec_5$V6<-ifelse(prec_5$v5<2,1,0)
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
prec_10$V6<-ifelse(prec_10$v5<2,1,0)
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
prec_5$V6<-ifelse(prec_5$v5<2,1,0)
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
prec_10$V6<-ifelse(prec_10$v5<2,1,0)
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
prec_5$V6<-ifelse(prec_5$v5<2,1,0)
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
prec_10$V6<-ifelse(prec_10$v5<2,1,0)
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
prec_5$V6<-ifelse(prec_5$v5<2,1,0)
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
prec_10$V6<-ifelse(prec_10$v5<2,1,0)
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
write.csv(out,"C:/Users/bip/Desktop/expnov/novdiv0.7_3.csv")
########################################################################### 
similar=data.table(similar1.2_0.3,key=c("V1","V2"))
prec <- similar[data, nomatch=0]
prec=prec[order(V1,-V3),]
prec_5<-prec[ave(-prec$V3, prec$V1, FUN = rank) <= 5, ]
precision_5=mean(prec_5$V4)
prec_5$V6<-ifelse(prec_5$v5<2,1,0)
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
prec_10$V6<-ifelse(prec_10$v5<2,1,0)
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
prec_5$V6<-ifelse(prec_5$v5<2,1,0)
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
prec_10$V6<-ifelse(prec_10$v5<2,1,0)
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
prec_5$V6<-ifelse(prec_5$v5<2,1,0)
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
prec_10$V6<-ifelse(prec_10$v5<2,1,0)
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
prec_5$V6<-ifelse(prec_5$v5<2,1,0)
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
prec_10$V6<-ifelse(prec_10$v5<2,1,0)
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
prec_5$V6<-ifelse(prec_5$v5<2,1,0)
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
prec_10$V6<-ifelse(prec_10$v5<2,1,0)
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
write.csv(out,"C:/Users/bip/Desktop/expnov/novdiv0.8_3.csv")
########################################################################### 
similar=data.table(similar1.2_0.4,key=c("V1","V2"))
prec <- similar[data, nomatch=0]
prec=prec[order(V1,-V3),]
prec_5<-prec[ave(-prec$V3, prec$V1, FUN = rank) <= 5, ]
precision_5=mean(prec_5$V4)
prec_5$V6<-ifelse(prec_5$v5<2,1,0)
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
prec_10$V6<-ifelse(prec_10$v5<2,1,0)
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
prec_5$V6<-ifelse(prec_5$v5<2,1,0)
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
prec_10$V6<-ifelse(prec_10$v5<2,1,0)
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
prec_5$V6<-ifelse(prec_5$v5<2,1,0)
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
prec_10$V6<-ifelse(prec_10$v5<2,1,0)
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
prec_5$V6<-ifelse(prec_5$v5<2,1,0)
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
prec_10$V6<-ifelse(prec_10$v5<2,1,0)
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
prec_5$V6<-ifelse(prec_5$v5<2,1,0)
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
prec_10$V6<-ifelse(prec_10$v5<2,1,0)
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
write.csv(out,"C:/Users/bip/Desktop/expnov/novdiv0.9_3.csv")
########################################################################### 
similar=data.table(similar1.2_0.5,key=c("V1","V2"))
prec <- similar[data, nomatch=0]
prec=prec[order(V1,-V3),]
prec_5<-prec[ave(-prec$V3, prec$V1, FUN = rank) <= 5, ]
precision_5=mean(prec_5$V4)
prec_5$V6<-ifelse(prec_5$v5<2,1,0)
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
prec_10$V6<-ifelse(prec_10$v5<2,1,0)
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
prec_5$V6<-ifelse(prec_5$v5<2,1,0)
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
prec_10$V6<-ifelse(prec_10$v5<2,1,0)
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
prec_5$V6<-ifelse(prec_5$v5<2,1,0)
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
prec_10$V6<-ifelse(prec_10$v5<2,1,0)
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
prec_5$V6<-ifelse(prec_5$v5<2,1,0)
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
prec_10$V6<-ifelse(prec_10$v5<2,1,0)
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
prec_5$V6<-ifelse(prec_5$v5<2,1,0)
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
prec_10$V6<-ifelse(prec_10$v5<2,1,0)
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
write.csv(out,"C:/Users/bip/Desktop/expnov/novdiv0.5_3.csv")
########################################################################### 
