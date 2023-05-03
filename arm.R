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
setwd("/Users/xingyuchen0810/Documents/text_mining/project-port")

FoodsKumar <- read.transactions("new_arm_for_r.csv",
                                rm.duplicates = FALSE, 
                                format = "basket",  ##if you use "single" also use cols=c(1,2)
                                sep=",",  ## csv file
                                cols=1) ## The dataset HAS row numbers
inspect(FoodsKumar)

##### Use apriori to get the RULES
FrulesK = arules::apriori(FoodsKumar, parameter = list(support=.03, 
                                                       confidence=.1, minlen=2))
inspect(FrulesK)

## Plot of which items are most frequent
itemFrequencyPlot(FoodsKumar, topN=20, type="absolute")

## Sort rules by a measure such as conf, sup, or lift
Sortedconf <- sort(FrulesK, by="confidence", decreasing=TRUE)
inspect(Sortedconf[1:15])

## Sort rules by a measure such as conf, sup, or lift
Sortedsup <- sort(FrulesK, by="support", decreasing=TRUE)
inspect(Sortedsup[1:15])

## Sort rules by a measure such as conf, sup, or lift
Sortedlift <- sort(FrulesK, by="lift", decreasing=TRUE)
inspect(Sortedlift[1:15])

# (summary(SortedRulesK))

## Selecting or targeting specific rules  RHS
appRules <- apriori(data=FoodsKumar,parameter = list(supp=.001, conf=.01, minlen=2),
                     appearance = list(default="lhs", rhs="ban"),
                     control=list(verbose=FALSE))
appRules <- sort(appRules, decreasing=TRUE, by="confidence")
inspect(appRules[1:4])

## Selecting or targeting specific rules  RHS
goodRules <- apriori(data=FoodsKumar,parameter = list(supp=.001, conf=.01, minlen=2),
                     appearance = list(default="lhs", rhs="ban"),
                     control=list(verbose=FALSE))
goodRules <- sort(goodRules, decreasing=TRUE, by="confidence")
inspect(goodRules[1:4])

## Selecting rules with LHS specified
niceRules <- apriori(data=FoodsKumar,parameter = list(supp=.001, conf=.01, minlen=2),
                      appearance = list(default="rhs", lhs="ban"),
                      control=list(verbose=FALSE))
niceRules <- sort(niceRules, decreasing=TRUE, by="support")
inspect(niceRules[1:4])

## Visualize
## tcltk

subrulesK <- head(sort(FrulesK, by="lift"),50)

plot(subrulesK, method="graph", engine="interactive")