### summary statistics
using CSV, DataFrames, GLM, HypothesisTests, MLJ, PlotlyJS
# load file
file_name = "/gpfs/data/biol1555/projects2022/team10/ygao98_race_cleaned.csv"
df = CSV.File(file_name) |> DataFrame

# create subsets
w = filter(:race => ==("White(alone)"), df)[!, :gestational_age]
b = filter(:race => ==("Black(alone)"), df)[!, :gestational_age]
ai = filter(:race => ==("AIAN(alone)"), df)[!, :gestational_age]
as = filter(:race => ==("Asian(alone)"), df)[!, :gestational_age]
n = filter(:race => ==("NHOPI(alone)"), df)[!, :gestational_age]
m = filter(:race => ==("More than one race"), df)[!, :gestational_age]

# print the output to the file
output_file = open("race_stats.txt", "w")
print(output_file, describe(DataFrame(gestational_age = df.gestational_age)))
print(output_file, "\n\n")

print(output_file, describe(DataFrame(White = w)))
print(output_file, "\n\n")

print(output_file, describe(DataFrame(Black = b)))
print(output_file, "\n\n")

print(output_file, describe(DataFrame(AIAN = ai)))
print(output_file, "\n\n")

print(output_file, describe(DataFrame(Asian = as)))
print(output_file, "\n\n")

print(output_file, describe(DataFrame(NHOPI = n)))
print(output_file, "\n\n")

print(output_file, describe(DataFrame(More_than_one_race = m)))
print(output_file, "\n\n")

### ANOVA Table
anova = HypothesisTests.OneWayANOVATest(w, b, ai, as, n, m)
print(output_file, "$(anova)\n\n")

### Linear Regression Model

# split the dataset into training/test sets by 70:30
y = df.gestational_age
x = select(df, Not(:gestational_age))
train, test = partition(eachindex(y), .7)

train_df = DataFrame(df[train,:])
test_df = DataFrame(df[test,:])

# train the model
linear_model = lm(@formula(gestational_age ~ race), train_df)
print(output_file, linear_model)
print(output_file, "\n\n")

#calculate MSE
train_predict = GLM.predict(linear_model)
test_predict = GLM.predict(linear_model, test_df)

mse_train = mean(((train_df.gestational_age - train_predict)).^2)
mse_test = mean(((test_df.gestational_age - test_predict)).^2)
print(output_file, "Training Set MSE = $mse_train\n")
print(output_file, "Test Set MSE = $mse_test\n")

# visualize the result
performance_testdf = DataFrame(y_actual = test_df[!,:gestational_age], 
                               y_predicted = test_predict)

p = plot(scatter(x=performance_testdf[!,:y_actual], y=performance_testdf[!,:y_predicted],
                 mode="markers", title = "Predicted value vs Actual value on Test Data", 
                 ylabel = "Predicted value", xlabel = "Actual value"))

savefig(p, "fig/plot_model.png")