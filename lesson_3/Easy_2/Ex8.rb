# In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Find the index of the first name that starts with "Be"

value = 0

flintstones.each_with_index do |v, index|
  if v.start_with?("Be")
    value = index
    break
  end
end

puts value

# or
# flintstones.index { |name| name[0, 2] == "Be" }