VALID_CHOICES = %w(rock paper scissors lizard spock)

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  (first == "rock" && (second == "scissors" || second == "lizard")) ||
    (first == "paper" && (second == "rock" || second == "spock")) ||
    (first == "scissors" && (second == "paper" || second == "lizard")) ||
    (first == "lizard" && (second == "spock" || second == "paper")) ||
    (first == "spock" && (second == "scissors" || second == "rock"))
end

def display_results(player_choice, computer_choice)
  if win?(player_choice, computer_choice)
    prompt("You win!")
  elsif win?(computer_choice, player_choice)
    prompt("Computer wins!")
  else
    prompt("It's a tie!")
  end
end

player_choice = ''

prompt("Welcome to our Rock, Paper, Scissors game!")

loop do
  prompt("Choose an option by typing out word: #{VALID_CHOICES.join(', ')}")

  loop do
    player_choice = gets.chomp.downcase
    if VALID_CHOICES.include? player_choice
      break
    else
      prompt("Please enter a valid choice")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You selected #{player_choice}.")
  prompt("The computer selecter #{computer_choice}.")

  display_results(player_choice, computer_choice)

  prompt("Would you like to play again? (Y for yes)")
  repeat = gets.chomp.downcase
  break unless repeat.start_with?("y")
end

prompt("Thank you for playing! Goodbye")