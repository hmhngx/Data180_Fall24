library(MASS)
library(dplyr)
library(cluster.datasets)
library(ggdendro)
data(Cars93)
data(acidosis.patients)

example <- hclust(dist(acidosis.patients))
plot(example,xlab = "", main = "Example Clustering")
rect.hclust(example, k=6)

data("USArrests")
dd <- dist(scale(USArrests), method = "euclidian")
hc <- hclust(dd)
ggdendrogram(hc)

cars <- Cars93 %>% select(Min.Price, Max.Price, MPG.city, MPG.highway, Fuel.tank.capacity)

min_and_max_price_dist <- matrix(c(cars$Min.Price, cars$Max.Price), nrow = 3  , byrow=3)
min_and_max_price_dist
dist(min_and_max_price_dist, method = "manhattan")
