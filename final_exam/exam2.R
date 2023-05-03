# Library
library(viridis)
library(arules)
library(TSP)
library(data.table)
library(tcltk)
library(dplyr)
library(devtools)
library(purrr)
library(tidyr)
library(arulesViz)
library(dplyr)
library(methods)
library(tm)
## (1) detach("package:arulesViz", unload=TRUE)
## (2) detach("package:arules", unload=TRUE)
## (3) library(arules)
## (4) library(arulesViz)
detach(package:tm, unload=TRUE)
library(tm)
detach("package:arulesViz", unload=TRUE)
detach("package:arules", unload=TRUE)
library(arules)
library(arulesViz)
## YOUR working dir goes here...
setwd("/Users/xingyuchen0810/Documents/")

FoodsKumar <- read.transactions("ARMdata_Xingyu.csv",
                                rm.duplicates = FALSE, 
                                format = "basket",  ##if you use "single" also use cols=c(1,2)
                                sep=",",  ## csv file
                                cols=1) ## The dataset HAS row numbers
inspect(FoodsKumar)

##### Use apriori to get the RULES
FrulesK = arules::apriori(FoodsKumar, parameter = list(support=.1, 
                                                       confidence=.1, minlen=2))
inspect(FrulesK)

## Plot of which items are most frequent
itemFrequencyPlot(FoodsKumar, topN=20, type="absolute")

## Sort rules by a measure such as conf, sup, or lift
Sortedconf <- sort(FrulesK, by="confidence", decreasing=TRUE)
inspect(Sortedconf[1:10])

## Sort rules by a measure such as conf, sup, or lift
Sortedsup <- sort(FrulesK, by="support", decreasing=TRUE)
inspect(Sortedsup[1:10])

## Sort rules by a measure such as conf, sup, or lift
Sortedlift <- sort(FrulesK, by="lift", decreasing=TRUE)
inspect(Sortedlift[1:10])

# (summary(SortedRulesK))

## Selecting or targeting specific rules  RHS
appRules <- apriori(data=FoodsKumar,parameter = list(supp=.1, conf=.1, minlen=2),
                    appearance = list(default="rhs", lhs="neg"),
                    control=list(verbose=FALSE))
appRules <- sort(appRules, decreasing=TRUE, by="confidence")
inspect(appRules[1:10])

## Selecting or targeting specific rules  RHS
appRules <- apriori(data=FoodsKumar,parameter = list(supp=.1, conf=.1, minlen=2),
                    appearance = list(default="rhs", lhs="pos"),
                    control=list(verbose=FALSE))
appRules <- sort(appRules, decreasing=TRUE, by="confidence")
inspect(appRules[1:10])


## Visualize
## tcltk

subrulesK <- head(sort(FrulesK, by="lift"),25)
##plot(subrulesK)

plot(subrulesK, method="graph", engine="interactive")