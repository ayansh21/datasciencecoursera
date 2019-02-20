data(wine, package='rattle')
head(wine)
wine.stand <- scale(wine[-1])
k.means.fit <- kmeans(wine.stand, 3)
attributes(k.means.fit)
k.means.fit$centers
k.means.fit$cluster
k.means.fit$size
wssplot <- function(data, nc=15, seed=1234){
  wss <- (nrow(data)-1)*sum(apply(data,2,var))
  for (i in 2:nc){
    set.seed(seed)
    wss[i] <- sum(kmeans(data, centers=i)$withinss)}
  plot(1:nc, wss, type="b", xlab="Number of Clusters",
       ylab="Within groups sum of squares")}

wssplot(wine.stand, nc=6) 
library(cluster)
clusplot(wine.stand, k.means.fit$cluster, main='2D representation of the Cluster solution',
         color=TRUE, shade=TRUE,
         labels=2, lines=0)
table(wine[,1],k.means.fit$cluster)
d <- dist(wine.stand, method = "euclidean")
H.fit <- hclust(d, method="ward")
plot(H.fit)
groups <- cutree(H.fit, k=3)
rect.hclust(H.fit, k=3, border="red") 

