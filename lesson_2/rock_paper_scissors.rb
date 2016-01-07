# Constants
VALID_CHOICES = %w(rock paper scissors lizard spock)
VALID_ABRV = %w(r p sc l sp)

# Variables
score = [0, 0]
choice = ''

# Methods
def prompt(string)
  puts "=> #{string}"
end

def win?(first, second)
  first == "rock" && (second == "scissors" || second == "lizard") ||
    first == "paper" && (second == "rock" || second == "spock") ||
    first == "scissors" && (second == "paper" || second == "lizard") ||
    first == "lizard" && (second == "paper" || second == "spock") ||
    first == "spock" && (second == "scissors" || second == "rock")
end

def results(array, choice_1, choice_2)
  if win?(choice_1, choice_2)
    prompt("You win!")
    score_tracker(array, 0)
  elsif win?(choice_2, choice_1)
    prompt("Computer wins!")
    score_tracker(array, 1)
  else
    puts "Its a tie!"
  end
end

def score_tracker(array,num)
  if num == 0
    array[0] += 1
  elsif num == 1
    array[1] += 1
  end
end

def display(array)
  prompt("The score is...")
  prompt("You: #{array[0]}")
  prompt("Computer: #{array[1]}")
end

def abrv_to_full_word(word)
  case word
  when "r"
    word << "ock"
  when "p"
    word << "aper"
  when "sc"
    word << "issors"
  when "l"
    word << "izard"
  when "sp"
    word << "ock"
  end 
end

# Main Logic
prompt("Welcome to our Rock, Paper, Scissors, Lizard, Spock game!")
prompt("First player to 5 points wins the game!")

loop do
  prompt("Please make your choice #{VALID_CHOICES.join(', ')}")
  prompt("You can type in the first letter only (HINT: sc for scissors and sp for spock")

  # Input check
  loop do
    choice = gets.chomp.downcase
    if VALID_CHOICES.include?(choice) || VALID_ABRV.include?(choice)
      break
    else
      prompt("Plase enter a valid choice")
    end
  end

  # Check in case the short version is used
  if VALID_ABRV.include?(choice)  
    player_choice = abrv_to_full_word(choice)
  else
    player_choice = choice
  end

  # Random computer choice
  computer_choice = VALID_CHOICES.sample

  # Display of choices
  prompt("You picked #{player_choice}")
  prompt("Computer picked #{computer_choice}")

  # Outcome calculator and display of results
  results(score, player_choice, computer_choice)
  display(score)

  # Check if one of the players has won the game
  if score[0] == 5
    prompt("Congratulations! You defeated the computer!")
    prompt("Would you like to defeat the machines again?(type y for yes)")
    repeat = gets.chomp.downcase
    break unless repeat.start_with?('y')
    score = [0,0]
  elsif score[1] == 5
    prompt("You were defeated by the computer! You suck")
    prompt("How about you try again and do us humans proud?(type y for yes)")
    repeat = gets.chomp.downcase
    break unless repeat.start_with?('y')
    score = [0,0]
  end

  prompt("---------------------")
end

prompt("Thank you for playing. Goobye.")