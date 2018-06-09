#install.packages("coop")
library(coop)
cosine <- function(x)
{
  cp <- crossprod(x)
  rtdg <- sqrt(diag(cp))
  cos <- cp / tcrossprod(rtdg)
  return(cos)
}
library(data.table)
data<-fread("drama.txt")
data$V3953<-NULL
data<-t(data)
cos<-cosine(data)
similarity=ifelse(cos==1,0,cos)
similarity[is.na(similarity)]<-0
write.csv(similarity,"drama.csv",sep=";",row.names = T,col.names = T)

