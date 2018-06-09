front<-read.csv("F:/frontier.csv",header=T)
front$ID<-as.numeric(front$CompanyName)
front1<-data.frame(front$ID,front[,2:9])
front1$Age<-NULL
front1$exports_earnings<-NULL
front1$NS<-NULL
library(frontier)
pfront<-plm.data(front1,c("front.ID","Year"))
prodCDSfa <- sfa(log(TI) ~ log(rmc) + log(NFA) + log(wages),data = pfront)
summary(prodCDSfa,extraPar=T)
pfront$effCD <- efficiencies( prodCDSfa,asInData = TRUE )
write.csv(pfront,"F:/front.csv")
data( "riceProdPhil" )
prodCDSfa$mu
prodCDSfa$eta
