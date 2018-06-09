library(data.table)
train<-fread("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-1m/train1.txt",header=F)
test<-fread("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-1m/testdata1.txt",header=F)
data<-rbind(train,test)
test1<-fread("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-1m/test.txt",header=F)
test2<-test1
test2$V3<-0
mydata <- merge(data, test2, by=c("V1","V2"), all=TRUE) 
mydata[is.na(mydata)] <- 1
newd<-subset(mydata,mydata$V3.y==1)
d<-subset(mydata,mydata$V3.y==0)
newd$V3.y=NULL
d$V3.y=NULL
d$V3.x=0
newd1<-rbind(newd,d)
newd1=newd1[order(V1,V2),]
test2=test2[order(V1,V2),]
write.table(newd1,row.name=F,col.name=F,"E:/newd.txt")
t<-subset(newd1,newd1$V2==899)
m<-subset(newd1,newd1$V1==327)
