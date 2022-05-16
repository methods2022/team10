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
