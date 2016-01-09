#Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"

# ex:

# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

hash = {}
letters = ["A".."Z"] + ["a".."Z"]
statement.each_char do |i|
  letter_freq = statement.scan(i).count
  hash[i] = letter_freq if letter_freq > 0
end

puts hash