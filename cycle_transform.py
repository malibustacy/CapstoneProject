def cycle_transform(df, value, save = True):

    value_ = df[["cycle_day", value, "cycle_index"]]

    value_zero = value_.pivot_table(index = "cycle_day", columns="cycle_index", values = value_).fillna(0)
    value_nan = value_.pivot_table(index = "cycle_day", columns="cycle_index", values = value_)

    if save == True:
        value_zero.to_csv("Data/"+value+"_zero.csv")
        value_nan.to_csv("Data/"+value+"_nan.csv")
    return value_zero, value_nan




#df_regLen = pd.read_csv("Data/regLen.csv").drop(["Unnamed: 0", "index"], axis = 1)

#groupby_cycles = df_regLen.groupby(["cycle_index","user","cycle_number"]).mean()
#user_cycle_df = pd.DataFrame(groupby_cycles.reset_index()[["cycle_index", "user", "cycle_number", "cycle_length"]])
#user_cycle_df["cycle_length"] = user_cycle_df["cycle_length"].astype(int)

#missing days interpolated
#md = pd.read_csv("Data/missingdays_interpolated.csv")
#complete cycles
#cc = pd.read_csv("Data/data_clean2.csv")


#example
#hr29_norm_zero, hr29_norm_nan = cycle_transform(md[md.cycle_length == 29], "hr_norm", True)
#hr29_norm_zero2, hr29_norm_nan2 = cycle_transform(cc[cc.cycle_length == 29], "hr_norm", True)
