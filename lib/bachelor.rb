def get_first_name_of_season_winner(bachelor, season)
  winner_hash = bachelor[season].find do |contestant|
    contestant["status"] == "Winner"
  end
  winner_hash["name"].split(" ").first
end

def contestants(bachelor)
  bachelor.map { |season, info| info }.flatten
end

def get_contestant_name(bachelor, occupation)
  contestant = contestants(bachelor).find do |contestant| 
    contestant["occupation"] == occupation
  end
  contestant["name"]
end

def count_contestants_by_hometown(bachelor, hometown)
  contestants(bachelor).select do |contestant|
    contestant["hometown"] == hometown
  end.length
end

def get_occupation(bachelor, hometown)
  contestant = contestants(bachelor).find do |contestant|
    contestant["hometown"] == hometown
  end
  contestant["occupation"]
end

def get_average_age_for_season(bachelor, season)
  total_age = bachelor[season].reduce(0.0) do |sum, contestant|
    sum + contestant["age"].to_i
  end
  (total_age / bachelor[season].length).round
end
