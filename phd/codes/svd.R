a <- matrix(c(2, 1, 5, 4, 5/2, 3,3,4,13/3,1,5,9/4,3,4,5/2,2,1,4,5,5/2,3,4,4,13/3,4), 5, 5)
library(MASS)
a.svd<-svd(a)
a.svd
b<-as.matrix(diag(a.svd$d))
b=b[1:2,1:2]
u=as.matrix(a.svd$u)
u=u[,1:2]
v=as.matrix(a.svd$v)
v=v[,1:2]
v=t(v)
r=u%*%b
library(Matrix)
r=r%*%v
