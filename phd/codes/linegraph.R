library(ggplot2)
data=read.csv("C:/Users/bip/Desktop/boolean/experiment/UPL20.csv")
Precision<-data$P.5
(ggplot(data, aes(x=factors, y=Precision)) + geom_line(aes(y = P.5, col = "RSVD")) 
 + geom_line(aes(y = P.5.1, col = "CB"))+ geom_line(aes(y = P.5.2, col = "CB_Cosine"))+ geom_line(aes(y = P.5.3, col = "CB_PL"))+geom_point()+geom_point(aes(y = P.5.1, col = "CB"))
   +geom_point(aes(y = P.5.2, col = "CB_Cosine"))+geom_point(aes(y = P.5.3, col = "CB_PL")) + ggtitle("precision@5"))

Precision<-data$P.10
(ggplot(data, aes(x=factors, y=Precision)) + geom_line(aes(y = P.10, col = "RSVD")) 
 + geom_line(aes(y = P.10.1, col = "CB"))+ geom_line(aes(y = P.10.2, col = "CB_Cosine"))+ geom_line(aes(y = P.10.3, col = "CB_PL"))+geom_point()+geom_point(aes(y = P.10.1, col = "CB"))
 +geom_point(aes(y = P.10.2, col = "CB_Cosine"))+geom_point(aes(y = P.10.3, col = "CB_PL")) + ggtitle("precision@10"))

Fmeasure<-data$F.5
(ggplot(data, aes(x=factors, y=Fmeasure)) + geom_line(aes(y = F.5, col = "RSVD")) 
 + geom_line(aes(y = F.5.1, col = "CB"))+ geom_line(aes(y = F.5.2, col = "CB_Cosine"))+ geom_line(aes(y = F.5.3, col = "CB_PL"))+geom_point()+geom_point(aes(y = F.5.1, col = "CB"))
 +geom_point(aes(y = F.5.2, col = "CB_Cosine"))+geom_point(aes(y = F.5.3, col = "CB_PL")) + ggtitle("F-measure@5"))

Fmeasure<-data$F.10
(ggplot(data, aes(x=factors, y=Fmeasure)) + geom_line(aes(y = F.10, col = "RSVD")) 
 + geom_line(aes(y = F.10.1, col = "CB"))+ geom_line(aes(y = F.10.2, col = "CB_Cosine"))+ geom_line(aes(y = F.10.3, col = "CB_PL"))+geom_point()+geom_point(aes(y = F.10.1, col = "CB"))
 +geom_point(aes(y = F.10.2, col = "CB_Cosine"))+geom_point(aes(y = F.10.3, col = "CB_PL")) + ggtitle("F-measure@10"))

NDCG<-data$NDCG.5
(ggplot(data, aes(x=factors, y=NDCG)) + geom_line(aes(y = NDCG.5, col = "RSVD")) 
 + geom_line(aes(y = NDCG.5.1, col = "CB"))+ geom_line(aes(y = NDCG.5.2, col = "CB_Cosine"))+ geom_line(aes(y = NDCG.5.3, col = "CB_PL"))+geom_point()+geom_point(aes(y = NDCG.5.1, col = "CB"))
 +geom_point(aes(y = NDCG.5.2, col = "CB_Cosine"))+geom_point(aes(y = NDCG.5.3, col = "CB_PL")) + ggtitle("NDCG@5"))

NDCG<-data$NDCG.10
(ggplot(data, aes(x=factors, y=NDCG)) + geom_line(aes(y = NDCG.10, col = "RSVD")) 
 + geom_line(aes(y = NDCG.10.1, col = "CB"))+ geom_line(aes(y = NDCG.10.2, col = "CB_Cosine"))+ geom_line(aes(y = NDCG.10.3, col = "CB_PL"))+geom_point()+geom_point(aes(y = NDCG.10.1, col = "CB"))
 +geom_point(aes(y = NDCG.10.2, col = "CB_Cosine"))+geom_point(aes(y = NDCG.10.3, col = "CB_PL")) + ggtitle("NDCG@10"))