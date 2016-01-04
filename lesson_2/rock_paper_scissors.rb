# Constants
VALID_CHOICES = %w(rock paper scissors lizard spock)
VALID_ABRV = %w(r p sc l sp)

# Variables
player_choice = ''

# Methods
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

def abrv_to_full_word(player_choice)
  case player_choice
  when "r"
    player_choice = "rock"
  when "p"
    player_choice = "paper"
  when "sc"
    player_choice = "scissors"
  when "l"
    player_choice = "lizard"
  when "sp"
    player_choice = "spock"
  end
end

prompt("Welcome to our Rock, Paper, Scissors, Lizard, Spock game!")

loop do
  prompt("Choose an option: #{VALID_CHOICES.join(', ')}")
  prompt("You can type in the first letter only(HINT: sc for scissors and sp for spock)")

  loop do
    player_choice = gets.chomp.downcase
    if VALID_CHOICES.include?(player_choice) || VALID_ABRV.include?(player_choice)
      break
    else
      prompt("Please enter a valid choice")
    end
  end

  computer_choice = VALID_CHOICES.sample
  abrv_to_full_word(player_choice)

  prompt("You selected #{player_choice}.")
  prompt("The computer selecter #{computer_choice}.")

  display_results(player_choice, computer_choice)

  prompt("Would you like to play again? (Y for yes)")
  repeat = gets.chomp.downcase
  break unless repeat.start_with?("y")
end

prompt("Thank you for playing! Goodbye")