using CSV
using Plots
using PlotlyJS


input_file = open("/gpfs/data/biol1555/projects2022/team10/smoking.txt", "r")

MakeVisualization()
    fet_df = CSV.File(input_file, header=1, footerskip=0, delim="|") |> DataFrame
    plotlyjs()
    display(PlotlyJS.plot(fet_df, x=:Smoke_Status, y=:Gestational_Age, kind="box", mode="markers",
    Layout(title="Gestational Age at Death Between Birth Locations",
    xaxis_title= "Birth Setting", yaxis_title= "Gestastional Age (Weeks)")
    ))
    display(PlotlyJS.plot(fet_df, x=:Smoke_Status, y=:Gestational_Age, kind="box", mode="markers",
    Layout(title="Gestational Age at Death Between General Birth Locations",
    xaxis_title= "General Birth Setting", yaxis_title= "Gestastional Age (Weeks)")
    ))
end

MakeVisualization()