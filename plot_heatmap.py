def plot_heatmap(timeSeries, best_method, best_metric, cmap):
    ax = sns.clustermap(timeSeries, metric=best_metric,method=best_method, col_cluster = False,figsize=(12,10), cmap = cmap)
    plt.show()
