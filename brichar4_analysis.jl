using CSV, DataFrames, GLM, Plots, HypothesisTests, MLJ

input_file = open("/gpfs/data/biol1555/projects2022/team10/brichar4_age_education.txt", "r")
output_file = open("education_linear_model.txt", "w")

education_df = CSV.File(input_file, header=1, footerskip=0, delim="|") |> DataFrame

#create subset of each education status
x1 = filter(:mothers_education => ==("8th grade or less"), education_df)[!, :age]
x2 = filter(:mothers_education => ==("9th-12th grade with no diploma"), education_df)[!, :age]
x3 = filter(:mothers_education => ==("High school graduate"), education_df)[!, :age]
x4 = filter(:mothers_education => ==("Some college credit, but no degree"), education_df)[!, :age]
x5 = filter(:mothers_education => ==("Associate's degree"), education_df)[!, :age]
x6 = filter(:mothers_education => ==("Bachelor's degree"), education_df)[!, :age]
x7 = filter(:mothers_education => ==("Master's degree"), education_df)[!, :age]
x8 = filter(:mothers_education => ==("Doctorate or professional degree"), education_df)[!, :age]
x9 = filter(:mothers_education => ==("Unknown"), education_df)[!, :age]




#get summary stats for overall and each subset
overall_data = DataFrame(OverallAge=education_df[!, :age])
print(output_file, describe(DataFrame(OverallAge=education_df[!, :age])))
print(output_file, "\n\n")
print(output_file, describe(DataFrame(EigthGradeOrLessAge=x1)))
print(output_file, "\n\n")
print(output_file, describe(DataFrame(NinthTwelthGradeNoDiplomaAge=x2)))
print(output_file, "\n\n")
print(output_file, describe(DataFrame(HighSchoolGraduateAge=x3)))
print(output_file, "\n\n")
print(output_file, describe(DataFrame(SomeCollegeCreditAge=x4)))
print(output_file, "\n\n")
print(output_file, describe(DataFrame(AssociatesDegreeAge=x5)))
print(output_file, "\n\n")
print(output_file, describe(DataFrame(BachelorsDegreeAge=x6)))
print(output_file, "\n\n")
print(output_file, describe(DataFrame(MastersDegreeAge=x7)))
print(output_file, "\n\n")
print(output_file, describe(DataFrame(DoctorateProfessionalAge=x8)))
print(output_file, "\n\n")
print(output_file, describe(DataFrame(UnknownAge=x9)))
print(output_file, "\n\n")

#anova HypothesisTests
anova_test = HypothesisTests.OneWayANOVATest(x1,x2,x3,x4,x5,x6,x7,x8,x9)
print(output_file, "$(anova_test)\n")

#reorder levels
#education_df[birth_df.birthplace .=="Hospital" ,:birthplace] .= "AHosptial"

#linear regression
#split into train/test sets
y = education_df.age
x = select(education_df, Not(:age))
train, test = partition(eachindex(y), .7)
#form back into dataframes
train_df = DataFrame(education_df[train,:])
test_df = DataFrame(education_df[test,:])
#linear regression
lin_mod_education = lm(@formula(age ~ mothers_education), train_df)

print(output_file, lin_mod_education)
print(output_file, "\n")

#calculate MSE
mse_train = mean(((train_df.age-GLM.predict(lin_mod_education))).^2)
mse_test = mean(((test_df.age-GLM.predict(lin_mod_education, test_df))).^2)
print(output_file, "Training Set MSE = $mse_train\n")
print(output_file, "Testing Set MSE = $mse_test\n")
