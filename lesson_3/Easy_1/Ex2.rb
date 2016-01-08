# What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# => 1 2 2 3


# Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios: 
# 1. what is != and where should you use it? 
# 2. put ! before something, like !user_name 
# 3. put ! after something, like words.uniq! 
# 4. put ? before something 
# 5. put ? after something 
# 6. put !! before something, like !!user_name

# Answers
# The ! at the end of calls mutates the parameter that is being inspected. The ? is used as a check in combination with another call.
# 1. != is "not true". Its used check that something is not equal to something else.
# 2. Inserting ! infront of something gives you the opposite of the parameter it was placed in front of.
# Usually that is false. 
# 3. In the example words.uniq!, the ! makes the uniq method mutated the words variable, therefore it makes it destructive
# 4. ? before something brings out an error
# 5. ? after something is usually an error, unless its part of a method call that includes ? in the name
# 6. !! is a double negative. If we are dealing with true or false it returns true or false, respectively. If we are dealing with any other type
# of variable it returns true if the variable exists.