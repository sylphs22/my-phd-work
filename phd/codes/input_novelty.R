data=read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u5.base")
data1=read.table("E:/New Volume/studies/FPM/papers/web recommeder system/datasets/ml-100k/ml-100k/u5.test")
data1$V3=0
In=rbind(data,data1)
write.table(In,col.names=F,row.names=F,"E:/New Volume/Documents/Documents/Visual Studio 2012/Projects/novelty/novelty/u5.txt")
