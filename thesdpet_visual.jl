
# This is a script to make a boxplot for the smoking risk factor 
# This script must be copied into the Julia in terminal for it to work 

# Load in the packages 
using DataFrames, CSV, Plots, PlotlyJS

# Define the file we are using 
input_file = open("/gpfs/data/biol1555/projects2022/smoking.txt", "r")

# Create the boxplot for age at gestational death based on the mother's smoking status 
    smoking_data_frame = CSV.File(input_file, header=1, footerskip=0, delim="|") |> DataFrame
    plotlyjs()
    display(PlotlyJS.plot(smoking_data_frame, x=:Smoke_Status, y=:Gestational_Age, kind="box", mode="markers",
    Layout(title="Age at Death, based on Mother's Smoking Status",
    xaxis_title= "Smoking Status of Mother", yaxis_title= "Gestastional Age")
    ))
    display(PlotlyJS.plot(smoking_data_frame, x=:Smoke_Status, y=:Gestational_Age, kind="box", mode="markers",
    Layout(title="Age at Death, based on Mother's Smoking Status",
    xaxis_title= "Smoking Status of Mother", yaxis_title= "Gestastional Age")
    ))
