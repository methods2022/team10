
### Risk Factors for Fetal Deaths by Gestational Age in 2020

In this project we aimed to explore fetal deaths in the year 2020, and sociodemographic factors that we believed could be important risk factors. With this in mind our group explored the risk factors gender of fetus, birth location, mother's education level, race and smoking status of the mother to determine if these categorical variables had any impact on the age (in weeks) of fetal death. By conducting this project we sought to provide evidence (in the form of statistically significant results) that these risk factors are important factors in the time of fetal death. In order to have an understanding of the results from this project it is best to have at least some statistical background though we feel as though that is not incredibly necessary, as the results are explained in the report, and basic definitions are provided in the technical concepts section. Though if a user wants to recreate this project some programming knowledge is required. We have completed all the work that we sought out to for this project, but future extensions are possible and discussed below.

### Core technical concepts 
This project was created to explore risk factors pertaining to fetal death, to put an emphasis that certain sociodemographic factors have on risk of fetal death. For this project we assume a basic knowledge of statistical concepts, as this is the foundation that is utilized for our analysis, but we will walk through the concepts used in regard to the project, so that a user that may not have the appropriate knowledge could follow. On top of this, programming experience is highly recommended to be able to follow the logic of the provided code. 

Factor/categorical variables: In this project we examined the differences in age of gestational death based on variables that have different levels (i.e. mother smoked, or didn't)

Continuous variable: Age at gestational death in theory could take on any value in a feasible range

Boxplots: A visualization method, in this instance to examine the difference in time of fetal death based on the smoking status of a mother. 

ANOVA: A statistical test to determine if the mean is different between groups, a p-value result less than .05 indicates that this is true, in this case is the mean age of gestational death different between mothers that did and did not smoke. 

Linear regression: A statistical model to predict the expected value of a continuous variable based on other variables, in our case the expected age of fetal death based on smoking status (and other variables in the multivariate case). 

Programing in julia: To replicate these result knowledge of [julia](https://julialang.org/) and how to run scripts in the terminal is required, though experience with another programing language such as [R](https://www.r-project.org/) or [python](https://www.python.org/) is likely enough to understand the code presented. As the user should be familiar with basic concepts such as functions, for loops, subsetting data etc.. 

### Prerequisites and dependencies 
For this project you need to have the data that pertains to the 2020 fetal death which can be retrieved from the [CDC Vital Statistics Online Data Portal](https://www.cdc.gov/nchs/data_access/vitalstatsonline.htm) under the Fetal Death Data Files section. With this data acquired you are a step closer to running the programs associated with this project. Though the code files provided already have the correct information pertaining to the risk factors explored in this analysis, you can find more risk factors and their corresponding location in a line with the [2020 code book](https://ftp.cdc.gov/pub/Health_Statistics/NCHS/Dataset_Documentation/DVS/fetaldeath/2020fetaluserguide.pdf) if you want to extend the analysis. 

The running of the programs for this project require more than the basic [julia](https://julialang.org/) download. Once you have julia downloaded you will need to download the packages [CSV](https://csv.juliadata.org/stable/), [DataFrames](https://dataframes.juliadata.org/stable/), [GLM](https://juliastats.org/GLM.jl/v0.11/), [HypothesisTests](http://juliastats.org/HypothesisTests.jl/stable/), [MLJ](https://alan-turing-institute.github.io/MLJ.jl/dev/), [Plots](https://docs.juliaplots.org/stable/), [PlotlyJS](http://juliaplots.org/PlotlyJS.jl/stable/). With these packages installed and the data downloaded you have all the pre-requistes and dependcies. 


### Repositories and what they do 

The first step once the data is downloaded is to extract the data of interest for the given risk factor(s) which is done with the program [thedspet_smoking.jl](thedspet_smoking.jl) for the data pertaining just to smoking and [data_for_multiple_regression.jl](data_for_multiple_regression.jl) to get the data for multiple linear regression. This is done by looping through the data sets line by line and parsing out the information we are interested in (categorical variables are mapped to a corresponding dictionary) that is read into a file for use in future analyses. 

After the data was extracted we analyzed the data, starting with a visualization, for which a boxplot was constructed using [thesdpet_visual.jl](thesdpet_visual.jl), though please note that this code should be pasted into an active julia session to work, and running this file through the terminal was not successful. By using the data that was extracted we were able to use plotlyjs to create an interactive boxplot that shows the median value and the IQR for the smoking risk factor to give us an idea pertaining to the differences in age of gestational between mothers based on if they smoked or not. 


After noticing that the median age of gestational death appeared to be different among groups we ran an ANOVA test using this program [thedspet_smoking_anova.jl](thedspet_smoking_anova.jl). In this file we computed summary statistics and ran a one-way ANOVA to check if the means were significantly different between the groups. 



Lastly linear regression was performed, the file [thedspet_smoking_regression.jl](thedspet_smoking_regression.jl) contains the script for a univariate linear regression model adjusting only for the smoking status of the mother while [multipleregression.jl](multipleregression.jl) adjusts for all of the risk factors that were explored in this study. These files were used to determine the importance that these risk factors had on the age of fetal death. 




### Contributions 
I would like to thank the members of my team that all worked so hard to make this a fun successful project: 

[Nicholas Pellegrino](https://github.com/nicholaspellegrino1) 

[Yijing Gao](https://github.com/Yijinggao)

[Ifelola Olabode](https://github.com/iolabode)

[Breanna Richards](https://github.com/brichards21)

You can also fine [me on github](https://github.com/timhedspeth)



### To Do 
Though we have accomplished the specific aims of our project, the CDC provides vast amounts of information pertaining to fetal death, so there are many variables that we could use in an extended analysis of this data. In addition the CDC also provides this data across many different years, so it is possible that a longitudinal analysis looking at clustering by state for example could yield some trends regarding fetal death over time that could be important to address. 


### Contact 

Thank you for taking the time to read, if you have any questions please reach me at my email: timothy_hedspeth@brown.edu

