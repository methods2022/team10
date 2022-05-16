## Risk Factors for Fetal Death by Gestational Age in 2020

The term fetal death refers to the spontaneous intrauterine death of a fetus during the course of a woman’s pregnancy. While clinical, obstetrical, and biological history has been at the forefront of the discussion surrounding predicting fetal death, the exploration of certain sociodemographic features adds significant insight to current efforts in preventative care. Previous studies focused on finding associations with fetal death on a global scale and thus took into account the unique characteristics of countries from around the world. By running [ANOVA](https://statistics.laerd.com/statistical-guides/one-way-anova-statistical-guide.php) and uni- and multivariate [linear regression](http://www.stat.yale.edu/Courses/1997-98/101/linreg.htm) in Julia, this study aimed to investigate the associations of sex, race, birthplace, and mother’s education and cigarette usage with fetal death and gestational age at fetal death in a solely American population. Patient cases were identified using the publicly available [2020 Vital Statistics](https://www.cdc.gov/nchs/data_access/vitalstatsonline.htm) data from the CDC. Linear regression models were trained on a training set derived from a 70-30 split of the full dataset, and tested on the corresponding testing set. [Mean squared error](https://statisticsbyjim.com/regression/mean-squared-error-mse/) was used as the primary metric of model performance.

Installation of [Julia](https://julialang.org/) and/or basic knowledge of running Julia programs in terminal is highly recommended.


## Core Technical Concepts

One-way ANOVA: used to determine whether there are any statistically significant differences between the means of two or more independent (unrelated) groups

Simple Linear Regression: statistical method that allows us to quantify, summarize, and study relationships between one predictor/independent variable and an outcome/dependent variable.

Multiple Linear Regression: an extension of simple linear regression that uses multiple explanatory variables to predict the outcome of a response variable.

Training Set: A subset to train a model on.

Testing Set: A subset (usually smaller than the training set) to test the trained model.

Mean Squared Error (MSE): measures the amount of error in statistical models - assesses the average squared difference between the observed and predicted values. Smaller values means less error.


## Getting Started

This project requires the installation of the Julia programming language. The following packages were downloaded in Julia and used for statistical analysis and visualizations: [CSV](https://csv.juliadata.org/stable/),[DataFrames](https://dataframes.juliadata.org/stable/), [Plots](https://docs.juliaplots.org/stable/), [PlotlyJS](http://juliaplots.org/PlotlyJS.jl/stable/), [HypothesisTests](http://juliastats.org/HypothesisTests.jl/stable/), [MLJ](https://alan-turing-institute.github.io/MLJ.jl/dev/), and [GLM](https://juliastats.org/GLM.jl/v0.11/).


## Statistical Analysis: Mother's Educational Background

The analysis of fetal death/gestational age and mother's educational background is encapsulated by three different steps.

1) Subset the CDC text file data 
2) Create visualizations
3) Run summary statistics, ANOVA, and simple linear regression between mother's education and gestational age at time of fetal death

The [brichar4_education.jl](https://github.com/methods2022/team10/blob/master/brichar4_education.jl) file subsets the larger dataset from the CDC (located in the /gpfs/data/biol1555/0_shared/0_data/vital folder under Fetal2020US_COD.txt) and extracts the gestational age (columns 331-332) and mother's education variables (column 145). This new dataset is then output to a file called "brichar4_age_education.txt".

The [brichar4_plot_code.jl](https://github.com/methods2022/team10/blob/master/brichar4_plot_code.jl) file contains the code used to create a plot of side-by-side boxplots of the unique mother's education statuses and their distributions of gestational age at time of fetal death. This code can be run in the terminal with the Julia program.

The [brichar4_analysis.jl](https://github.com/methods2022/team10/blob/master/brichar4_analysis.jl) file calculates summary statistics, and performs ANOVA and simple linear regression on the data that was generated from the [brichar4_education.jl](https://github.com/methods2022/team10/blob/master/brichar4_education.jl) file ("brichar4_age_education.txt"). In regards to running linear regression, this code also computes the MSE on the training and testing sets generated from the 70-30 split of the full dataset. The results of these analyses are stored in a text file called "education_linear_model.txt".


## Contributing

HUGE thank you to my team members for their wonderful contributions to this project!: 

[Nicholas Pellegrino](https://github.com/nicholaspellegrino1)

[Ifelola Olabode](https://github.com/iolabode)

[Yijing Gao](https://github.com/Yijinggao)

[Timothy Hedspeth](https://github.com/timhedspeth)


## Next Steps

The prospect of extending this study may be interested in exploring more complex relationships between the variables that we examined and even exploring the utility of additional sociodemographic features. We could also consider the use of models like support vector machine classifiers and other models that tend to be robust to outliers. 

