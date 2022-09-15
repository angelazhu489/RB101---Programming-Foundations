# In this assignment, we'll build a Rock Paper Scissors game. 
# The game flow should go like this:
# - the user makes a choice
# - the computer makes a choice
# - the winner is displayed

VALID_CHOICES = %w(rock paper scissors lizard spock)
VALID_CHOICES_SHORT = %w(r p s l sp)
BEATS = {
	rock: ['scissors', 'lizard'],
	paper: ['rock', 'spock'],
	scissors: ['paper', 'lizard'],
	lizard: ['paper', 'spock'],
	spock: ['rock', 'scissors']
}

# def test_method
#   prompt('test message') # DOES NOT WORK. PROMPT IS UNDEFINED
# end
# test_method  

# Format prompts
def prompt(msg)
	puts "==> #{msg}"
end

# Get full string of choice
def get_choice(input)
	return input.downcase if VALID_CHOICES.include?(input.downcase)
	case input.downcase
	when 'r'
		'rock'
	when 'p'
		'paper'
	when 's'
		'scissors'
	when 'l'
		'lizard'
	when 'sp'
		'spock'
	end
end

# Win conditions
def win?(first, second)
	BEATS[first.to_sym].include?(second)
	end

# Print result of game
def display_result(player, computer)
	if win?(player, computer)
		prompt("You won!")
		'player'
	elsif win?(computer, player)
		prompt("You lost.")
		'computer'
	else 
		prompt("It's a tie")
	end
end

# Score counter
player_win = 0
computer_win = 0

# MAIN LOOP
loop do
	# Get choice from user
	choice = nil
	loop do
		prompt("Choose one: #{VALID_CHOICES.join(', ')} (#{VALID_CHOICES_SHORT.join(', ')})")
		choice = gets.chomp
		break if VALID_CHOICES.include?(choice.downcase) || 
			VALID_CHOICES_SHORT.include?(choice.downcase)
		prompt("Invalid choice.")
	end
	choice = get_choice(choice)

	# Get computer choice
	computer_choice = VALID_CHOICES.sample

	prompt("You chose: #{choice}")
	prompt("Computer chose: #{computer_choice}")

	winner = display_result(choice, computer_choice)
	player_win += 1 if winner == 'player'
	computer_win += 1 if winner == 'computer'

	# Print score
	prompt("Score -------------------------------------------------")
	prompt("Player: #{player_win}")
	prompt("Computer: #{computer_win}")

	# Play again?
	answer = nil
	loop do
		prompt("Do you want to play again? (y/n)")
		answer = gets.chomp
		break if answer.downcase.start_with?('n') || answer.downcase.start_with?('y')
		prompt("Not valid. (y) to continue (n) to quit")
	end
	break if answer.downcase.start_with?('n')

end