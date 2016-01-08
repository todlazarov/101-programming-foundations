# In this hash of people and their age,

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# see if there is an age present for "Spot".

# Bonus: What are two other hash methods that would work just as well for this solution?

puts ages.key?("Spot")

puts ages.include?("Spot")