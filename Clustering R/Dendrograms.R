#Dendrograms

library(dendextend)
distance_df <- dist(df, method = "euclidean")
hclust_object <- hclust(distance_df, method = "complete")
dend_object  <- as.dendrogram(hclust_object)
#cut at height 15 and then color the different clusters
dend_colored <- color_brances(dend_object, h = 15)

#or just say I want two clusters
dend_colored <- color_brances(dend_object, k = 2)
plot(dend_colored)


#example
library(dendextend)
dist_players <- dist(lineup, method = 'euclidean')
hc_players <- hclust(dist_players, method = "complete")

# Create a dendrogram object from the hclust variable
dend_players <- as.dendrogram(hc_players)

# Plot the dendrogram
plot(dend_players)

# Color branches by cluster formed from the cut at a height of 20 & plot
dend_20 <- color_branches(dend_players, h = 20)

# Plot the dendrogram with clusters colored below height 20
plot(dend_20)


# Color branches by cluster formed from the cut at a height of 40 & plot
dend_40 <-  color_branches(dend_players, h = 40)

# Plot the dendrogram with clusters colored below height 40
plot(dend_40)


### example 2
# Calculate euclidean distance between customers
dist_customers <- dist(customers_spend, method ="euclidean")

# Generate a complete linkage analysis
hc_customers <- hclust(dist_customers, method = "complete")

# Plot the dendrogram
plot(hc_customers)

# Create a cluster assignment vector at h = 15000
clust_customers <- cutree(hc_customers, h=15000)

# Generate the segmented customers dataframe
segment_customers <- mutate(customers_spend, cluster = clust_customers)
