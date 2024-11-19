library(ggplot2)
cluster_data <- read.csv("data/cluster_data.csv")
plot(cluster_data)

Kmeans_3 <- kmeans(cluster_data, centers = 3)
Kmeans_4 <- kmeans(cluster_data, centers = 4)
plot(x2~x1, data = cluster_data,xlim=c(0,4),ylim=c(0,4),cex.axis=1.3, cex.lab=1.2,cex=1.2,pch=15 + Kmeans_3$cluster, col= Kmeans_3$cluster)
plot(x2~x1, data = cluster_data,xlim=c(0,4),ylim=c(0,4),cex.axis=1.3, cex.lab=1.2,cex=1.2,pch=15 + Kmeans_4$cluster, col= Kmeans_4$cluster)

Kmeans_3_50 <- kmeans(cluster_data, 3, nstart = 50)
Kmeans_4_50 <- kmeans(cluster_data, 4, nstart = 50)
plot(x2~x1, data = cluster_data,xlim=c(0,4),ylim=c(0,4),cex.axis=1.3, cex.lab=1.2,cex=1.2,pch=15 + Kmeans_3_50$cluster, col= Kmeans_3_50$cluster)
plot(x2~x1, data = cluster_data,xlim=c(0,4),ylim=c(0,4),cex.axis=1.3, cex.lab=1.2,cex=1.2,pch=15 + Kmeans_4_50$cluster, col= Kmeans_4_50$cluster)

wgss <- c()
for(i in 1:9) {
  wgss[i]<-kmeans(cluster_data,centers=i+1,nstart=50)$tot.withinss
}
plot(c(2:10), wgss, type = "b", pch=16)


