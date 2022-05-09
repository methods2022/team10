## tabulate the distribution of race
using CSV, DataFrames

function main()
    input_file = "ygao98_race_cleaned.csv"
    output_file = "race_count.txt"

    df = CSV.File(input_file) |> DataFrame

    # get race counts	 
    race_count_df = combine(groupby(df, :race), nrow => :N)
    # println(race_count_df)

    # sort by count
	sort!(race_count_df, (:N), rev=(true))
	 
	# after sorting
	println(race_count_df)
	CSV.write(output_file, race_count_df)
end

main()
