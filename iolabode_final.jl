input_file = open("/gpfs/data/biol1555/0_shared/0_data/vital/Fetal2020US_COD.txt")
output_file = open("sex_cleaned.txt", "w")


sex_dict = Dict()
sex_dict["M"] = "Male"
sex_dict["F"] = "Female"
sex_dict["U"] = "Unknown"

function main()
    id = 1
    print(output_file, "Gender_of_Fetus|Gestational_Week\n")

for line in readlines(input_file)
    fetus_sex = string(line[316])
    fetus_death_age = parse(Float64,(line[340:341]))
    
    if fetus_death_age != 99
    sex = sex_dict[fetus_sex]
    print(output_file, "$sex|$fetus_death_age\n")
    end 
    
    id += 1
end
end
main()


