hr.29<- read.csv("/Users/sarahkirsch/Propulsion Academy/CapstoneProject/Data/hr_29_norm.csv")
br.29<- read.csv("/Users/sarahkirsch/Propulsion Academy/CapstoneProject/Data/br_29_norm.csv")
##Different distance calculation methods
#euclidean, maximum, manhattan, canberra, binary, minkowski, pearson, spearman, kendall
#different clustering methods
#ward.D, ward.D2, single, complete, average, mcquitty, median, centroid
library(ComplexHeatmap)

my_matrix <- as.matrix(br.29[,-1])

h.29 <- Heatmap(t(my_matrix),
            name = "z-score", column_title = "Breathing Rate (Cycle length 29 days)",
            cluster_columns = F,
            row_names_side = "left",
            row_dend_side = "left",
            row_dend_width = unit(3, "cm"),
            clustering_distance_rows = "correlation",
            clustering_method_rows = "ward.D")
png(file = "br_29_euclidean_ward.png")
h.29
dev.off()
#draw(h.hr.29, heatmap_legend_side = "left", )
#cluster_info <- data.frame(cluster_number = hr.29.column)

library(dendextend)
#library(tidyverse)

dend <- hclust(dist(my_matrix, method = "euclidean"), method = "ward.D2")
dend

Heatmap(t(my_matrix),
        cluster_columns = F,
        row_names_side = "left",
        row_dend_side = "left",
        row_dend_width = unit(3, "cm"))
        #cluster_rows = color_branches(dend, k = 2))