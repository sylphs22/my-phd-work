library("arules")

library("arulesViz")



#Load data set:

data("Groceries")

summary(Groceries)
Groceries
#Look at data:

inspect(Groceries[1])

LIST(Groceries)[1]
a=LIST(Groceries)


#Calculate rules using apriori algorithm and specifying support and confidence thresholds:

rules = apriori(Groceries, parameter=list(support=0.001, confidence=0.5))

#Inspect the top 5 rules in terms of lift:

inspect(head(sort(rules, by ="lift"),5))

#Plot a frequency plot:

itemFrequencyPlot(Groceries, topN = 25)



#Scatter plot of rules:

library("RColorBrewer")

plot(rules,control=list(col=brewer.pal(11,"Spectral")),main="")

#Rules with high lift typically have low support.

#The most interesting rules reside on the support/confidence border which can be clearly seen in this plot.



#Plot graph-based visualisation:

subrules2 <- head(sort(rules, by="lift"), 10)

plot(subrules2, method="graph",control=list(type="items",main=""))