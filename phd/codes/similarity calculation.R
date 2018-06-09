#data=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/dump1.txt",header=F)
data=read.table("C:/Users/bip/Desktop/Abhishek/95_1000_diff_sparse/95_1000_diff_sparse/95_1000_pers.txt",header=F)
#data=data[,36:47]#needs
data=data[,48:52]#values
#data=data[,1:35]#Big5
#d=as.matrix(dist(data, method = "euclidean", diag = FALSE, upper = T, p = 2))
#similarity1=1/d
#similarity=ifelse(similarity1=='Inf',0,similarity1)
#write.table(similarity1,row.names=FALSE,col.names=FALSE, "C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/similarity1.txt", sep="\t")

######################cosine###########################
library(lsa)
data=t(data)
data=as.matrix(data)
similarity<-cosine(data)
similarity=ifelse(similarity==1,0,similarity)
similarity_cos=ifelse(similarity=='NA',0,similarity)
write.table(similarity,row.names=FALSE,col.names=FALSE, "C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/similarity.txt", sep="\t")
############pearson correlation##############################
#data=t(data)
#d=cor(data,use="complete.obs")
#d[is.na(d)] <- 0
#d[d == 1] <- 0
#write.table(d,row.names=FALSE,col.names=FALSE, "C:/Users/bip/Documents/Visual Studio 2012/Projects/recommend/recommend/similarity.txt", sep="\t")
#library(akmeans)
set.seed(3)
clusters<-kmeans(data,4)
#clusters<-norm.sim.ksc(data,4)
u<-0:94
cl<-clusters$cluster
mydata <- cbind(data,cl,u)
uc<-mydata[,6:7]
uc=data.table(uc,key=c("u"))
Final2 <- Final1[uc, nomatch=0]
cl1<-subset(Final2,cl==1)
cl2<-subset(Final2,cl==2)
cl3<-subset(Final2,cl==3)
cl4<-subset(Final2,cl==4)
#cl5<-subset(Final2,cl==5)
RMSE1<-mean(cl1$MSE)
sqrt(RMSE1)
RMSE2<-mean(cl2$MSE)
sqrt(RMSE2)
RMSE3<-mean(cl3$MSE)
sqrt(RMSE3)
RMSE4<-mean(cl4$MSE)
sqrt(RMSE4)
#mean(cl5$MAE)
