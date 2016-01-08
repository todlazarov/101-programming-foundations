# Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."
advice["important"] = "urgent"

puts advice

# or 
# advice.gsub!('important', 'urgent')