using CSV, DataFrames
input_file1 = open("/gpfs/data/biol1555/projects2022/team10/birthplace_cleaned.txt")
input_file2 = open("/gpfs/data/biol1555/projects2022/team10/brichar4_age_education.txt")
input_file3 = open("/gpfs/data/biol1555/projects2022/team10/ygao98_race_cleaned.csv")
input_file4 = open("/gpfs/data/biol1555/projects2022/team10/sex_cleaned.txt")
output_file = "combined_data.csv"

birth_df = CSV.File(input_file1, header=1, footerskip=0, delim="|") |> DataFrame
edu_df = CSV.File(input_file2, header=1, footerskip=0, delim="|") |> DataFrame
sex_df = CSV.File(input_file4, header=1, footerskip=0, delim="|") |> DataFrame
race_df = CSV.File(input_file3, header=1) |> DataFrame

sex_df = sex_df[sex_df.Gestational_Week .!= 99.0, :]
# println(nrow(sex_df))

function main()
    input_file = open("/gpfs/data/biol1555/0_shared/0_data/vital/Fetal2020US_COD.txt", "r")
    smoke = []
    gestational_age = []

    for line in readlines(input_file)
        smoke_value = line[238]
        gestational_age_value = line[340:341]

        if smoke_value == 'Y'
            push!(smoke, "Smoked")
        elseif smoke_value == 'N'
            push!(smoke, "No Smoke")
        else
            push!(smoke, "Unknown")
        end

        if gestational_age_value == "99"
            push!(gestational_age, "Not stated")
        else
            push!(gestational_age, parse(Int64, gestational_age_value))
        end
    end
    smoke_df = DataFrame(smoke=smoke, gestational_age=gestational_age)
    smoke_df = smoke_df[smoke_df.gestational_age .!= "Not stated", :]

    return smoke_df

end

smoke_df = main()

df = DataFrame(age=birth_df.age, birthplace=birth_df.birthplace,
               general_birthplace=birth_df.general_birthplace,
               mothers_education=edu_df.mothers_education, sex=sex_df.Gender_of_Fetus,
               smoke = smoke_df.smoke, race=race_df.race, race_detail=race_df.race_detail)

# println(first(df, 5))
CSV.write(output_file, df)

# open("file.txt","w") do file
#     println(file, first(df, 10))
# end