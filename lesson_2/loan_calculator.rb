# Car loan calculator

require 'yaml'
MESSAGES = YAML.load_file('loan_calculator_messages.yml')

# Methods

def number?(num)
  num.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
end

def positive?(num)
  num.to_f > 0
end

def prompt(message)
  puts("=> #{message}")
end

# Variables
name = ''

prompt(MESSAGES['hello'])
prompt(MESSAGES['description'])
prompt(MESSAGES['name'])

loop do
  name = gets.chomp
  if name.empty?
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hello #{name}! Lets begin!")

loop do # Main loop
  # Variables
  total_loan = ''
  apr = ''
  duration = ''

  prompt(MESSAGES['total_amount'])
  loop do
    total_loan = gets.chomp
    if number?(total_loan) && positive?(total_loan)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  prompt(MESSAGES['APR'])
  loop do
    apr = gets.chomp
    if number?(apr) && positive?(apr)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  prompt(MESSAGES['loan_duration'])
  loop do
    duration = gets.chomp
    if number?(duration) && positive?(duration)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  prompt("Calculating")
  sleep(1)
  print "."
  sleep(1)
  print "."
  sleep(1)
  puts "."

  c = ((apr.to_f / 100) / 12)
  n = duration.to_f * 12
  payment = ((total_loan.to_f * (c * (1 + c) ** n)) / (((1 + c) ** n) - 1)).round(2)

  prompt("Your payment is: $#{payment}/month")

  prompt(MESSAGES['repeat'])
  answer = gets.chomp
  break unless answer.downcase().start_with?('y')
  prompt(MESSAGES['break'])
end