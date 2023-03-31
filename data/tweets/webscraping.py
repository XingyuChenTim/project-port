# -*- coding: utf-8 -*-
"""
@author: profa
"""
#######################################################
##
## This code is a tutorial for HOW TO
## perform basic webpage information gathering.
##
## It also shows code for wordclouds and CountVectorizer
#### Gates
###########################################################

import requests

from sklearn.feature_extraction.text import CountVectorizer
import pandas as pd
import re
from wordcloud import WordCloud, STOPWORDS
import matplotlib.pyplot as plt



## Example 1
response = requests.get("https://club.atlascoffeeclub.com/best-coffee-blogs/")
MyTXT=response.text
print(response.text)



## Create list
MyList=MyTXT.split(" ")
print(MyList)


MyVectLDA=CountVectorizer(input='content')
##path="C:\\Users\\profa\\Documents\\Python Scripts\\TextMining\\DATA\\SmallTextDocs"
data_vectorized = MyVectLDA.fit_transform(MyList)
ColumnNamesLDA=MyVectLDA.get_feature_names()
print(ColumnNamesLDA)
FinalDF=pd.DataFrame(data_vectorized.toarray(),columns=ColumnNamesLDA)

RemoveWords=["href", "class", "div", "block", "nav", "pagination",
             "space", "https", "http", "template", "squarespace", "id", "jpg", "image",
             "header", "function", "folder"]



## Exmaple of how to remove certain words from your dataframe
## Removal can be using re - can be based on word length, etc

for nextcol in FinalDF.columns:
    if(re.search(r'[^A-Za-z]+', nextcol)):
        #print(nextcol)
        FinalDF=FinalDF.drop([nextcol], axis=1)
    #    ## The following will remove any column with name
    #    ## of 3 or smaller - like "it" or "of" or "pre".
    #    ##print(len(nextcol))  ## check it first
    #    ## NOTE: You can also use this code to CONTROL
    #    ## the words in the columns. For example - you can
    #    ## have only words between lengths 5 and 9.
    #    ## In this case, we remove columns with words <= 3.
    elif(len(str(nextcol))<6):
        print(nextcol)
        FinalDF=FinalDF.drop([nextcol], axis=1)
    elif(len(str(nextcol))>15):
        print(nextcol)
        FinalDF=FinalDF.drop([nextcol], axis=1)
    elif(nextcol in RemoveWords):
        print(nextcol)
        FinalDF=FinalDF.drop([nextcol], axis=1)


print(FinalDF)




tempdf = FinalDF
print(tempdf)

tempdf =tempdf.sum(axis=0,numeric_only=True)
print(tempdf)

#Make var name
WC1=WordCloud(width=1000, height=600, background_color="white",
              min_word_length=4, #mask=next_image,
              max_words=200).generate_from_frequencies(tempdf)

## Here, this list holds all three wordclouds I am building

##########
########## Create the wordcloud
##########
fig=plt.figure(figsize=(25, 25))
#figure, axes = plt.subplots(nrows=2, ncols=2)



plt.imshow(WC1, interpolation='bilinear')
plt.axis("off")
plt.savefig("NewClouds.pdf")
