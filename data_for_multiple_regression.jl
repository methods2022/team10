# This will be creating a data set for multiple linear regression 


# With this data we will implement multiple linear regression 

# We have 5 variables that we need to extract 
input_file = open("/gpfs/data/biol1555/0_shared/0_data/vital/Fetal2020US_COD.txt", "r")
output_file = open("multiple_regression_data.txt", "w")
# Sex
sex_dict = Dict()
sex_dict["M"] = "Male"
sex_dict["F"] = "Female"
sex_dict["U"] = "Unknown"

# Education 
education_dict = Dict()
  
education_dict["1"] = "8th grade or less"
education_dict["2"] = "9th-12th grade with no diploma"
education_dict["3"] = "High school graduate"
education_dict["4"] = "Some college credit, but no degree"
education_dict["5"] = "Associate's degree"
education_dict["6"] = "Bachelor's degree"
education_dict["7"] = "Master's degree"
education_dict["8"] = "Doctorate or professional degree"
education_dict["9"] = "Unknown"
# Intended birth place 
general_map_birth = Dict()
general_map_birth["1"] = "Hospital"
general_map_birth["2"] = "Not in Hospital"
general_map_birth["3"] = "Unknown"
# Race 
race_dict = Dict()
race_dict["1"] = "White (alone)"
race_dict["2"] = "Black (alone)"
race_dict["3"] = "AIAN (alone)"
race_dict["4"] = "Asian (alone)"
race_dict["5"] = "NHOPI (alone)"
race_dict["6"] = "More than one race"

# Smoking 
cigarettedict = Dict()
cigarettedict["Y"] = "Smoked"
cigarettedict["N"] = "No Smoke"
cigarettedict["U"] = "Unknown" 


#### Extracting all the data into a pretty format #####

function main()
 
    # Start at the first fetal death 
    id =1 
    
    # Write the  header 
    write(output_file, "Sex|Education|Birthplace|Race|Smoke_Status|Gestational_Age\n")

    
for line in readlines(input_file)
#We need to extract the information we are interested in 
fetus_sex = string(line[316])
birthplace_general = string(line[52])
education = string(line[145])
race = string(line[134])
cigarette = string(line[238])

# Variable of interest 
death = parse(Int64, line[340:341])
# Map the death to the fetal death if it is recorded
if death != 99
sexname = sex_dict[fetus_sex]
birthplacename = general_map_birth[birthplace_general]
educationname = education_dict[education]
racename = race_dict[race]
cigarettename = cigarettedict[cigarette]
print(output_file, "$sexname|$educationname|$birthplacename|$racename|$cigarettename|$death\n")
end 

# Go to the next person 
id += 1

end 
end

# Run the function 
main()

