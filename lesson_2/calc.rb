# Build a command line calculator. This is my version before watching any of the videos.
# For this project I have to use the full method path and brackets invocation.

# Input
Kernel.puts("This is a simple command line calculator!")
Kernel.puts("Please enter the first number")
num1 = Kernel.gets().chomp().to_f()
Kernel.puts("Please enter the second number")
num2 = Kernel.gets().chomp().to_f()
Kernel.puts("What would you like to do with the two numbers? (Options: add, subtract, multiply or divide)")
action = Kernel.gets().chomp()

# Output
if action.downcase() == "add"
	Kernel.puts("The result is... #{num1 + num2}")
elsif action.downcase()	== "subtract"
	Kernel.puts("The result is... #{num1 - num2}")
elsif action.downcase() == "multiply"
	Kernel.puts("The result is... #{num1 * num2}")
elsif action.downcase() == "divide"
	Kernel.puts("The result is... #{num1 / num2}")
else
  Kernel.puts("Incorrect action.")
end