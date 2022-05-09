#read file in
input_file = open("/gpfs/data/biol1555/0_shared/0_data/vital/Fetal2020US_COD.txt", "r")
output_file = open("birthplace_cleaned.txt", "w")

function MakeDataset()
    #Make dictionary to convert numbers into readable labels
    fetal_map_birth = Dict()
    general_map_birth = Dict()
    fetal_map_birth["1"] = "Hospital"
    fetal_map_birth["2"] = "Freestanding Birth Center"
    fetal_map_birth["3"] = "Home (intended)"
    fetal_map_birth["4"] = "Home (unintended)"
    fetal_map_birth["5"] = "Home (unknown intention)"
    fetal_map_birth["6"] = "Clinic/Doctor's Office"
    fetal_map_birth["7"] = "Other"
    fetal_map_birth["9"] = "Unknown"
    general_map_birth["1"] = "Hospital"
    general_map_birth["2"] = "Not in Hospital"
    general_map_birth["3"] = "Unknown"
    #read lines of file
    print(output_file, "age|birthplace|general_birthplace\n")
    for line in readlines(input_file)
        #extract birthplace setting
        birthplace = string(line[34])
        #extract more general birthplace setting
        birthplace_general = string(line[52])
        #extract age
        age = parse(Float64, line[331:332])
        if age != 99.0
            print(output_file, "$age|$(fetal_map_birth[birthplace])|$(general_map_birth[birthplace_general])\n")
        else
            continue
        end
    end
    close(output_file)

end


MakeDataset()