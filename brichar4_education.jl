#read file in
input_file = open("/gpfs/data/biol1555/0_shared/0_data/vital/Fetal2020US_COD.txt", "r")
output_file = open("brichar4_age_education.txt", "w")

function MakeDataset()
    #Make dictionary to convert numbers into readable labels
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
   
    #read lines of file
    print(output_file, "age|mothers_education\n")

    for line in readlines(input_file)
        #extract mother's 
        education = string(line[145])
       
        #extract age
        age = parse(Float64, line[331:332])

        if age == 99 
            continue
        end

        println("$age|$(education_dict[education])\n")

        print(output_file, "$age|$(education_dict[education])\n")
    end

    close(output_file)

end

    MakeDataset()