
newd<-read.csv("C:/Users/bipul/Desktop/project/final1.csv",sep=',',header=T)
newd1<-read.table("C:/Users/bipul/Desktop/project/analysis using pca.txt",sep='\t',header=T)
library(DMwR)
newd1=knnImputation(newd1,k=1)
newd2=newd1[,3:63]
newd2=t(newd2)
# Determine number of clusters
wss <- (nrow(newd2)-1)*sum(apply(newd2,2,var))
nrow(newd2)
for (i in 2:22) wss[i] <- sum(kmeans(newd2,centers=i)$withinss)
plot(1:22, wss, type="b", xlab="Number of Clusters",
     ylab="Within groups sum of squares")
cl=kmeans(newd2,4)
newd3<-cbind(newd2,cl$cluster)
write.csv(newd3,"C:/Users/bipul/Desktop/project/IVcluster.csv")

library(mefa)
newd1<-newd1[1:22,]
newd1=data.frame(rep(newd1,12))
datanew<-cbind(newd[,1:3],newd1[,3:63],newd[,9:11])
datanew1<-datanew[,4:65]
library(pls)
library(MASS)
fit1<-lm(D1 ~ .,data=datanew1)
mod1<-stepAIC(fit1, direction="both") 
datanew2<-datanew[,4:66]
summary(mod1)
datanew1$D1=NULL
fit2<-lm(D2 ~ X61+X58+X30+X22,data=datanew2)
mod2 <-stepAIC(fit2, direction="backward") 
library(car)
vif(mod2)
summary(mod2)
summary(fit2)
vif(fit2)

############################TIME SERIES####################################################
library(plm)
data1<-datanew[,2:67]
data1<-newd[,2:10]
a<-as.character(data1$YR)
b<-substr(a,start=1,stop=4)
c<-data1$CO
d<-substr(c,start=2,stop=3)
data1$CO=NULL
data1$YR=NULL
data2=data1[1:44,]
data1=cbind(d,b,data1)
write.csv(data1,"C:/Users/bipul/Desktop/project/panel6.csv")
###################################PANEL##########################################


#########################################
plmtest(mod4, c("time"), type=("bp"))### p value<0.05 use mod3
pcdtest(mod4, test = c("lm"))### cross sectional dependence P>0.05 no CSD
pbgtest(mod4)### serial correlation test pvale>0.05 no serial correlation
library(lmtest)
library(tseries)
adf.test(data1$D1)## auto correlation
adf.test(data1$X17)
po.test(cbind(data1$D1,data1$X17,data1$X19,data1$X54))## panel cointegration
fixef(mod3) 
#######################################################################
library(textir)
data(we8there)

summary(mod3)
mod3

mod6<-pggls(D1~X17 +X19 +X54,index=c("d", "b"),data=data1,model="within")
fixef(mod6)
summary(mod6)
coeftest(mod6)

############################################################################
newd1<-read.table("C:/Users/bipul/Desktop/project/analysis using pca.txt",sep='\t',header=T)
dat<-read.csv("C:/Users/bipul/Desktop/project/industry.csv",sep=",",header=T)
dat1<-dat[1:22,]
newd1<-newd1[1:22,]
regr<-cbind(newd1[,3:63],dat1[,4:11])
regr1<-regr[,1:62]
model1<-lm(cbind(FV01,FV02,FV06,FV07)~X01+X03,data=regr)
summary(model1)library(plm)
data1<-read.csv("C:/Users/bipul/Desktop/project/panel1.csv",header=T)

######################################################################################
library(xlsx)
library(plm)
dat <- read.xlsx("C:/Users/bip/Desktop/project/econometricanalysis/CLUDTER_1/CLUDTER 1/newpanel1.xlsx", sheetName="ORIGINAL")
data1<-pdata.frame(dat, index = c("a", "b"), drop.index = TRUE, row.names = TRUE)
mod1<-plm(D1~I1+I2+I3+I4+I5,index=c("d", "b"),data=data1,model="random")
summary(mod1)
pdwtest(mod1)#Durbin watson test
mod2<-plm(D1~I1+I2+I3+I4+I5,index=c("d", "b"),data=data1,model="within",effect="individual")#,
summary(mod2)
pdwtest(mod2)#Durbin watson test
pFtest(mod2,mod1) # hausman test P value < 0.05 fixed effect better than random
mod3<-plm(D2~I1+I2+I3+I4+I5,index=c("d", "b"),data=data1,model="within",effect="individual")#,
summary(mod3)
pdwtest(mod3)#Durbin watson test
mod4<-plm(D2~I1+I2+I3+I4+I5,index=c("d", "b"),data=data1,model="random")
summary(mod4)
pdwtest(mod4)#Durbin watson test
pFtest(mod3,mod4) # hausman test P value < 0.05 fixed effect better than random
#############on differenced data##########################################
dat <- read.xlsx("C:/Users/bip/Desktop/project/econometricanalysis/CLUDTER_1/CLUDTER 1/newpanel1.xlsx", sheetName="DIFFERENCED")
data1<-pdata.frame(dat, index = c("a", "b"), drop.index = TRUE, row.names = TRUE)
mod1<-plm(D1~I1+I2+I3+I4+I5,index=c("d", "b"),data=data1,model="random")
summary(mod1)
pdwtest(mod1)#Durbin watson test
mod2<-plm(D1~I1+I2+I3+I4+I5,index=c("d", "b"),data=data1,model="within",effect="individual")#,
summary(mod2)
pdwtest(mod2)#Durbin watson test
pFtest(mod2,mod1) # hausman test P value < 0.05 fixed effect better than random
mod3<-plm(D2~I1+I2+I3+I4+I5,index=c("d", "b"),data=data1,model="within",effect="individual")#,
summary(mod3)
pdwtest(mod3)#Durbin watson test
mod4<-plm(D2~I1+I2+I3+I4+I5,index=c("d", "b"),data=data1,model="random")
summary(mod4)
pdwtest(mod4)#Durbin watson test
pFtest(mod3,mod4) # hausman test P value < 0.05 fixed effect better than random

##################################################################################
pdwtest(mod1)
pbgtest(mod4)### serial correlation test pvale>0.05 no serial correlation
mod6<-plm(D2~I1+I2+I3+I4+I5,index=c("d", "b"),data=data1,model="random")
summary(mod4)
pFtest(mod3,mod4) # hausman test P value < 0.05 fixed effect better than random
