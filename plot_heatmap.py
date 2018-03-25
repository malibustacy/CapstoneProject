def plot_heatmap(timeSeries, best_method, best_metric):
    mask = timeSeries.isnull().T
    with sns.axes_style("white"):
        ax = sns.clustermap(timeSeries.T.fillna(0), metric=best_metric,method=best_method, col_cluster = False,figsize=(17,15),mask = mask)
        plt.show()


## advanced heatmap with annotation

def print_heatmap2(timeSeries, user_cycle_df, cycle_length, metric, method, first_cycle = True):
    import seaborn as sns; sns.set(color_codes=True)

    if cycle_length == "all":
        users = user_cycle_df[["user","cycle_index","cycle_number"]]
        users = users.set_index(users.cycle_index)
        figsize = (15,30)

    else:
        users = user_cycle_df[user_cycle_df.cycle_length == cycle_length][["user","cycle_index","cycle_number"]]
        users = users.set_index(users.cycle_index)
        figsize = (15,15)

    timeSeries = timeSeries.T.reset_index().set_index("cycle_index").drop("level_0", axis = 1)



    max_cycle_numbers = len(users.cycle_number.unique())-3
    colors = "rrr"+("w"*max_cycle_numbers)

    lut = dict(zip(users.user.unique(), sns.hls_palette(len(set(users.user)),l=0.4)))
    row_colors = users.user.map(lut).rename("user")

    lut2 = dict(zip(users.cycle_number.unique(), colors))
    row_colors2 = users.cycle_number.map(lut2).rename("first cycle")

    row_color = [row_colors2, row_colors]
    if first_cycle == False:
        row_color = row_colors

    mask = timeSeries.isnull()
    with sns.axes_style("white"):
        ax = sns.clustermap(timeSeries.fillna(0),
                    metric=metric,method=method,
                    col_cluster = False,
                    figsize=figsize,
                    row_colors = row_color,
                    mask = mask)
