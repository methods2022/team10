using DataFrames, CSV, Plots, PlotlyJS


input_file = open("/gpfs/data/biol1555/projects2022/team10/brichar4_age_education.txt", "r")


    df = CSV.File(input_file, header=1, footerskip=0, delim="|") |> DataFrame

    plotlyjs()

    display(PlotlyJS.plot(df, x=:mothers_education, y=:age, kind="box", mode="markers",
Layout(title = "Gestational Age at Death Between Mother’s Education Status",

    xaxis_title= "Education Status", yaxis_title= "Gestastional Age (Weeks)")

    ))

output_file = 

end


#MakeVisualization()