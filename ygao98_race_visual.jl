using PlotlyJS, CSV, DataFrames
# # load file
file_name = "/gpfs/data/biol1555/projects2022/team10/ygao98_race_cleaned.csv"
df = CSV.File(file_name) |> DataFrame
p1 = plot(df, x=:race, y=:gestational_age, kind="box", color=:race,
             Layout(title="Gestational Age at Death by Race", xaxis_title="race", yaxis_title="gestational age (weeks)"))
savefig(p1,"fig/plot_race.png")

p2 = plot(df, x=:race_detail, y=:gestational_age, kind="box", color=:race_detail, legend=:bottom,
             Layout(title="Gestational Age at Death by 31 Races", xaxis=attr(
                showgrid=false,
                zeroline=false,
                showticklabels=false
            ), xaxis_title="race", yaxis_title="gestational age (weeks)"))
savefig(p2,"fig/plot_race_detail.png")

p3 = plot(
    df, x=:gestational_age, marker=attr(opacity=0.8, color="indianred"), kind="histogram",
    Layout(title_text="Histogram of Gestational Age at Death", xaxis_title_text="gestational age at death (weeks)")
)
savefig(p3, "fig/plot_gestational_age.png")
