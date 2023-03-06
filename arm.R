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


## YOUR working dir goes here...
setwd("/Users/xingyuchen0810/Downloads/CUB/2023Spring/text_mining/project-port/data/")


###################################
## Example 1: Kumar's good Example
##
## Dataset: https://drive.google.com/file/d/1BvU3iXtrwxfjBsRShaDgI-Ldh7Y3XSEn/view?usp=sharing
## KumarGroceriesAS_Transactions
##
###################################################

FoodsKumar <- read.transactions("new_arm_for_r.csv",
                                rm.duplicates = FALSE, 
                                format = "basket",  ##if you use "single" also use cols=c(1,2)
                                sep=",",  ## csv file
                                cols=1) ## The dataset HAS row numbers
inspect(FoodsKumar)

##### Use apriori to get the RULES
FrulesK = arules::apriori(FoodsKumar, parameter = list(support=.35, 
                                                       confidence=.5, minlen=2))
inspect(FrulesK)

## Plot of which items are most frequent
itemFrequencyPlot(FoodsKumar, topN=20, type="absolute")

## Sort rules by a measure such as conf, sup, or lift
SortedRulesK <- sort(FrulesK, by="confidence", decreasing=TRUE)
# inspect(SortedRulesK[1:10])
(summary(SortedRulesK))

## Selecting or targeting specific rules  RHS
goodRules <- apriori(data=FoodsKumar,parameter = list(supp=.001, conf=.01, minlen=2),
                     appearance = list(default="lhs", rhs="good"),
                     control=list(verbose=FALSE))
goodRules <- sort(goodRules, decreasing=TRUE, by="confidence")
inspect(goodRules[1:4])

## Selecting rules with LHS specified
BreadRules <- apriori(data=FoodsKumar,parameter = list(supp=.001, conf=.01, minlen=2),
                      appearance = list(default="rhs", lhs="Bread"),
                      control=list(verbose=FALSE))
BreadRules <- sort(BreadRules, decreasing=TRUE, by="support")
inspect(BreadRules[1:4])

## Visualize
## tcltk

subrulesK <- head(sort(SortedRulesK, by="lift"),10)
plot(subrulesK)

plot(subrulesK, method="graph", engine="interactive")