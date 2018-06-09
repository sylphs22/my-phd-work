data<-read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/nv/nv/data.txt",header=F)
newdata <- data[order(data$V1, data$V2),]
newdata$V1<-factor(newdata$V1)
newdata$V1<-as.numeric(newdata$V1)
newdata$V2<-factor(newdata$V2)
newdata$V2<-as.numeric(newdata$V2)
data1=(cbind(newdata$V1,newdata$V2,newdata$V3,newdata$V10))
data1<-as.data.frame(data1)
data1$V4<-ifelse(data1$V4==-1,5,data1$V4)


a=1
d=cbind(newdata,a)

d$V31<-ave(d$a,d$V1,FUN=sum)
d1<-subset(d,V31>=2)
d1$V1<-factor(d1$V1)
d1$V1<-as.numeric(d1$V1)
d1$V0<-ave(d1$a,d1$V1,FUN=cumsum)
library(reshape2)
a0<-acast(d1,V1~V0,value.var="V2")
write.table(a0,row.names=F,col.names=F,"E:/context/item.txt",sep="\t")


a<-acast(d1,V1~V0,value.var="V3")
a<-ifelse(a==-1,0,a)
write.table(a,row.names=F,col.names=F,"E:/context/rating.txt",sep="\t")

b<-acast(d1,V1~V0,value.var="V8")
b<-ifelse(b==-1,0,b)
write.table(b,row.names=F,col.names=F,"E:/context/time.txt",sep="\t")

c<-acast(d1,V1~V0,value.var="V9")
c<-ifelse(c==-1,0,c)
write.table(c,row.names=F,col.names=F,"E:/context/dt.txt",sep="\t")

d<-acast(d1,V1~V0,value.var="V10")
d<-ifelse(d==-1,0,d)
write.table(d,row.names=F,col.names=F,"E:/context/season.txt",sep="\t")

e<-acast(d1,V1~V0,value.var="V11")
e<-ifelse(e==-1,0,e)
write.table(e,row.names=F,col.names=F,"E:/context/location.txt",sep="\t")

f<-acast(d1,V1~V0,value.var="V12")
f<-ifelse(f==-1,0,f)
write.table(f,row.names=F,col.names=F,"E:/context/weather.txt",sep="\t")

g<-acast(d1,V1~V0,value.var="V13")
g<-ifelse(g==-1,0,g)
write.table(g,row.names=F,col.names=F,"E:/context/social.txt",sep="\t")

h<-acast(d1,V1~V0,value.var="V14")
h<-ifelse(h==-1,0,h)
write.table(h,row.names=F,col.names=F,"E:/context/endemo.txt",sep="\t")

i<-acast(d1,V1~V0,value.var="V15")
i<-ifelse(i==-1,0,i)
write.table(i,row.names=F,col.names=F,"E:/context/dominantemo.txt",sep="\t")

j<-acast(d1,V1~V0,value.var="V16")
j<-ifelse(j==-1,0,j)
write.table(j,row.names=F,col.names=F,"E:/context/mood.txt",sep="\t")

k<-acast(d1,V1~V0,value.var="V17")
k<-ifelse(k==-1,0,k)
write.table(k,row.names=F,col.names=F,"E:/context/physical.txt",sep="\t")

l<-acast(d1,V1~V0,value.var="V18")
l<-ifelse(l==-1,0,l)
write.table(l,row.names=F,col.names=F,"E:/context/decision.txt",sep="\t")

m<-acast(d1,V1~V0,value.var="V19")
m<-ifelse(m==-1,0,m)
write.table(m,row.names=F,col.names=F,"E:/context/interaction.txt",sep="\t")


##########################
max(data$userID)
min(data$userID)
max(data$itemID)
min(data$userID)
