
# This is a script to make a boxplot for the smoking risk factor 
# This script must be copied into the Julia in terminal for it to work 

# Load in the packages 
using DataFrames
using CSV
using Plots
using PlotlyJS

# Read in the data frame 
input_file = open("/gpfs/data/biol1555/thedspet/1_code/vitalcleaned.txt", "r")

# Create the boxplots 
function plot()
    smokeplot = CSV.File(input_file, header=1, footerskip=0, delim="|") |> DataFrame
    plotlyjs()
    display(PlotlyJS.plot(smokeplot, x=:Smoke_Status, y=:Gestational_Age, kind="box", mode="markers",
    Layout(title="Gestational Age at Death Between Birth Locations",
    xaxis_title= "Birth Setting", yaxis_title= "Gestastional Age (Weeks)")
    ))
    display(PlotlyJS.plot(smokeplot, x=:Smoke_Status, y=:Gestational_Age, kind="box", mode="markers",
    Layout(title="Gestational Age at Death Between General Birth Locations",
    xaxis_title= "General Birth Setting", yaxis_title= "Gestastional Age (Weeks)")
    ))
end

# Run the function 
plot()
