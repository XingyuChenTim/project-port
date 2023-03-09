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


