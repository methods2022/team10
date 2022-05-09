## This script file is to perform linear regression for 
## smoking status 


using CSV, DataFrames, GLM, Plots, HypothesisTests, MLJ

# Create the input file and output file 
input_file = open("/gpfs/data/biol1555/projects2022/team10/smoking.txt", "r")
output_file = open("smoking_model_output.txt", "w")

# Create a data frame for the analysis 
data_frame = CSV.File(input_file, header=1, footerskip=0, delim="|") |> DataFrame

# Split into test and train 
y = data_frame.Gestational_Age
x = select(data_frame, Not(:Gestational_Age))
train, test = partition(eachindex(y), .7)
train_df = DataFrame(data_frame[train,:])
test_df = DataFrame(data_frame[test,:])

#Create the  regression model 
regression = lm(@formula(Gestational_Age ~ Smoke_Status), train_df)
print(output_file, regression)
print(output_file, "\n")

#MSE of training and testing set
mse_train = mean(((train_df.Gestational_Age-GLM.predict(regression))).^2)
mse_test = mean(((test_df.Gestational_Age-GLM.predict(regression, test_df))).^2)
print(output_file, "Training Set MSE = $mse_train\n")
print(output_file, "Testing Set MSE = $mse_test\n")


