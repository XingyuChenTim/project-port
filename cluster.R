library(stats)  ## for dist
#https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/dist

## There are many clustering libraries
#install.packages("NbClust")
library(NbClust)
library(cluster)
library(mclust)

library(amap)  ## for using Kmeans (notice the cap K)

library(factoextra) ## for cluster vis, silhouette, etc.
library(purrr)

#install.packages("stylo")
library(stylo)  
#install.packages("philentropy")
library(philentropy)  ## for distance() which offers 46 metrics
## https://cran.r-project.org/web/packages/philentropy/vignettes/Distances.html
library(SnowballC)
library(caTools)
library(dplyr)
library(textstem)
library(stringr)
library(wordcloud)
library(tm) ## to read in corpus (text data)

## Always start small and easy.
## Let's start with the smallest and easiest dataset
## This is a record dataset with only 3 variables
## It is labeled data - so we will NEED TO REMOVE the label
## before clustering.

## I will set my working dir to point to the data on MY 
## computer :) You will need to update this.

# setwd("C:/Users/profa/Documents/RStudioFolder_1/DrGExamples/ClusterData")

Record_3D_DF<-read.csv("/Users/xingyuchen0810/Downloads/CUB/2023Spring/text_mining/project-port/data/new_cluster_for_r.csv")
## Look, clean, prep
head(Record_3D_DF)
str(Record_3D_DF)
## Save the label
(Label_3D <- Record_3D_DF$LABEL)
## Remove the label from the dataset
## remove column 1
Record_3D_DF <- Record_3D_DF[ ,-c(1) ]
head(Record_3D_DF)
## Create a normalized version of Record_3D_DF
Record_3D_DF_Norm <- Record_3D_DF
# (Record_3D_DF_Norm <- as.data.frame(apply(Record_3D_DF[, ], 2, ##2 for col
#                                           function(x) (x - min(x))/(max(x)-min(x)))))
#######################################################
## 
##          Hierarchical CLustering
## 
##
#######################################################
#
# Hierarchical clustering with Ward
# https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/hclust
#  
# ward.D2" = Ward's minimum variance method -
# however dissimilarities are **squared before clustering. 
# "single" = Nearest neighbours method. 
# "complete" = distance between two clusters is defined 
# as the maximum distance between an observation in one.
####################################################################
##
## For hclust, you need a distance matrix
## You can create any distance matrix you wish...
##
## https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/hclust
####################################################################
## Example:
(Dist_norm_M2<- dist(Record_3D_DF_Norm, method = "minkowski", p=2)) #Euclidean
## Now run hclust...you may use many methods - Ward, Ward.D2, complete, etc..
## see above
(HClust_Ward_Euc_N_3D <- hclust(Dist_norm_M2, method = "average" ))
plot(HClust_Ward_Euc_N_3D, cex=0.9, hang=-1, main = "Minkowski p=2 (Euclidean)")
rect.hclust(HClust_Ward_Euc_N_3D, k=4)

## Using Man with Ward.D2..............................
dist_C <- stats::dist(Record_3D_DF_Norm, method="manhattan")
HClust_Ward_CosSim_N_3D <- hclust(dist_C, method="ward.D2")
plot(HClust_Ward_CosSim_N_3D, cex=.7, hang=-30,main = "Manhattan")
rect.hclust(HClust_Ward_CosSim_N_3D, k=2)