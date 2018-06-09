data=read.table("C:/Users/bip/Documents/Visual Studio 2012/Projects/personality/personality/dump_10.txt",header=F,sep='\t')
#data=read.table("C:/Users/bip/Desktop/NV/nv1.txt",header=T,sep='\t')
#max(data$ItemID)
#max(data$UserID)
data=data.frame(data,1)
set.seed(3)
library(caret)
data$V1<-data$V1+1
data$V2<-data$V2+1
flds<-createFolds(data$V1, k = 5, list = T, returnTrain = FALSE)
test1<-data[flds[[1]], ]
train1<-data[-flds[[1]], ]
test2<-data[flds[[2]], ]
train2<-data[-flds[[2]], ]
test3<-data[flds[[3]], ]
train3<-data[-flds[[3]], ]
test4<-data[flds[[4]], ]
train4<-data[-flds[[4]], ]
test5<-data[flds[[5]], ]
train5<-data[-flds[[5]], ]
write.table(train1,row.names=FALSE,col.names=FALSE, "C:/Users/bip/Documents/Visual Studio 2012/Projects/personality/personality/train1.txt",sep='\t')
write.table(train2,row.names=FALSE,col.names=FALSE, "C:/Users/bip/Documents/Visual Studio 2012/Projects/personality/personality/train2.txt",sep='\t')
write.table(train3,row.names=FALSE,col.names=FALSE, "C:/Users/bip/Documents/Visual Studio 2012/Projects/personality/personality/train3.txt",sep='\t')
write.table(train4,row.names=FALSE,col.names=FALSE, "C:/Users/bip/Documents/Visual Studio 2012/Projects/personality/personality/train4.txt",sep='\t')
write.table(train5,row.names=FALSE,col.names=FALSE, "C:/Users/bip/Documents/Visual Studio 2012/Projects/personality/personality/train5.txt",sep='\t')
write.table(test1,row.names=FALSE,col.names=FALSE, "C:/Users/bip/Documents/Visual Studio 2012/Projects/personality/personality/test1.txt",sep='\t')
write.table(test2,row.names=FALSE,col.names=FALSE, "C:/Users/bip/Documents/Visual Studio 2012/Projects/personality/personality/test2.txt",sep='\t')
write.table(test3,row.names=FALSE,col.names=FALSE, "C:/Users/bip/Documents/Visual Studio 2012/Projects/personality/personality/test3.txt",sep='\t')
write.table(test4,row.names=FALSE,col.names=FALSE, "C:/Users/bip/Documents/Visual Studio 2012/Projects/personality/personality/test4.txt",sep='\t')
write.table(test5,row.names=FALSE,col.names=FALSE, "C:/Users/bip/Documents/Visual Studio 2012/Projects/personality/personality/test5.txt",sep='\t')

####

