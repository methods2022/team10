## Risk Factors for Fetal Deaths by Gestational Age in 2020
This project attempts to explore the relationship between five risk factors (sex, race, birthplace, mother’s education and cigarette usage) and the gestational age. This file mainly investigates the race variable. Data extraction, visualization, ANOVA test and linear regression are performed to achieve our goal.

## Code and Documentation
The code is executed under Python 1.7.2. The following packages are implemented in the code: CSV, DataFrames, GLM, HypothesisTests, MLJ, PlotlyJS.

[ygao98_race_extract.jl](https://github.com/methods2022/team10/blob/master/ygao98_race_extract.jl) extracts the gestational age, race (6 categories) and detailed race (single-race and multiracial values with 31 categories), and saves the data into a CSV file.

[ygao98_race_analysis.jl](https://github.com/methods2022/team10/blob/master/ygao98_race_analysis.jl) uses the groupby function to the dataframe and tabulate the race variable to get the distribution.

[ygao98_race_visual.jl](https://github.com/methods2022/team10/blob/master/ygao98_race_visual.jl) makes three plots: two boxplots of gestational age by race and by detailed race, as well as the histogram of the gestational age. The plots are saved in the [fig](https://github.com/methods2022/team10/tree/master/fig) folder.

[ygao98_race_stats.jl](https://github.com/methods2022/team10/blob/master/ygao98_race_stats.jl) creates subsets for the race column, gets the description of the subsets, performs ANOVA tests and trains an univariate linear regression model.

[combined_data.jl](https://github.com/methods2022/team10/blob/master/combined_data.jl) combines all the risk factors together to see the discription for the overall dataset.

## Contributions
Thank you to the professors, TAs, team 10 (Nicholas Pellegrino, Breanna Richards, Ifelola Olabode and Timothy Hedspeth), and all other students of the Methods in Informatics and Data Science for Health class! Please don't hesitate to reach out to me [yijing_gao@brown.edu](yijing_gao@brown.edu), if there is any question.
