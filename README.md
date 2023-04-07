# INFO 5871-002: Special Topics
text mining is focused on uncovering useful information from text data, while NLP is focused on the development 
of algorithms for analyzing and understanding human language. 

NP is used to understand human language; TM is used to extract information. It focuses on structure rather than the meaning of content.

Density-based clustering
Partition-based and hierarchical clustering techniques are highly efficient with normal shaped clusters. However, when it comes to arbitrary shaped clusters or detecting outliers, density-based techniques are more efficient.

The main idea behind DBSCAN is that a point belongs to a cluster if it is close to many points from that cluster.

There are two key parameters of DBSCAN:

eps: The distance that specifies the neighborhoods. Two points are considered to be neighbors if the distance between them are less than or equal to eps.

minPts: Minimum number of data points to define a cluster.

Based on these two parameters, points are classified as core point, border point, or outlier:

Core point: A point is a core point if there are at least minPts number of points (including the point itself) in its surrounding area with radius eps.

Border point: A point is a border point if it is reachable from a core point and there are less than minPts number of points within its surrounding area.

Outlier: A point is an outlier if it is not a core point and not reachable from any core points.

Pros and Cons of DBSCAN
Pros:
•	Does not require to specify number of clusters beforehand.
•	Performs well with arbitrary shapes clusters.
•	DBSCAN is robust to outliers and able to detect the outliers.
Cons:
•	In some cases, determining an appropriate distance of neighborhood (eps) is not easy and it requires domain knowledge.
•	If clusters are very different in terms of in-cluster densities, DBSCAN is not well suited to define clusters. The characteristics of clusters are defined by the combination of eps-minPts parameters. Since we pass in one eps-minPts combination to the algorithm, it cannot generalize well to clusters with much different densities.


One of the advantages of hierarchical clustering is that we do not have to specify the number of clusters (but we can).
Hierarchical clustering means creating a tree of clusters by iteratively grouping or separating data points. There are two types of hierarchical clustering:
•	Agglomerative clustering
•	Divisive clustering

Agglomerative clustering
Agglomerative clustering is kind of a bottom-up approach. Each data point is assumed to be a separate cluster at first. Then the similar clusters are iteratively combined. dendrogram which is a diagram representing tree-based approach.

Pros and Cons
I will try to explain advantages and disadvantes of hierarchical clustering as well as a comparison with k-means clustering which is another widely used clustering technique.

Pros
•	Do not have to specify the number of clusters beforehand. The number of clusters must be specified for k-means algorithm.
•	It is easy to implement and interpretable with the help of dendrograms.
•	Always generates the same clusters. K-means clustering may result in different clusters depending on the how the centroids (center of cluster) are initiated.
Cons
•	It is a slower algorithm compared to k-means. Hierarchical clustering takes long time to run especially for large data sets.

K-Means
Pros and Cons
Pros:
•	Easy to interpret
•	Relatively fast
•	Scalable for large data sets
•	Able to choose the positions of initial centroids in a smart way that speeds up the convergence
•	Guarantees convergence
Cons:
•	Number of clusters must be pre-determined. K-means algorithm is not able to guess how many clusters exist in the data. Determining number of clusters may well be a challenging task.
•	Can only draw linear boundaries. If there is a non-linear structure separating groups in the data, k-means will not be a good choice.
•	Slows down as the number of samples increases because at each step, k-means algorithm accesses all data points and calculates distances. An alternative way is to use a subset of data points to update the location of centroids (i.e. sklearn.cluster.MiniBatchKMeans)
•	Sensitive to outliers

It halts creating and optimizing clusters when either:
•	The centroids have stabilized — there is no change in their values because the clustering has been successful.
•	The defined number of iterations has been achieved.

DTM: Doc are rows, words are cols. cluster in certain way. DocumentTermMatrix

TDM: Doc are cols, words are rows. cluster in certain way. TermDocumentMatrix

Record data: Record data contains rows and columns(variables, attributes, fields, or features). Record data can be mixed meaning that some variables are qualitative (names, categories, descriptions, etc.), while other variables may be quantitative (numeric). record data can be all numeric or all qualitative. dataframe is record format. Text can be record data
Label, Gender, Cholesterol, Weight, Height, StressLevel... 

JSON: semi-structured data

Corpus: folder of text files, structure but the text files in the corpus need not be assumed to be structured

Consider/Update Types, Formats, and Model Goals Introduction to “Cleaning”
Missing Values  
Incorrect Values   
Duplications  
Outliers  
Formatting for Models Transformation Normalization

Precision = TP/TP+FN Measure of Sensitivity
Recall = TP/TP+FP Measure of Specificity
F-measure = 2TP/2TP+FP+TN

Data Structures: 
Primitive: Integer, Float, String, Boolean
Non-Primitive: Array, List(Linear: Stacks, Queues; Non-Linear: Graphs, Trees), Tuple, Dictionary, Set, File

Transaction: text as transactions, basket data. you can think of the words in text data as being the variables. We can tokenize text data (break it into tokens – or words) and then we can vectorize (create a dataframe or matrix where the words are the column names and the documents are the rows).

API: is an Application Programming Interface. An API is an interface that allows and enables interaction    

rhs = right hand side

LDA for topic modeling  

Discovering the abstract topics that occur in a collection of documents

Latent which means hidden or unknown Dirichlet Allocation is an example of topic modeling and is used to classify text in a document to a particular topic

It builds a topic per document model and words per topic model, modeled as Dirichlet distributions 

Topic modeling can be used to organized text, indirectly in prediction, better understand documents, search optimization and summarize, discover hidden themes/associations

1)	Each document is a collection or set of words.  
2)	Each topic is a set or collection of words.  

•	A collection of documents is called a corpus.  
•	Documents are a collection of words.  
(Also called a Bag of Words – order does not matter)  
•	Similar documents contain collections of similar words.    
•	Words carry semantic information – but not all words!  
•	Words like: am, is, the, and, a, but, etc. carry no information and should be removed. (These are stopwords).  
•	To better differentiate between topics and documents, we might remove all words that occur in say 85% or more of the documents (like of or it).  
•	This could also result in the removal of non-stopwords like “cancer” for example if all of our documents are cancer research and we want to model the topics (other than cancer)  
A “Latent” topic is a hidden or unknown topic – it exists, but we do not know it yet.  
LDA assumes that documents in a corpus conform to a specific structure.  

1.	The number of documents is known. (We tell the algorithm)
2.	All documents are in a corpus (and nothing else is in the corpus folder)
3.	The number of topics, k, is also known – we choose and tell the algorithm.
4.	Documents are thought of as probability distributions over topics.
5.	Topics are thought of as probability distributions over words.
      
LDA uses probability distributions and not frequencies.  
LDA:  
-A Topic is a Mixture of Words  
-A Doc is a Mixture of Topics  

LDA Algorithm
1)	Randomly assign a topic to every word in all documents.
2)	Randomly assign a topic to each document.
3)	Optimize



1. Nearest Neighbour Method – create groups by starting with the smallest distances and build branches
   In effect we keep asking data matrix “Which plot is my nearest neighbour?” to add branches  
2. Centroid Method – creates a group based on smallest distance to group centroid rather than group member
   First creates a group based on small distance then uses the centroid of that group to find which additional points belong in the same group  
3. Wards Method – creates groups such that variance is minimized within clusters  


Consider a document containing 100 words and the word cat appears 3 times.   
The term frequency (i.e., tf) for cat is then (3 / 100) = 0.03.   
Now, assume we have 100,000 documents and the word cat appears in 1000 of these.  
Then, the inverse document frequency (i.e., idf) is calculated as log(100,000 / 1000) = 2.   
Thus, the Tf-idf weight is the product of these quantities:     .03 *  2 = .06  

Graphs and Networks  
Simple abstractions, model problems involving relationships. Applications; connections between individuals, groups, organizations, and societies. Networks are mathematical graphs, with vertices(nodes) and edges(links).  

Network == Graph, networks are collections of points joined by lines  

Network types: Undirected (symmetric, reciprocal relationship), Directed(asymmetric, non-reciprocal relationship)  

Node Degree: The number of neighbors an individual node has  

Diameter: max (all shortest paths in the graph)  

Shortest path: least number of edges, never loops or cycles  

Goals of studying networks:  
-Characterize structure  
-Understand the behavior  
-Prediction of behavior and spread/transmission  

Node Betweenness Centrality - BC  
•	Measure of BC in a graph based on shortest paths.  
•	BC measures the extent to which a vertex/node lies on paths between other vertices.  
•	Vertices with high betweenness have greater influence within a network due to their control/affect of information passing between other nodes.  
•	To disrupt communications in a network, node with greatest BC can be removed.   

Beer and diapers correlation: people who buy diapers will likely buy beer.  

The apriori algorithm Based on frequency of itemsets  

Kmode when gender is not correlated, then it cause the error

Word embedding methods convert words to numbers while also identifying the semantics and syntaxes of the word such as Word2Vec, GloVe, ELMo, FastText: find better ways to represent more information.  

CountVectorizer in Python: is a scikit-learn (sklearn) package that uses count vectorization to convert a collection of text documents (as csv, txt, corpus, etc) to a DTM (document term matrix) of token (such as word) counts. This DTM can be converted to a pandas dataframe.  

The shortest document contains 50 words and the longest document contains 50,000 words.   
Can we use CountVectorizer here?  
Not without normalization  

TF: Term Frequency  
IDF: Inverse Document Frequency  
This weight is a statistical measure used to evaluate how important a word is to a document in a collection or corpus. The importance increases proportionally to the number of times a word appears in the document but is offset by the frequency of the word in the corpus.  
