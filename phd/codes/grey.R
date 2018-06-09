fac<-read.csv("C:/Users/bip/Desktop/Abhishek/greyship/factor.csv",header = F)

fact<-abs(fac[,2:11])
RowVar <- function(x) {
  rowSums((x - rowMeans(x))^2)/(dim(x)[2] - 1)
}
fact$var<-RowVar(fact)
fact$mean<-rowMeans(fact)
max(fact$mean)
min(fact$mean)
max(fact$var)
min(fact$var)
newfact<-subset(fact,var<0.0099)
a<-max(newfact$mean)
newfac<-subset(newfact,mean==a)
