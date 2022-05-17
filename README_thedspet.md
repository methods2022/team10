This is the Read me file for the smoking risk factor and multiple linear regression, written by Tim Hedspeth 

For this project, we explored risk factors pertaining to fetal death 

### Intial retrivial of the data 

For this project the CDC vital statistics data was utilized to explore risk factors pertaining to fetal death. For the purpose of our analyses we used the file pertaining to 2020 fetal deaths avilable via the centers for disease control. To obtain this data go to https://www.cdc.gov/nchs/data_access/vitalstatsonline.htm once on the webpage, scroll down to the section labeled Fetal Death Data Files, when at this section you can download the data file entitled 2020 9with cause of death) (2.4 MB) under the U.S. Data (.zip files). With this data file downloaded, you can start to perform analyses pertaining to smoking risk factors and multiple linear regression. With the data downloaded you, should also find the associate codebook for the data, which is listed under User's Guide, 2020. 


### Creation of data set(s)
##### Single factor, smoking 

With the data downloaded you your system you should open a script file in Julia and read in the data file for the year 2020. With the data set read in, the next step is to create a dictionary pertaining to the factor of interest. We also define an output file in which we will read the output to. Given that we want to explore if the mother smoked we go to the code book and scroll to page 15, where you can identify that this factor is in line 238, and identify the week of gestational death is at the location line 340-341. Build a library of all levels of our factor, based on the codebook. With the dictionary defined we now create a function to parse through the data set inside a main function. Inside this function write a header to the output file, and thendefine a for loop to parse through the data set. In this for loop extract the mother's smoking status and death, if the age of fetal death is defined as 99 do not include the fetal death in the data set. If the death is not reported as 99 print the weeks of fetal death and cigarette statsus to teh output file. 


