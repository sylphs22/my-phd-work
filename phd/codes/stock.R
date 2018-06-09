stock<-read.csv("C:/Users/bip/Desktop/stock/rating.csv")

stock1<-stock

stock1$pick_date<-as.Date(stock1$pick_date,format='%d-%m-%y')
stock1$target_date<-as.Date(stock1$target_date,format='%d-%m-%y')
stock1$recommendation_label<-as.character(stock1$recommendation_label)
stock1$start_price<-as.numeric(as.character(stock1$start_price))
stock1<-subset(stock1,stock1$start_price!='NA')
daterange<-as.Date(('2010-01-01'))
for(i in 1:30)
{
  daterange[i]<-daterange[i-1]+30 # i-th element of u1 squared into i-th position of usq
  daterange[i]
} 
emscore<-NULL

for(j in 1:30)
{
#j=2

#stock_t<-subset(stock1, stock1$target_date>=daterange[i])}
#stock_t1<-subset(stock_t, stock_t$target_date<=(as.Date('2010-01-01')+180))
train_stock<-subset(stock1,stock1$pick_date>=daterange[j])
train1<-subset(train_stock, train_stock$target_date<=(as.Date(daterange[j])+180))

#train1<-stock_t1
train1$start_price<-as.numeric(as.character(train1$start_price))
train1$score<-(2*abs(train1$end_price-train1$expected_price)/(train1$end_price+train1$expected_price))
train1$sign<-(train1$expected_price-train1$start_price)*(train1$end_price-train1$start_price)
train1$newscore<-ifelse(train1$sign>=0,(train1$score+0.01),1/(train1$score+0.01))
train1$return<-(train1$end_price)/train1$start_price
#train1$newsreturn<-ifelse(train1$sign>=0,train1$return,1/train1$return)
var=1
train2<-cbind(train1,var)
train2$cauth<-ave(train2$v,train2$author_id,FUN=sum)
#train2$cisin<-ave(train2$v,train2$isin,FUN=sum)
train2$pop<-train2$cauth

####################################final vector##################
library(psych)
train3<-subset(train2, train2$start_price!=0)
train4<-subset(train3, train3$end_price!=0)
train5<-subset(train4,train4$expected_price!=0)

#train5$pop=NULL
train5$cauth=NULL
#train5$cisin<-ave(train5$var,train5$isin,FUN=sum)
train5$mscore<-ave(train5$newscore,train5$author_id,FUN=geometric.mean)
train5$newreturn<-(train5$return/(train5$duration+1))
train5$mreturn<-ave(train5$newreturn,train5$author_id,FUN=geometric.mean)
train5$mpop<-ave(train5$pop,train5$author_id,FUN=geometric.mean)
#train5$newsreturn<-ifelse(train5$sign>=0,(train5$return+.01),1/train5$return)

texpert<-train5[!duplicated(train5[,c('author_id')]),]
expert<-cbind(texpert$mscore,texpert$mreturn,texpert$mpop)

#####################################Topsis################################################
rownames <- 1:nrow(expert)
ID<-texpert$author_id
expert<-as.matrix(expert)
library(topsis)
weights=c(1,1,1)
nature<-c("-","+","+")
escore<-topsis(expert,weights,nature)
month<-format(as.Date(daterange[j])+180,"%Y-%m")
escore<-data.frame(ID,escore,month)
emscore<-rbind(emscore,escore)
}
###########################testing in portfolio####################
amount<-150
test1<-subset(stock1, stock1$pick_date>(as.Date(daterange[1])+180))
test2<-subset(test1,test1$pick_date<=(as.Date(daterange[1])+190))
escoren<-subset(emscore,emscore$month=='2010-06')
escoren<-escoren[order(escoren$rank),]
names(escoren)[names(escoren)=="ID"] <- "author_id"
escoren1<-escoren#######top 10 experts###
escoren1$month<-NULL
escoren1$score1<-escoren1$score/sum(escoren1$score)
escoren1$score<-NULL
names(escoren1)[names(escoren1)=="ID"] <- "author_id"
mergeexpert<-merge(escoren1,test2,"author_id")
mergeexpert<-mergeexpert[order(mergeexpert$pick_date),]
port<-subset(mergeexpert,mergeexpert$recommendation_label=='Buy')
port<-subset(port,port$start_price!=0)
###############portfolio building##############################################
port$score2<-ave(port$score1,port$pick_date,port$stock,FUN=sum)
port$score3<-port$score1/port$score2
port$expected_price1<-port$score3*port$expected_price
port$expected_price2<-ave(port$expected_price1,port$pick_date,port$stock,FUN=sum)
port$end_time1<-port$score3*port$duration
port$end_time2<-ave(port$end_time1,port$pick_date,port$stock,FUN=sum)
port$duration1<-abs(port$end_time2-port$duration)
port$diffduration<-ave(port$duration1,port$pick_date,port$stock,FUN=min)
library(plyr)
end_date<-ddply(port, .(pick_date,stock), summarise, diffduration=min(diffduration), 
      target_date1=target_date[which.min(diffduration)],end_price1=end_price[which.min(diffduration)])
port1<-merge(port,end_date,c("pick_date","stock","diffduration"))
port1$start_price1<-ave(port1$start_price,port1$pick_date,port1$stock,FUN=mean)
port1$profit<-(port1$expected_price2-port1$start_price1)/(port1$start_price1*port$end_time2)
port1u<-port1[!duplicated(port1[1:2]),]
port1n<-port1u[ave(-port1u$profit, port1u$pick_date, FUN = rank) <= 3, ]
port1n$qty1<-(amount/port1n$start_price)
port1n$qty<-pmax((port1n$start_price*port1n$qty1*0.9975-4.9)/port1n$start_price,
(port1n$start_price*port1n$qty1-60)/port1n$start_price)
###############################end of round 1#############################
portnew<-data.frame(port1n$pick_date,port1n$stock,port1n$isin,port1n$author_id,port1n$start_price,port1n$target_date1,port1n$qty,port1n$end_price)
colnames(portnew)<-c("pick_date","stock","isin","author_id","start_price","target_date","qty","end_price")
portnmew1<-portnew[order(portnew$target_date),]
targetd<-portnmew1[1,6]
port2<-subset(portnmew1, portnmew1$target_date==targetd)
port2$fund<-pmax((port2$qty*port2$start_price*1.5*0.9975-4.9),(port2$qty*port2$start_price*1.5-60))
port2$fund1<-pmax((port2$qty*port2$end_price*0.9975-4.9),(port2$qty*port2$end_price-60))
#library(matrixStats)
port2$amount1<-pmin(port2$fund,port2$fund1)
amount1<-sum(port2$amount1)
port21<-subset(portnmew1, portnmew1$target_date!=targetd)

#########################################################################
port6<-portnmew1
for (k in 1:500)
{
port3<-subset(stock1,stock1$pick_date>targetd)
port3<-port3[order(port3$pick_date),]
picked<-port3[1,7]  
port4<-subset(port3,port3$pick_date==picked)
sort_expert<-subset(emscore,emscore$month==(format(picked-30,"%Y-%m")))
names(sort_expert)[names(sort_expert)=="ID"] <- "author_id"
names(sort_expert)[names(sort_expert)=="score"] <- "score1"
mergeexpert1<-merge(sort_expert,port4,"author_id")
mergeexpert1<-mergeexpert1[order(mergeexpert1$pick_date),]
port5<-subset(mergeexpert1,mergeexpert1$recommendation_label=='Buy')
port5<-subset(port5,port5$start_price!=0)
port5$score2<-ave(port5$score1,port5$pick_date,port5$stock,FUN=sum)
port5$score3<-port5$score1/port5$score2
port5$expected_price1<-port5$score3*port5$expected_price
port5$expected_price2<-ave(port5$expected_price1,port5$pick_date,port5$stock,FUN=sum)
port5$end_time1<-port5$score3*port5$duration
port5$end_time2<-ave(port5$end_time1,port5$pick_date,port5$stock,FUN=sum)
port5$duration1<-abs(port5$end_time2-port5$duration)
port5$diffduration<-ave(port5$duration1,port5$pick_date,port5$stock,FUN=min)
library(plyr)
end_date<-ddply(port5, .(pick_date,stock), summarise, diffduration=min(diffduration), 
                target_date1=target_date[which.min(diffduration)],end_price1=end_price[which.min(diffduration)])
port51<-merge(port5,end_date,c("pick_date","stock","diffduration"))
port51$start_price1<-ave(port51$start_price,port51$stock,port51$pick_date,FUN=mean)
port51$profit<-(port51$expected_price2-port51$start_price1)/(port51$start_price1*port51$end_time2)
port51u<-port51[!duplicated(port51[1:2]),]
port51n<-port51u[ave(-port51u$profit, port51u$pick_date, FUN = rank) <= 3, ]
counts<-nrow(port51n)
port51n$qty1<-amount1/(counts*port51n$start_price)
port51n$qty<-pmax(0.1,pmax((port51n$start_price*port51n$qty1*0.9975-4.9)/port51n$start_price,
                 (port51n$start_price*port51n$qty1-60)/port51n$start_price))
amount2<-amount1-(sum(port51n$qty*port51n$start_price)+
         sum (pmin(port51n$qty*port51n$start_price*0.0025+
                 4.9,port51n$qty*port51n$start_price+60)))
portnew51<-data.frame(port51n$pick_date,port51n$stock,port51n$isin,port51n$author_id,port51n$start_price,port51n$target_date1,port51n$qty,port51n$end_price)
colnames(portnew51)<-c("pick_date","stock","isin","author_id","start_price","target_date","qty","end_price")
portnew52<-rbind(portnew51,port21)
portnew52<-portnew52[order(portnew52$target_date),]
targetd<-portnew52[1,6]
port25<-subset(portnew52, portnew52$target_date==targetd)
port21<-subset(portnew52, portnew52$target_date!=targetd)
port25$fund<-pmax((port25$qty*port25$start_price*1.5*0.9975)-4.9,(port25$qty*port25$start_price*1.5)-60)
port25$fund1<-pmax((port25$qty*port25$end_price*0.9975-4.9),(port25$qty*port25$end_price-60))

#port25$fund<-$qty*port25$start_price*1.5
#port25$fund1<-port25$qty*port25$end_price
#port25<-as.matrix.data.frame(port25)
#port25$amount1<-pmax(0,port25$fund1)
port25$amount1<-pmax(0,pmin(port25$fund,port25$fund1))
#port25$amount1<-rowMins(port25$qty*port25$end_price,port25$qty*1.5*port25$start_price)
amount1<-amount2+sum(port25$amount1)
port6<-rbind(port6,portnew51)
#remove(portnew51)
}

write.csv(port6,"C:/Users/bip/Desktop/stock/expert111.csv",row.names = F)






