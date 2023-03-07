# Library
library(stats)  ## for dist
#https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/dist
library(NbClust)
library(cluster)
library(mclust)
library(amap)  ## for using Kmeans (notice the cap K)
library(factoextra) ## for cluster vis, silhouette, etc.
library(purrr)
library(stylo)  
library(philentropy)  ## for distance() which offers 46 metrics
library(SnowballC)
library(caTools)
library(dplyr)
library(textstem)
library(stringr)
library(wordcloud)
library(tm) ## to read in corpus (text data)

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