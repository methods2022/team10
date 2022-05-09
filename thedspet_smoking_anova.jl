using CSV, DataFrames, GLM, Plots, HypothesisTests, MLJ

# Now that we have our packages lets us do anova

# read the input file and output file 
input_file = open("/gpfs/data/biol1555/projects2022/team10/smoking.txt", "r")
output_file = open("smoking_anova_results.txt", "w")

# Create the data Data
smokedf = CSV.File(input_file, header=1, footerskip=0, delim="|") |> DataFrame

# Define the different levels 
x1 = filter(:Smoke_Status => ==("No Smoke"), smokedf)[!, :Gestational_Age]
x2 = filter(:Smoke_Status => ==("Smoked"), smokedf)[!, :Gestational_Age]
x3 = filter(:Smoke_Status => ==("Unknown"), smokedf)[!, :Gestational_Age]

# Summary stats
print(output_file, describe(DataFrame(Overall=smokedf[!, :Gestational_Age])))
print(output_file, "\n\n")
print(output_file, describe(DataFrame(No_smoke = x1)))
print(output_file, "\n\n")
print(output_file, describe(DataFrame(smoke = x2)))
print(output_file, "\n\n")
print(output_file, describe(DataFrame(Unkown = x3)))
print(output_file, "\n\n")

anova = HypothesisTests.OneWayANOVATest(x1,x2,x3)
print(output_file, "$(anova)\n")
