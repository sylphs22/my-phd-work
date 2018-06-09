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
