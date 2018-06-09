library(data.table)
data1=fread("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/clustering/clustering/CL_in.txt",header=F)
data1$V2072=NULL
data1$V1509=NULL
data<-read.table("C:/Users/bip/Desktop/ml100/ml100.txt")
data=as.matrix(data1)
mydata=t(data)
d.correlation <- as.dist(cosine(data))
library(cluster)
set.seed(1234)
clusters<-pam(d.correlation,k=20,diss=T)
#data=t(data)
#library(biganalytics)
clusters <- kmeans(data,3)
clusters1<-kmeans(data,50)
#library(data.table)
u<-0:94
cl<-clusters$cluster
mydata <- cbind(mydata,cl)
mydata1 <- data.frame(data, clusters1$cluster)
#library(ff)
#mydata <- as.ffdf(mydata)
#mydata1 <- as.ffdf(mydata1)
write.table(mydata,row.names=FALSE,col.names=F, "E:/gs.txt", sep="\t")

write.table(mydata,row.names=FALSE,col.names=FALSE, "E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/clustering/clustering/CL_in45.txt", sep="\t")
write.table(mydata1,row.names=FALSE,col.names=FALSE, "E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/clustering/clustering/CL_in50.txt", sep="\t")

#####################################################################################
library(lsa)
data=t(data)
data=as.matrix(data)
similarity<-cosine(data)
data=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/dump1.txt",header=F)
library(propagate)
data=t(data)
d1<-data[1:3,1:2]
d<-as.matrix(d)
d=cor(data,use="complete.obs")
d[is.na(d)] <- 0
d[d == 1] <- 0
d <- as.ffdf(d)
#similarity=ifelse(similarity=='NA',0,similarity)
#similarity<-cor(data,use="pairwise.complete.obs")
#//,use="pairwise.complete.obs"))
write.table(d,row.names=FALSE,col.names=FALSE, "E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/clustering/clustering/similar.txt", sep="\t")
######################################
data1=read.table("E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/clustering/clustering/CL_in.txt")
data2=subset(data1,data1$V1683==73)
min(similarity)
mydata[1:5,1680:1683]
out1=mydata[mydata[, "clusters.cluster"] == 8,]
mydata=t(mydata)
mydata=as.matrix(mydata)
out1=t(out1)
colnames(out1) <- 1:934
rownames(mydata) <- 1:1683
library(reshape2)
mydata.m <- melt(out1)
mydata[1:5,1680:1683]
out <- split(mydata ,mydata$V1683)
write.table(mydata,row.names=FALSE,col.names=FALSE, "E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/clustering/clustering/CL_in.txt", sep="\t")

library(data.table)
cluster[20]=NULL
for (i in 1:20){cluster[[i]]=data.table(out[[i]]) }
for (i in 1:20){
  fl <- paste0("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/", i, ".txt")
write.table(cluster[[i]], fl,  
            col.names = FALSE, row.names = FALSE, sep = "\t", quote = FALSE)}
data1=read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/1.txt")
cor(data1)
