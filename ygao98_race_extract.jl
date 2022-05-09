using CSV, DataFrames
# open files
input_file = open("/gpfs/data/biol1555/0_shared/0_data/vital/Fetal2020US_COD.txt", "r")  # absolute path
output_file_name = "ygao98_race.csv"
output_file_cleaned_name = "ygao98_race_cleaned.csv"

function main()
    id = []
    id_value = 0
    race = []
    race_detail = []
    gestational_age = []

    # read in each line in the input file
    for line in readlines(input_file)
        id_value += 1
        race_value = line[134]
        race_d_value = line[135:136]
        gestational_age_value = line[340:341]

        push!(id, id_value)
        
        if race_value == '1'
            push!(race, "White(alone)")
        elseif race_value == '2'
            push!(race, "Black(alone)")
        elseif race_value == '3'
            push!(race, "AIAN(alone)")
        elseif race_value == '4'
            push!(race, "Asian(alone)")
        elseif race_value == '5'
            push!(race, "NHOPI(alone)")
        else
            push!(race, "More than one race")
        end

        if race_d_value == "01"
            push!(race_detail, "White(alone)")
        elseif race_d_value == "02"
            push!(race_detail, "Black(alone)")
        elseif race_d_value == "03"
            push!(race_detail, "AIAN (American Indian or Alaskan Native) (alone)")
        elseif race_d_value == "04"
            push!(race_detail, "Asian (alone)")
        elseif race_d_value == "05"
            push!(race_detail, "NHOPI (Native Hawaiian or Other Pacific Islander) (alone)")
        elseif race_d_value == "06"
            push!(race_detail, "Black And White")
        elseif race_d_value == "07"
            push!(race_detail, "Black and AIAN")
        elseif race_d_value == "08"
            push!(race_detail, "Black and Asian")
        elseif race_d_value == "09"
            push!(race_detail, "Black and NHOPI")
        elseif race_d_value == "10"
            push!(race_detail, "AIAN and White")
        elseif race_d_value == "11"
            push!(race_detail, "AIAN and Asian")
        elseif race_d_value == "12"
            push!(race_detail, "AIAN and NHOPI")
        elseif race_d_value == "13"
            push!(race_detail, "Asian and White")
        elseif race_d_value == "14"
            push!(race_detail, "Asian and NHOPI")
        elseif race_d_value == "15"
            push!(race_detail, "NHOPI and White")
        elseif race_d_value == "16"
            push!(race_detail, "Black, AIAN, and White")
        elseif race_d_value == "17"
            push!(race_detail, "Black, AIAN, and Asian")
        elseif race_d_value == "18"
            push!(race_detail, "Black, AIAN, and NHOPI")
        elseif race_d_value == "19"
            push!(race_detail, "Black, Asian, and White")
        elseif race_d_value == "20"
            push!(race_detail, "Black, Asian, and NHOPI")
        elseif race_d_value == "21"
            push!(race_detail, "Black, NHOPI, and White")
        elseif race_d_value == "22"
            push!(race_detail, "AIAN, Asian, and White")
        elseif race_d_value == "23"
            push!(race_detail, "AIAN, NHOPI, and White")
        elseif race_d_value == "24"
            push!(race_detail, "AIAN, Asian, and NHOPI")
        elseif race_d_value == "25"
            push!(race_detail, "Asian, NHOPI, and White")
        elseif race_d_value == "26"
            push!(race_detail, "Black, AIAN, Asian, and White")
        elseif race_d_value == "27"
            push!(race_detail, "Black, AIAN, Asian, and NHOPI")
        elseif race_d_value == "28"
            push!(race_detail, "Black, AIAN, NHOPI, and White")
        elseif race_d_value == "29"
            push!(race_detail, "Black, Asian, NHOPI, and White")
        elseif race_d_value == "30"
            push!(race_detail, "AIAN, Asian, NHOPI, and White")
        else
            push!(race_detail, "Black, AIAN, Asian, NHOPI, and White")
        end


        if gestational_age_value == "99"
            push!(gestational_age, "Not stated")
        else
            push!(gestational_age, parse(Int64, gestational_age_value))
        end

    end

    df = DataFrame(id=id, race=race, race_detail=race_detail, gestational_age=gestational_age)
    print(df)
    CSV.write(output_file_name, df)

    df1 = DataFrame(race=race, race_detail=race_detail, gestational_age=gestational_age)
    df1 = df1[df1.gestational_age .!= "Not stated", :]
    print(df1)
    CSV.write(output_file_cleaned_name, df1)
end

main()





