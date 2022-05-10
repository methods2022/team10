# Impact of Birth/Death Setting on Fetal Death

Fetal death is a major concern among pregnant women, as well as their physicians. While research has been done on some of the risk factors associated with fetal death, there is limited information on the stages of pregnancy when these risk factors come into affect. This analysis seeks to determine what particular week of gestation is affected by the risk factor of birth location.
Using this code or interpreting results requires some background in statistics, namely One-Way Analysis of Variance (ANOVA) and linear regression. Some knowledge of running a julia program through Terminal is also required.

# Core Technical Concepts

Using [fetal death data from 2020](https://www.cdc.gov/nchs/data_access/vitalstatsonline.htm) provided by the Centers for Disease Control and Prevention, this project uses linear regression modeling to predict gestational age at death among fetuses using data about birth/death locations (e.g. hospitals, intended home birth, etc.). Other projects use data where death of a fetus is the outcome and comparing risk factors between women who had successful births and those that did not. While these use odds ratios to determine risk factors, our project restricts the sample to only fetuses that have died. By doing so, we can examine in what particular week these factors occur so that pregnant women can be extra cautious during these risk weeks and proactive with prenatal visits to ensure the health of their child.
This project uses the Julia programming language to perform linear regression, modeling age at death from birth setting, as well as other potential predictors of fetal death. It also uses a 70/30 training/testing split to assess transportability of the model to other potential study populations, analyzed using mean squared error (MSE) of the training and testing sets.

# Getting Started/Prerequisite Packages

This project requires the installation of the [Julia programming language](https://julialang.org/). Additionally, it requires the following packages used for statistical analysis and visualizations: [CSV](https://csv.juliadata.org/stable/), [DataFrames](https://dataframes.juliadata.org/stable/), [Plots](https://docs.juliaplots.org/stable/), [PlotlyJS](http://juliaplots.org/PlotlyJS.jl/stable/), [HypothesisTests](http://juliastats.org/HypothesisTests.jl/stable/), [MLJ](https://alan-turing-institute.github.io/MLJ.jl/dev/), and [GLM](https://juliastats.org/GLM.jl/v0.11/). 

# Running Analysis Files

The analysis of fetal death and birth/death location is separated into three parts: [creating the dataset from the CDC text file](https://github.com/methods2022/team10/blob/master/npelleg1_birthplace_process.jl), [visual analysis](https://github.com/methods2022/team10/blob/master/npelleg1_birthplace_visual.jl), and [running the ANOVA tests and creating the linear model](https://github.com/methods2022/team10/blob/master/npelleg1_birthplace_analysis.jl).

The npelleg_birthplace_process.jl file creates the dataset used in the proceeding analysis files. It reads in the 2020 fetal death CDC text file (located in the /gpfs/data/biol1555/0_shared/0_data/vital folder under Fetal2020US_COD.txt) and extracts the age, death setting, and general death setting variables. The death setting and generalized death settings are located in columns 34 and 52, respecively, of the CDC text file. Age is under columns 331 and 332. These data are extracted and placed into a new text file called "birthplace_cleaned.txt", which is created when running the npelleg_birthplace_process.jl file through Julia.

The npelleg1_birthplace_visual.jl file creates two boxplots: one comparing age at death across all locations and a second looking at age across the generalized groups. When running this file through Julia, a "birthplace.html" and "generalBirthplace.html" file will be produced. These can be open in your browser of choice to view the boxplots.

The npelleg1_birthplace_analysis.jl file performs all of the statistical analysis. It computes summary statistics for each unique death setting, as well as running an ANOVA test between the birthplaces to test for significant differences between groups and their mean gestational age at death. The file also performs the 70/30 data split into training and testing sets, which are then used to create the univariate linear models between age and location. The training and testing MSE are then calculated for each set for each model. All of the results are stored in the "birthplace_linear_model.txt" file that is created when running the npelleg1_birthplace_analysis.jl script.

# Contributing

Massive thanks to the following contributors in their analysis of different risk factors on fetal death: [Nicholas Pellegrino (me)](https://github.com/nicholaspellegrino1), [Yijing Gao](https://github.com/Yijinggao), [Timothy Hedspeth](https://github.com/timhedspeth), [Ifelola Olabode](https://github.com/iolabode), and [Breanna Richards](https://github.com/brichards21).
