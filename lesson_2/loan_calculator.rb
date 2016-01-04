# Car loan calculator

require 'yaml'
MESSAGES = YAML.load_file('loan_calculator_messages.yml')

# Methods

def number?(num)
  num.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
end

# Variables
name = ''

puts MESSAGES['hello']
puts MESSAGES['description']
puts MESSAGES['name']

loop do
  name = gets.chomp
  if name.empty?
    puts MESSAGES['valid_name']
  else
    break
  end
end

puts "Hello #{name}! Lets begin!"

loop do # Main loop
  # Variables
  total_loan = ''
  apr = ''
  duration = ''

  puts MESSAGES['total_amount']
  loop do
    total_loan = gets.chomp
    if number?(total_loan)
      break
    else
      puts MESSAGES['valid_number']
    end
  end

  puts MESSAGES['APR']
  loop do
    apr = gets.chomp
    if number?(apr)
      break
    else
      puts MESSAGES['valid_number']
    end
  end

  puts MESSAGES['loan_duration']
  loop do
    duration = gets.chomp
    if number?(duration)
      break
    else
      puts MESSAGES['valid_number']
    end
  end

  print "Calculating"
  sleep(1)
  print "."
  sleep(1)
  print "."
  sleep(1)
  puts "."

  c = ((apr.to_f / 100) / 12)
  n = duration.to_f * 12
  payment = ((total_loan.to_f * (c * (1 + c) ** n)) / (((1 + c) ** n) - 1)).round(2)

  puts "Your payment is: $#{payment}/month"

  puts MESSAGES['repeat']
  answer = gets.chomp
  break unless answer.downcase().start_with?('y')
  puts MESSAGES['break']
end