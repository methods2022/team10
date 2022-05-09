using CSV, DataFrames, GLM, Plots, HypothesisTests, MLJ

input_file = open("/gpfs/data/biol1555/projects2022/team10/birthplace_cleaned.txt", "r")
output_file = open("birthplace_linear_model.txt", "w")

birth_df = CSV.File(input_file, header=1, footerskip=0, delim="|") |> DataFrame

#create subset of each birthplace setting
x1 = filter(:birthplace => ==("Hospital"), birth_df)[!, :age]
x2 = filter(:birthplace => ==("Freestanding Birth Center"), birth_df)[!, :age]
x3 = filter(:birthplace => ==("Home (intended)"), birth_df)[!, :age]
x4 = filter(:birthplace => ==("Home (unintended)"), birth_df)[!, :age]
x5 = filter(:birthplace => ==("Home (unknown intention)"), birth_df)[!, :age]
x6 = filter(:birthplace => ==("Clinic/Doctor's Office"), birth_df)[!, :age]
x7 = filter(:birthplace => ==("Other"), birth_df)[!, :age]
x8 = filter(:birthplace => ==("Unknown"), birth_df)[!, :age]

x9 = filter(:general_birthplace => ==("Hospital"), birth_df)[!, :age]
x10 = filter(:general_birthplace => ==("Not in Hospital"), birth_df)[!, :age]
x11 = filter(:general_birthplace => ==("Unknown"), birth_df)[!, :age]

#get five-number summary for overall and each subset
print(output_file, describe(DataFrame(OverallAge=birth_df[!, :age])))
print(output_file, "\n\n")
print(output_file, describe(DataFrame(HosptialAge=x1)))
print(output_file, "\n\n")
print(output_file, describe(DataFrame(BirthCenterAge=x2)))
print(output_file, "\n\n")
print(output_file, describe(DataFrame(HomeIntendedAge=x3)))
print(output_file, "\n\n")
print(output_file, describe(DataFrame(HomeUnintendedAge=x4)))
print(output_file, "\n\n")
print(output_file, describe(DataFrame(HomeUnknownAge=x5)))
print(output_file, "\n\n")
print(output_file, describe(DataFrame(ClinicOfficeAge=x6)))
print(output_file, "\n\n")
print(output_file, describe(DataFrame(OtherLocationAge=x7)))
print(output_file, "\n\n")
print(output_file, describe(DataFrame(UnknownLocationAge=x8)))
print(output_file, "\n\n")

#anova HypothesisTests
anova_test = HypothesisTests.OneWayANOVATest(x1,x2,x3,x4,x5,x6,x7,x8)
print(output_file, "$(anova_test)\n")
anova_test_general = HypothesisTests.OneWayANOVATest(x9,x10,x11)
print(output_file, "$(anova_test_general)\n")

#reorder levels
birth_df[birth_df.birthplace .=="Hospital" ,:birthplace] .= "AHosptial"

#linear regression
#split into train/test sets
y = birth_df.age
x = select(birth_df, Not(:age))
train, test = partition(eachindex(y), .7)
#form back into dataframes
train_df = DataFrame(birth_df[train,:])
test_df = DataFrame(birth_df[test,:])

#all locations
lin_mod_all_locations = lm(@formula(age ~ birthplace), train_df)
print(output_file, lin_mod_all_locations)
print(output_file, "\n")
#calculate MSE
mse_train = mean(((train_df.age-GLM.predict(lin_mod_all_locations))).^2)
mse_test = mean(((test_df.age-GLM.predict(lin_mod_all_locations, test_df))).^2)
print(output_file, "Training Set MSE = $mse_train\n")
print(output_file, "Testing Set MSE = $mse_test\n")

#general locations
lin_mod_general = lm(@formula(age ~ general_birthplace), train_df)
print(output_file, lin_mod_general)
print(output_file, "\n")
mse_train = mean(((train_df.age-GLM.predict(lin_mod_general))).^2)
mse_test = mean(((test_df.age-GLM.predict(lin_mod_general, test_df))).^2)
print(output_file, "Training Set MSE = $mse_train\n")
print(output_file, "Testing Set MSE = $mse_test\n")

