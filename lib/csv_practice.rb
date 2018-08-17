# csv_practice.rb
require 'awesome_print'
require 'csv'
require 'pry'

# Part 1 - CSV Practice
def load_data(filename)

  return CSV.read(filename, headers: true).map do |line|
    line.to_h
  end

end

def total_medals_per_country(olympic_data)

  medals_country = []

  olympic_data.each do |athlete|

    # skip athlete if she/he didn't win medal
    next if athlete['Medal'] == "NA"

    existing_country = false
    medals_country.each do |country|

      # if country already exists, iterate method count by one
      if athlete['Team'] == country[:country]
        country[:total_medals] += 1
        existing_country = true
        break
      end
    end

    if !existing_country
      medals_country << {:country => athlete['Team'], :total_medals => 1}
    end
  end

  return medals_country
end

def save_medal_totals(filename, medal_totals)

  headers = medal_totals[0].keys

  CSV.open(filename, 'w', :write_headers => true, :headers => headers) do |csv|
      medal_totals.each do |country|
        csv << country.values
    end
  end

end

# Part 2 - More Enumerable Practice

def all_gold_medal_winners(olympic_data)

  gold_names = []
  olympic_data.each do |athlete|

    gold_names << athlete if athlete['Medal'] == 'Gold'

  end

  return gold_names

end

def metals_sorted_by_country(metal_totals)

end

def country_with_most_metals(metal_totals)

end

def athlete_height_in_inches(olympic_data)

end

# puts load_data('data/athlete_events_sample.csv').class

# csv_data = load_data('data/athlete_events.csv')
#
# ap total_medals_per_country(csv_data)

# ap total_medals
# save_medal_totals('data/medal_totals_sample.csv', total_medals)
