using DataFrames
using CSV

#input_file = open("/gpfs/data/biol1555/projects2022/team10/brichar4_age_education.txt", "r")
#output_file = open("brichar4_education_tabulate.txt", "w")


function analyze_dict(input_file, output_file)

    output_file = open(output_file, "w")

    education_dict = Dict()
    line_count = 0

    for line in readlines(input_file)
        if line_count == 0


            line_count = 1

            continue

        end

        field = split(line, "|")

        if haskey(education_dict, field[2])

            education_dict[field[2]] += 1

        else

            education_dict[field[2]] = 1
        end

    end


println("***COUNTS OF MOTHER'S EDUCATION STATUS***\n")
print(output_file, "***COUNTS OF MOTHER'S EDUCATION STATUS***\n")

for(count_value, key) in sort(collect(zip(values(education_dict), keys(education_dict))), rev = true)

    print("$count_value|$key\n")
    print(output_file, "$count_value|$key\n")
end

close(output_file)
end


analyze_dict("/gpfs/data/biol1555/projects2022/team10/brichar4_age_education.txt", "brichar4_education_tabulate.txt")