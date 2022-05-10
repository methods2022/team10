using CSV, DataFrames, GLM, Plots, HypothesisTests, MLJ

input_file = open("/gpfs/data/biol1555/projects2022/team10/sex_cleaned.txt", "r")
output_file = open("sex_linear_model.txt", "w")

sex_df = CSV.File(input_file, header=1, footerskip=0, delim="|") |> DataFrame

#create subset of each gender setting
jj = filter(:Gender_of_Fetus => ==("Male"), sex_df)[!, :Gestational_Week]
kk = filter(:Gender_of_Fetus => ==("Female"),sex_df)[!, :Gestational_Week]
xx = filter(:Gender_of_Fetus => ==("Unknown"), sex_df)[!, :Gestational_Week]

#get five-number summary for overall and each subset
print(output_file, describe(DataFrame(Age=sex_df[!, :Gestational_Week])))
print(output_file, "\n\n")

print(output_file, describe(DataFrame(MaleAge=jj)))
print(output_file, "\n\n")

print(output_file, describe(DataFrame(FemaleAge=kk)))
print(output_file, "\n\n")

print(output_file, describe(DataFrame(Unknown=xx)))
print(output_file, "\n\n")

#anova HypothesisTests
anova = HypothesisTests.OneWayANOVATest(jj,kk,xx)
print(output_file, "$(anova)\n")

#linear regression
#split into train/test sets
y = sex_df.Gestational_Week
x = select(sex_df, Not(:Gestational_Week))
train, test = partition(eachindex(y), .7)
#form back into dataframes
train_df = DataFrame(sex_df[train,:])
test_df = DataFrame(sex_df[test,:])

#all locations
linear_model = lm(@formula(Gestational_Week ~ Gender_of_Fetus), train_df)
print(output_file, linear_model)
print(output_file, "\n")

#calculate MSE
mse_train = mean(((train_df.Gestational_Week-GLM.predict(linear_model))).^2)
mse_test = mean(((test_df.Gestational_Week-GLM.predict(linear_model, test_df))).^2)
print(output_file, "Training Set MSE = $mse_train\n")
print(output_file, "Testing Set MSE = $mse_test\n")

