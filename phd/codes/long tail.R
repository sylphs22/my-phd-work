#tail=read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u.data")
tail<-amazon3
tail$V5<-ifelse(tail$V3>0,1,0)
tail$V6<-ave(tail$V5,tail$V2,FUN=sum)
max(tail$V6)
tail1<-tail[!duplicated(tail[2]),]
tail1 <- tail1[order(-tail1$V6),]
a=c(1:1682)
a=data.frame(a)

tail1<-cbind(tail1,a)
tail1$a=NULL
tail1$a.1=NULL
library(ggplot2)
ltail<-data.frame(items=as.factor(tail1$a),pop=as.numeric(tail1$V6))
ggplot(ltail,aes(items,pop))+geom_area()
qplot(as.factor(tail1$a),tail1$V6)

