# Programmatically determine if 42 lies between 10 and 100.

# hint: Use Ruby's range object in your solution.

range = 10..100
puts range.include?(42)

# or 
# (10..100).cover?(42)