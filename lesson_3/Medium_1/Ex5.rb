# Alan wrote the following method, which was intended to show all of the factors of the input number:

# def factors(number)
#   dividend = number
#   divisors = []
#   begin
#     divisors << number / dividend if number % dividend == 0
#     dividend -= 1
#   end until dividend == 0
#   divisors
# end

# Alyssa noticed that this will fail if you call this with an input of 0 or a negative number and asked Alan to change the loop. How can you change the loop construct (instead of using begin/end/until) to make this work? Note that we're not looking to find the factors for 0 or negative numbers, but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.

# Bonus 1

# What is the purpose of the number % dividend == 0 ?
# The check that the number is divisible by the dividen and the remainder is 0
# Therefore the dividend is a factor

# Bonus 2

# What is the purpose of the second-to-last line in the method (the divisors before the method's end)?
# Returns the facots

def factors(number)
  dividend = number
  divisors = []
  while dividend > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

puts factors(10)