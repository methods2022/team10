using DataFrames
using CSV
using Plots
using PlotlyJS

input_file = open("/gpfs/data/biol1555/projects2022/team10/birthplace_cleaned.txt", "r")

function MakeVisualization()

    fet_df = CSV.File(input_file, header=1, footerskip=0, delim="|") |> DataFrame
    plotlyjs()
    fig1 = PlotlyJS.plot(fet_df, x=:birthplace, y=:age, kind="box", mode="markers", 
    Layout(title="Gestational Age at Death Between Birth Locations",
    xaxis_title= "Birth Setting", yaxis_title= "Gestastional Age (Weeks)")
    )
    PlotlyJS.savefig(fig1, "birthplace.html")
    fig2 = PlotlyJS.plot(fet_df, x=:general_birthplace, y=:age, kind="box", mode="markers",
    Layout(title="Gestational Age at Death Between General Birth Locations",
    xaxis_title= "General Birth Setting", yaxis_title= "Gestastional Age (Weeks)")
    )
    PlotlyJS.savefig(fig2, "generalBirthplace.html")
end

MakeVisualization()
