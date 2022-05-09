using DataFrames
using CSV
using Plots
using PlotlyJS
# x = 1:10; y = rand(10);
# p = Plots.plot(x, y)
# display(p)
input_file = open("/gpfs/data/biol1555/projects2022/team10/sex_cleaned.txt", "r")
function MakeVisualization()
    df = CSV.File(input_file, header=1, footerskip=0, delim="|") |> DataFrame
    #print counts
    #fet_count_df = combine(groupby(fet_df, :birthplace), nrow => :N)
    #print(fet_count_df)
    plotlyjs()
    display(PlotlyJS.plot(df, x=:Gender_of_Fetus, y=:Gestational_Week, kind="box", mode="markers",
    Layout(title="Gestational Age (in weeks) at Death Between Gender", 
    xaxis_title= "Gender", yaxis_title= "Gestastional Age (Weeks)")))
   
end