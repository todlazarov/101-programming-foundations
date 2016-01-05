# Constants
VALID_CHOICES = %w(rock paper scissors lizard spock)
VALID_ABRV = %w(r p sc l sp)

# Variables
choice = ''
player_choice = ''
$player_score = 0
$computer_score = 0

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
    score_tracker("player")
  elsif win?(computer_choice, player_choice)
    prompt("Computer wins!")
    score_tracker("computer")
  else
    prompt("It's a tie!")
  end
end

def score_tracker(winner)
  $player_score += 1 if winner == "player"
  $computer_score += 1 if winner == "computer"
end

def abrv_to_full_word(word)
  case word
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

def display_score(score_1, score_2)
  prompt("The score is...")
  prompt("You: #{score_1}")
  prompt("Computer: #{score_2}")
end

prompt("Welcome to our Rock, Paper, Scissors, Lizard, Spock game!")
prompt("First player to 5 points wins the game!")

loop do
  prompt("Choose an option: #{VALID_CHOICES.join(', ')}")
  prompt("You can type in the first letter only(HINT: sc for scissors and sp for spock)")

  loop do
    choice = gets.chomp.downcase
    if VALID_CHOICES.include?(choice) || VALID_ABRV.include?(choice)
      break
    else
      prompt("Please enter a valid choice")
    end
  end

  computer_choice = VALID_CHOICES.sample
  player_choice = abrv_to_full_word(choice)

  prompt("You selected #{player_choice}.")
  prompt("The computer selecter #{computer_choice}.")

  display_results(player_choice, computer_choice)

  if $player_score == 5
    prompt("Congratulations! You defeated the computer!")
    prompt("Would you like to beat his a$$ again?(type y for Yes)")
    repeat = gets.chomp.downcase
    break unless repeat.start_with?("y")
  elsif $computer_score == 5
    prompt("You were beaten by the computer! You suck!")
    prompt("How about you try again and do us humans proud?(type y for Yes)")
    repeat = gets.chomp.downcase
    break unless repeat.start_with?("y")
  end
  
  display_score($player_score, $computer_score)
  prompt("------------------------")
end

prompt("Thank you for playing! Goodbye")