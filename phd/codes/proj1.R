mec=read.table("F:/score.txt",header=T,sep='\t')
data=read.table("C:/Users/bipul/Desktop/project/industry.csv",sep=',',header=T)
#d=read.table("C:/Users/bipul/Desktop/project/DV_PCA.dat",sep='\t',header=T)
dat<-subset(data,data[,3]=='2012-13')
dat<-dat[,4:11]
clust<-kmeans(dat,6)
clust
data$V12=ifelse(data$FV01=='',0,1)
data$V13<-ave(data$V12,data$CO,FUN=cumsum)
data=data[order(data$V13),]
dat1<-cbind(data,clust$cluster)
write.csv(dat1,"C:/Users/bipul/Desktop/project/industry.csv")
#################end########################################
set.seed(124)
dat<-c()
datcl<-c()
gp<-c()
cl<-c()
for(i in 1:22){
  #if (data[,13]==i){
  dat<-subset(data,data[,3]=='2012-13')
  dat1<-scale(dat[,4:11])
  data1<-dat[,1:3]
  datcl<-rbind(dat1,datcl) 
  gp<-rbind(gp,data1)
}
dat1<-cbind(gp,datcl)

dat=dat[order(dat$YR),]
data=(d[,12:14])
data=data.frame(dat)
data=cbind(dat[,1:3],data)
data=data[order(data$V13),]
dat2<-c()
dat2$V1<-ave(data$FV01,data$CO,FUN=mean)
dat2=data.frame(dat2)
dat2$V2<-ave(data$FV02,data$CO,FUN=mean)
dat2$V3<-ave(data$FV03,data$CO,FUN=mean)
dat2$V4<-ave(data$FV04,data$CO,FUN=mean)
dat2$V5<-ave(data$FV05,data$CO,FUN=mean)
dat2$V6<-ave(data$FV06,data$CO,FUN=mean)
dat2$V7<-ave(data$FV07,data$CO,FUN=mean)
dat2$V8<-ave(data$FV08,data$CO,FUN=mean)
dat2=dat2[1:43,]
dat2<-dat[,4:5]
clust<-kmeans(dat2,3)
data3<-cbind(data,clust$cluster)
dat1<-cbind(data,clust$cluster)
write.csv(dat1,"C:/Users/bipul/Desktop/project/industry.csv")

mec<-read.table("C:/Users/bipul/Desktop/project/analysis using pca.txt",sep='\t',header=T)
#####################################
mec1=mec[,9:10]
cluster<-kmeans(mec1,3)
mec=cbind(mec[4:10],cluster$cluster)
mec$cluster$cluster=as.factor(mec$cluster$cluster)
str(mec)
model1<-lm(log(D1)~I1,data=mec)
mec$D3=log(mec$D1,10)
summary(model1)
##############################
data1<-read.csv("C:/Users/bipul/Desktop/project/macro.csv",sep=',',header=T)
library(mefa)
data2<-rbind(data2,data1)
data2$YR=NULL
dat2=cbind(data1,clust$cluster)
write.csv(dat2,"C:/Users/bipul/Desktop/project/macro.csv")
library(DMwR) #for imputation
mec1=scale(mec1,center=T,scale=T)
mec1=matrix(as.numeric(mec1),22,61)
mec1=data.frame(mec1)
mec1=knnImputation(mec1,k=1)#### imputation
write.csv(mec1,"C:/Users/bipul/Desktop/project/macro.csv")
##########################################################################
Final=read.table("C:/Users/bipul/Desktop/project/final.txt",sep='\t',header=T)
model1<-lm(cbind(V1,V2,V3)~I1+I2+I3+I4+I5,data=Final)
summary(model1)
det(mec1matrix)
library(psych)
# print out the correlation matrix but ask for numbers to 4 decimal places
# bartlett test - want a small p value here to indicate c0rrelation matrix not zeros
cortest.bartlett(mec1matrix)
# unable to calculate the kmo - see field 2012 p776
# but can do the determinant need it to be above 0.00001
# to be able to continue
det(hozdatamatrix)
# appropriate value therefore can continue
# do a pca analysis use the principal function in the psych package
model2<- principal(mec1, nfactors = 2, rotate = "none")
model1<- prcomp(mec1,center=T,scale=T,nfactors=2)##, nfactors = 6, rotate = "none")



