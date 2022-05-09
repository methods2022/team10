# This is a starting code for cleaning the data from the 
# vital statsitics data set 


# Read in our data set 


input_file = open("/gpfs/data/biol1555/0_shared/0_data/vital/Fetal2020US_COD.txt", "r")
output_file = open("smoking.txt", "w")

# Create a dictionary for cigarette use 
cigarettedict = Dict()
cigarettedict["Y"] = "Smoked"
cigarettedict["N"] = "No Smoke"
cigarettedict["U"] = "Unknown"


function main()
 
    # Start at the first fetal death 
    id =1 
    
    # Write the  header 
    write(output_file, "Smoke_Status|Gestational_Age\n")

    
for line in readlines(input_file)
# Extract the cigarette and death status 
cigarette = string(line[238])
death = parse(Int64, line[340:341])
# Map the cigarette to the fetal death if it is recorded
if death != 99
cigarettename = cigarettedict[cigarette]
print(output_file, "$cigarettename|$death\n")
end 

# Go to the next person 
id += 1

end 
end

# Run the function 
main()

