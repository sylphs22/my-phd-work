score_big5_5_pers=cbind(MAE,RMSE,precision_5,recall_5,precision_10,recall_10,coverage)
score_big5_10_pers=cbind(MAE,RMSE,precision_5,recall_5,precision_10,recall_10,coverage)
score_big5_15_pers=cbind(MAE,RMSE,precision_5,recall_5,precision_10,recall_10,coverage)
score_big5_20_pers=cbind(MAE,RMSE,precision_5,recall_5,precision_10,recall_10,coverage)
score_big5_25_pers=cbind(MAE,RMSE,precision_5,recall_5,precision_10,recall_10,coverage)
score_big5_30_pers=cbind(MAE,RMSE,precision_5,recall_5,precision_10,recall_10,coverage)
score_big5_35_pers=cbind(MAE,RMSE,precision_5,recall_5,precision_10,recall_10,coverage)

score_big5_pers=rbind(score_big5_5_pers,score_big5_10_pers,score_big5_15_pers,score_big5_20_pers,score_big5_25_pers,
                      score_big5_30_pers,score_big5_35_pers)
write.table(score_big5_pers,row.names=FALSE,col.names=T, "C:/Users/bip/Desktop/Abhishek/95_1000_diff_sparse/95_1000_diff_sparse/score_CF", sep="\t")

score_big5__5_pers=cbind(precision_5,recall_5,precision_10,recall_10)
score_big5__10_pers=cbind(precision_5,recall_5,precision_10,recall_10)
score_big5__15_pers=cbind(precision_5,recall_5,precision_10,recall_10)
score_big5__20_pers=cbind(precision_5,recall_5,precision_10,recall_10)
score_big5__25_pers=cbind(precision_5,recall_5,precision_10,recall_10)
score_big5__30_pers=cbind(precision_5,recall_5,precision_10,recall_10)
score_big5__35_pers=cbind(precision_5,recall_5,precision_10,recall_10)
score_big5__40_pers=cbind(precision_5,recall_5,precision_10,recall_10)
score_big5__45_pers=cbind(precision_5,recall_5,precision_10,recall_10)
score_big5__50_pers=cbind(precision_5,recall_5,precision_10,recall_10)
score=rbind(score_big5__5_pers,score_big5__10_pers,score_big5__15_pers,score_big5__20_pers,
            score_big5__25_pers,score_big5__30_pers,score_big5__35_pers,
            score_big5__40_pers,score_big5__45_pers,score_big5__50_pers)
write.table(score,row.names=FALSE,col.names=T, "C:/Users/bip/Desktop/score_svd", sep="\t")
