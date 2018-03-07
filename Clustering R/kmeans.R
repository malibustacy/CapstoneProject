# Build a kmeans model
model_km2 <- kmeans(lineup, centers = 2)

# Extract the cluster assignment vector from the kmeans model
clust_km2 <- model_km2$cluster

# Create a new dataframe appending the cluster assignment
lineup_km2 <- mutate(lineup, cluster = clust_km2)

# Plot the positions of the players and color them using their cluster
ggplot(lineup_km2, aes(x =x, y = y, color = factor(cluster))) +
  geom_point()




  ######
  # Build a kmeans model
  model_km3 <- kmeans(lineup, centers = 3)

  # Extract the cluster assignment vector from the kmeans model
  clust_km3 <- model_km3$cluster

  # Create a new dataframe appending the cluster assignment
  lineup_km3 <- mutate(lineup,cluster = model_km3$cluster)

  # Plot the positions of the players and color them using their cluster
  ggplot(lineup_km3, aes(x = x, y = y, color = factor(cluster))) +
    geom_point()
