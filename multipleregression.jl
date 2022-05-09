# This code is for multiple linear regression for all the variables of 
# interest in our analysis 

# Package that we use for this 
using CSV, DataFrames, GLM, Plots, HypothesisTests, MLJ

# Read in our data set 
input_file = open("/gpfs/data/biol1555/projects2022/team10/multiple_regression_data.txt", "r")
output_file = open("model_output.txt", "w")

# Create the data frame 
data_frame = CSV.File(input_file, header=1, footerskip=0, delim="|") |> DataFrame

# Split the data into the training and testing set for our anlysis 
y = data_frame.Gestational_Age
x = select(data_frame, Not(:Gestational_Age))
train, test = partition(eachindex(y), .7)
train_df = DataFrame(data_frame[train,:])
test_df = DataFrame(data_frame[test,:])

#Create the multiple regression model 
multiple_regression = lm(@formula(Gestational_Age ~ Sex+Education+Birthplace+Race+Smoke_Status), train_df)
print(output_file, multiple_regression)
print(output_file, "\n")

#MSE of training and testing set
mse_train = mean(((train_df.Gestational_Age-GLM.predict(multiple_regression))).^2)
mse_test = mean(((test_df.Gestational_Age-GLM.predict(multiple_regression, test_df))).^2)
print(output_file, "Training Set MSE = $mse_train\n")
print(output_file, "Testing Set MSE = $mse_test\n")
