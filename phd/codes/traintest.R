data=read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-1m/ratings.dat",sep=":")
hist(data$V5)
mean(data$V5)
data$V2=NULL
data$V4=NULL
data$V6=NULL
data$V7=NULL
write.table(data,row.names=FALSE,col.names=FALSE, "E:/New Volume/data.txt", sep="\t")

data[1:3,]
max(data$V1)
max(data$V3)
max(data$V5)
library(cvTools)
library("robustbase")
set.seed(100)
folds <- cvFolds(nrow(data), K = 2, R=1, type = "random")
mydata <- data.frame(data, folds$which)
out <- split( mydata , f = mydata$folds.which )
str(out)
out
testdata=data.frame(out[[1]])
library(data.table)
testdata1=data.table(out[[1]])
testdata1$folds.which=NULL
testdata2=data.table(out[[2]])
testdata2$folds.which=NULL
testdata3=data.table(out[[3]])
testdata3$folds.which=NULL
testdata4=data.table(out[[4]])
testdata4$folds.which=NULL
testdata5=data.table(out[[5]])
testdata5$folds.which=NULL
testdata6=data.table(out[[6]])
testdata6$folds.which=NULL
testdata7=data.table(out[[7]])
testdata7$folds.which=NULL
testdata8=data.table(out[[8]])
testdata8$folds.which=NULL
testdata9=data.table(out[[9]])
testdata9$folds.which=NULL
testdata10=data.table(out[[10]])
testdata10$folds.which=NULL
testdata1=rbind(testdata1,testdata10)
train1 <- rbind(testdata2,testdata3,testdata4,testdata5,testdata6,testdata7,testdata8,testdata9)
train2 <- rbind(testdata1,testdata3,testdata4,testdata5,testdata6,testdata7,testdata8,testdata9,testdata10)
train3 <- rbind(testdata1,testdata2,testdata4,testdata5,testdata6,testdata7,testdata8,testdata9,testdata10)
train4 <- rbind(testdata1,testdata2,testdata3,testdata5,testdata6,testdata7,testdata8,testdata9,testdata10)
train5 <- rbind(testdata2,testdata3,testdata4,testdata1,testdata6,testdata7,testdata8,testdata9,testdata10)
train6 <- rbind(testdata2,testdata3,testdata4,testdata5,testdata1,testdata7,testdata8,testdata9,testdata10)
train7 <- rbind(testdata1,testdata3,testdata4,testdata5,testdata2,testdata6,testdata8,testdata9,testdata10)
train8 <- rbind(testdata1,testdata3,testdata4,testdata5,testdata2,testdata6,testdata7,testdata9,testdata10)
train9 <- rbind(testdata1,testdata3,testdata4,testdata5,testdata2,testdata6,testdata7,testdata8,testdata10)
train10 <- rbind(testdata1,testdata3,testdata4,testdata5,testdata2,testdata6,testdata7,testdata8,testdata9)

write.table(testdata1,row.names=FALSE,col.names=FALSE, "E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/test1.txt", sep="\t")
write.table(testdata2,row.names=FALSE,col.names=FALSE, "E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/test2.txt", sep="\t")
write.table(testdata3,row.names=FALSE,col.names=FALSE, "E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/testdata3.txt", sep="\t")
write.table(testdata4,row.names=FALSE,col.names=FALSE, "E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/testdata4.txt", sep="\t")
write.table(testdata5,row.names=FALSE,col.names=FALSE, "E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/testdata5.txt", sep="\t")
write.table(train2,row.names=FALSE,col.names=FALSE, "E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/train2.txt", sep="\t")
write.table(train3,row.names=FALSE,col.names=FALSE, "E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/train3.txt", sep="\t")
write.table(train4,row.names=FALSE,col.names=FALSE, "E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/train4.txt", sep="\t")
write.table(train5,row.names=FALSE,col.names=FALSE, "E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/train5.txt", sep="\t")
write.table(train1,row.names=FALSE,col.names=FALSE, "E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/train1.txt", sep="\t")
write.table(testdata6,row.names=FALSE,col.names=FALSE, "E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/testdata6.txt", sep="\t")
write.table(testdata7,row.names=FALSE,col.names=FALSE, "E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/testdata7.txt", sep="\t")
write.table(testdata8,row.names=FALSE,col.names=FALSE, "E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/testdata8.txt", sep="\t")
write.table(testdata9,row.names=FALSE,col.names=FALSE, "E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/testdata9.txt", sep="\t")
write.table(testdata10,row.names=FALSE,col.names=FALSE, "E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/testdata10.txt", sep="\t")
write.table(train6,row.names=FALSE,col.names=FALSE, "E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/train6.txt", sep="\t")
write.table(train7,row.names=FALSE,col.names=FALSE, "E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/train7.txt", sep="\t")
write.table(train8,row.names=FALSE,col.names=FALSE, "E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/train8.txt", sep="\t")
write.table(train9,row.names=FALSE,col.names=FALSE, "E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/train9.txt", sep="\t")
write.table(train10,row.names=FALSE,col.names=FALSE, "E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/train10.txt", sep="\t")