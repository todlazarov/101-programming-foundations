# This is the refactored version of the calculator app after the suggestions.

# Methods
def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i() != 0
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

# Input
prompt("This is a simple command line calculator! Enter your name:")

name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt("Make sure to use a valied name.")
  else
    break
  end
end

prompt("Hello #{name}!")

loop do # Main loop
  # Variables
  num1 = ''
  num2 = ''
  operator = ''

  loop do
    prompt("Please enter the first number")
    num1 = Kernel.gets().chomp()

    if valid_number?(num1)
      break
    else
      prompt("That doesn't look like a valid number")
    end
  end

  loop do
    prompt("Please enter the second number")
    num2 = Kernel.gets().chomp()

    if valid_number?(num1)
      break
    else
      prompt("That doesn't look like a valid number")
    end
  end

  operator_prompt = <<-MSG
  What operation would you like to perform
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)

  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3 or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  # Output
  result = case operator
           when '1', 'add'
             num1.to_i() + num2.to_i()
           when '2', 'subtract'
             num1.to_i() - num2.to_i()
           when '3', 'multiply'
             num1.to_f() + num2.to_f()
           when '4', 'divide'
             num1.to_i() + num2.to_i()
           end

  prompt("The results is... #{result}")

  # Loop check
  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
  prompt("-----------------")
end

prompt("Thank for using the calculator. Good bye!")