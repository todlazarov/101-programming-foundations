CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  puts ("=> #{message}")
end

def display_results(player_choice, computer_choice)
  if (player_choice == "rock" && computer_choice == "scissors") || 
     (player_choice == "paper" && computer_choice == "rock") || 
     (player_choice == "scissors" && computer_choice == "paper")
    prompt("You win!")
  elsif (player_choice == "rock" && computer_choice == "paper") || 
     (player_choice == "paper" && computer_choice == "scissors") || 
     (player_choice == "scissors" && computer_choice == "rock")
    prompt("Computer wins!")
  else
    prompt("It's a tie!")
  end  
end

prompt("Welcome to our Rock, Paper, Scissors game!")

loop do
  prompt("Choose an option by typing out word:")
  prompt("1. Rock")
  prompt("2. Paper")
  prompt("3. Scissors")

  player_choice = gets.chomp.downcase

  computer_choice = CHOICES.sample

  prompt("You selected #{player_choice}.")
  prompt("The computer selecter #{computer_choice}.")

  display_results(player_choice, computer_choice)

  prompt("Would you like to play again? (Y for yes)")
  repeat = gets.chomp.downcase
  break unless repeat.start_with?("y")
end