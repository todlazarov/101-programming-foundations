# This is the refactored version of the calculator app after the suggestions.

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

# Methods
def prompt(message)
  Kernel.puts("=> #{message}")
end

def number?(input)
  integer?(input) || float?(input)
end

def float?(input)
  input.to_f.to_s == input
end

def integer?(input)
  input.to_i.to_s == input
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
prompt(MESSAGES['welcome'])

name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt(MESSAGES['valid_name'])
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
    prompt(MESSAGES['enter_number'])
    num1 = Kernel.gets().chomp()

    if number?(num1)
      break
    else
      prompt(MESSAGES['not_valid_number'])
    end
  end

  loop do
    prompt(MESSAGES['second_number'])
    num2 = Kernel.gets().chomp()

    if number?(num1)
      break
    else
      prompt(MESSAGES['not_valid_number'])
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
      prompt(MESSAGES['must_choose'])
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
             num1.to_f() * num2.to_f()
           when '4', 'divide'
             num1.to_f() + num2.to_f()
           end

  prompt("The result is... #{result}")

  # Loop check
  prompt(MESSAGES['repeat'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
  prompt("-----------------")
end

prompt(MESSAGES['thank_you'])