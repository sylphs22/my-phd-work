rating=read.table("ml100.txt")
rating=as.matrix(rating)
rating=t(rating)
###############cosine similarity start################################************
#cos.sim <- function(ix) 
#{
 # A = rating[ix[1],]
 # B = rating[ix[2],]
 # return( sum(A*B)/sqrt(sum(A^2)*sum(B^2)) )
#}   
#n <- nrow(rating) 
#cmb <- expand.grid(i=1:n, j=1:n) 
#C <- matrix(apply(cmb,1,cos.sim),n,n)
library(lsa)
sim=cosine(rating)
##################cosine similarity over##########################################
#########global similarity###############
library(e1071)
global=allShortestPaths(sim)
extractPath(global,9,10)
