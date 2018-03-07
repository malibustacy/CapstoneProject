library(purrr)

# Use map_dbl to run many models with varying value of k (centers)
tot_withinss <- map_dbl(1:10,  function(k){
  model <- kmeans(lineup, centers = k)
  model$tot.withinss
})

# Generate a data frame containing both k and tot_withinss
elbow_df <- data.frame(
  k = 10,
  tot_withinss = tot_withinss
)


# Plot the elbow plot
ggplot(elbow_df, aes(x = k, y = tot_withinss)) +
  geom_line() +
  scale_x_continuous(breaks = 1:10)


  library(cluster)

  # Generate a k-means model using the pam() function with a k = 2
  pam_k2 <- pam(lineup, k = 2)

  # Plot the silhouette visual for the pam_k2 model
  plot(silhouette(pam_k2))

  # Generate a k-means model using the pam() function with a k = 3
  pam_k3 <-  pam(lineup, k = 3)

  # Plot the silhouette visual for the pam_k3 model
  plot(silhouette(pam_k3))
