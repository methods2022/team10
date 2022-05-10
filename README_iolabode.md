Risk Factors for Fetal Deaths by Gestational Age in 2020

The project intends to investigate when (gestational age of death) sex of a fetus is a risk for intrauterine death in the Julia program. It is one of 5 risk factors investigated in this research and important to the research space as fetal death is relatively common in the United States

It uses 2020 data from the CDC's NVSS text file dataset and uses ANOVA and linear regression to analyze the data. 

The project is beginner friendly and uses Julia and a downloaded text file from CDC's NVSS. 

Most useful/noteworthy for data cleaning/tabulation and statistical analyses.

It seeks to find out at what gestational age does sex of a fetus becaome a risk factor for intrauterine death and 
visualizes the results in a boxplot. It finds that males experience intrauterine death younger than females and the 
death occurs around 26-27 weeks of gestation. 

Key concepts are ANOVA, linear regression, boxplots, pregnancy risk factors

CDC NVSS dataset: https://www.cdc.gov/nchs/data_access/vitalstatsonline.htm


Study completed in Spring 2022 

Core Technical Concepts are train-test split, ANOVA, linear regression, boxplots

The research exists because understanding when the sex of the fetus affects fetal death and at what gestational age 
can inform healthcare providers, and expecting parents/families how to more effectively direct intervention with 
appropriate timing. 

The project intends to investigate when (gestational age of death) sex of a fetus is a risk for intrauterine death. 
It uses 2020 data from the CDC's NVSS dataset and uses ANOVA and linear regression to analyze the data. 

This work compares to other projects as much of biomedical informatics on the topic of fetal sex as a risk factors 
look at the magnitue at which fetal sex affects intrauterine death. However, this research identifies when (gestational 
age /week of death) fetal sex is a risk factor for intrauterine death. More specifically, it cleans and tabulates the data set with each subject's gender and gestational week of death, then uses the table to create summary statistics and a box plot. The tabulated data is then computed using a one way ANOVA followed by a univariate linear regression. 

Technical Concepts are dictionaries, filter(), describe(), train-test split, ANOVA, linear regression, boxplots

Boxplot Summary Statistics, ANOVA and linear regression require downloading these packages: CSV, DataFrames, GLM, Plots, PlotlyJS, HypothesisTests, MLJ

Thank you to the teachers, teaching assistants, and students (especially, team 10: Nicholas Pellegrino, Breanna Richards, Yijing Gao, and Timothy Hedspeth) of Brown's Biomedical Informatics class!

Please feel free to reach out with questions to ifelola_olabode@brown.edu
