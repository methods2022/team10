# Impact of Birth/Death Setting on Fetal Death

Fetal death is a major concern among pregnant women, as well as their physicians. While research has been done on some of the risk factors associated with fetal death, there is limited information on the stages of pregnancy when these risk factors come into affect. This analysis seeks to determine what particular week of gestation is affected by the risk factor of birth location.
Using this code or interpreting results requires some background in statistics, namely One-Way Analysis of Variance (ANOVA) and linear regression. Some knowledge of running a julia program through Terminal is also required.

# Core Technical Concepts

Using [fetal death data from 2020](https://www.cdc.gov/nchs/data_access/vitalstatsonline.htm) provided by the Centers for Disease Control and Prevention, this project uses linear regression modeling to predict gestational age at death among fetuses using data about birth/death locations (e.g. hospitals, intended home birth, etc.). Other projects use data where death of a fetus is the outcome and comparing risk factors between women who had successful births and those that did not. While these use odds ratios to determine risk factors, our project restricts the sample to only fetuses that have died. By doing so, we can examine in what particular week these factors occur so that pregnant women can be extra cautious during these risk weeks and proactive with prenatal visits to ensure the health of their child.
This project uses the Julia programming language to perform linear regression, modeling age at death from birth setting, as well as other potential predictors of fetal death. It also uses a 70/30 training/testing split to assess transportability of the model to other potential study populations, analyzed using mean squared error (MSE) of the training and testing sets.

# Getting Started/Prerequisite Packages

This project requires the installation of the [Julia programming language](https://julialang.org/). Additionally, it requires the following packages used for statistical analysis and visualizations: [CSV](https://csv.juliadata.org/stable/), [DataFrames](https://dataframes.juliadata.org/stable/), [Plots](https://docs.juliaplots.org/stable/), [PlotlyJS](http://juliaplots.org/PlotlyJS.jl/stable/), [HypothesisTests](http://juliastats.org/HypothesisTests.jl/stable/), [MLJ](https://alan-turing-institute.github.io/MLJ.jl/dev/), and [GLM](https://juliastats.org/GLM.jl/v0.11/). 
