## Tim Hedspeth's README 

### Risk Factors for Fetal Deaths by Gestational Age in 2020

In this project we aimed to explore fetal deaths in the year 2020, and sociodemographic factors that we believed could be important risk factors. With this in mind our group explored the risk factors gender of fetus, birth location, mother's education level, race and smoking status of the mother to determine if these categorical variables had any impact on the age (in weeks) of fetal death. By conducting this project we sought to provide evidence (in the form of statistically significant results) that these risk factors are important factors in the time of fetal death. In order to have an understanding of the results from this project it is best to have at least some statistical background though we feel as though that is not incredibly nessescary. Though if a user wants to recreate this project some programing knoweldge is required. We have completed all the work that we sought out to for this project, but future extensions are possible. 

### Core technical concepts 
For this project we assume a basic knowedlge of statistical concepts, as this is the foundation that is utilized for our analysis, but we will walk through the concepts used in regard to the project, so that a user that may not have the approriate knowedgle could follow. 

Factor/catgeorical variables: In this project we examined the differences in age of gestational death based on variables that have different levels (i.e. mother smoked, or didn't)

Continuous variable: Age at gestational death in theory could take on any value 


### Prerequisites and dependcies 
For this project you need to have the data that pertains to the 


### Related Repositories 

To get the data set for the smoking risk factor, use [thedspet_smoking.jl](thedspet_smoking.jl) and to get the data set for multiple linear regression use 
[data_for_multiple_regression.jl](data_for_multiple_regression.jl). In both of these files we create dictionaries that pertain to the factor of interest and parse through the data set 

### Contributions 
I would like to thank the members of my team that all worked so hard to make this project what it is: 

Nicholas Pellegrino

Yijing Gao 

Ifelola Olabode

Breanna Richards

Tim Hedspeth (me) 


### To Do 
Though we have accomplished the specific aims of our project, the CDC provides vast amounts of information pertaining to fetal death, so there are many variables that we could use in an extended analysis of this data. In addition the CDC also provides this data across many different years, so 





### Intial retrivial of the data 

For this project the CDC vital statistics data was utilized to explore risk factors pertaining to fetal death. For the purpose of our analyses we used the file pertaining to 2020 fetal deaths avilable via the centers for disease control. To obtain this data go to https://www.cdc.gov/nchs/data_access/vitalstatsonline.htm once on the webpage, scroll down to the section labeled Fetal Death Data Files, when at this section you can download the data file entitled 2020 9with cause of death) (2.4 MB) under the U.S. Data (.zip files). With this data file downloaded, you can start to perform analyses pertaining to smoking risk factors and multiple linear regression. With the data downloaded you, should also find the associate codebook for the data, which is listed under User's Guide, 2020. 


### Creation of data set(s)
##### Single factor, smoking 

With the data downloaded you your system you should open a script file in Julia and read in the data file for the year 2020. With the data set read in, the next step is to create a dictionary pertaining to the factor of interest. We also define an output file in which we will read the output to. Given that we want to explore if the mother smoked we go to the code book and scroll to page 15, where you can identify that this factor is in line 238, and identify the week of gestational death is at the location line 340-341. Build a library of all levels of our factor, based on the codebook. With the dictionary defined we now create a function to parse through the data set inside a main function. Inside this function write a header to the output file, and thendefine a for loop to parse through the data set. In this for loop extract the mother's smoking status and death, if the age of fetal death is defined as 99 do not include the fetal death in the data set. If the death is not reported as 99 print the weeks of fetal death and cigarette statsus to the output file. Once this data is extracted for 1 fetal death go to the next line. This conclude the loop and the function that we implement to extract the data. 

##### Multiple factors

When we extend to a multivariate linear regression model we follow a similar process as detailed above in the section, single factor smoking. The only difference between these files that we have multiple factors for which we extract the values from the data set. In the case of this analysis the other risk factors that were examined were the place of birth (location 52), the sex of teh fetus (location 316), the education level of the mother (location 145), the race of the mother (location 134), the smoking status of the mother (location 238), and the age of gestational death (location 340-341). Given that all of the risk factors were factor variables each of these factors required a dictionary to be defined before entering into the function. Withh the dictinoary defined wee follow the same process of looping through the data file line by line parsing for thhis information. This data is read into an output file that we use later on in the analysis.


### Creating boxplots 
With the data set pertaining to the smoking risk factor created, you can now move to visualizing your data. Given that this is a nominal variable it was decided to use boxplots to visualize. Please note that for some reason running a julia script for this did not work, so this process must be done in the terminal. The first thing is to specify that we must use (and install if nessecary) thee packages CSV, DataFrames, Plots, PlotlyJS. With these packages installed and used define the input, the data file that was created for the smoking risk factor in the previous step. Take this input file and read it into a data frame in the program. With this run plotlyjs and the  display command for a boxplot with the smoking status (groups) on the x axis the age of gestational death on the y-axis. This will allow for you to observe a pop up which shows interactive boxplots in which you can see the IQR when hovering over the plots. 


###  Analysis of Variance 
The next step of our project was to see if there were meaningful differences between the average age of geestational death between the groups that we observed for the smoking status. For this section we install and require the packages CSV DataFrames, GLM, HypothesisTests, and MLJ. We open the text file that contains the smoking status of the mother and open an output file, which we print the results to. Similarly with the boxplots we createe a data frame of with the input file. Using this data frame we filter the data frame to extract the unique levels of the smoking variable into data sets and with these create summary statistics using the edescribe function, and print them to the output file. After getting these summary statistics use the OneWayANOVATeest in the HypothesisTests package to run an ANOVA betwee the 3 data sets with the different factors, and print the results to an output file. 


### Regression 
##### Single factor, smoking 
Similarly to the past few steps to implement teh regression we define that we are using the packages CSV DataFrames, GLM, HypothesisTests, and MLJ and open the input and output files. We then convert the input file into a data frame using the DataFrames package. With this data frame created we define our x and y variables (y is age of fetal death, x is smoking status), and create test and tranin sets by partioning the data into data sets that constitute 70 percent of the observations in the training set and 30 percent in the test set. With the data set creatd we run a linear regression to predict the age of gestational death based on smoking status, and printed the results to the output file. After sucessfully running the regression thee MSE was calculated by hand using the observed value and the precidcted value (from GLM package) for both the training and testing set, and this was printed to the output file, as a metric to assess the performance of the model.

##### Multiple regression 
The multivariate linear regression follows the same convetion as the single factor regression that was implemented in the last subsection, excpet the data set that pertains to all of the factors is utilized by all members of the group that was created earlier. With this data set follow the same process, the only adjustment that needs to be made is when performing the regression specfifiy that the all the factors being used, so that the model adjusts for all the factors. 
