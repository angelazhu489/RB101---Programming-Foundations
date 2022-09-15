# In this assignment, we'll build a Rock Paper Scissors game. 
# The game flow should go like this:
# - the user makes a choice
# - the computer makes a choice
# - the winner is displayed

VALID_CHOICES = ['rock', 'paper', 'scissors']


# def test_method
#   prompt('test message') # DOES NOT WORK. PROMPT IS UNDEFINED
# end
# test_method  

def prompt(msg)
	puts "==> #{msg}"
end

# Print result of game
def display_result(player, computer)
	if (player == 'rock' && computer == 'scissors' || 
		player == 'paper' && computer == 'rock' || 
		player == 'scissors' && computer == 'paper')
		prompt("You won!")
	elsif (player == 'rock' && computer == 'paper' || 
		player == 'paper' && computer == 'scissors' || 
		player == 'scissors' && computer == 'rock')
		prompt("You lost.")
	else 
		prompt("It's a tie")
	end
end

loop do
	# Get choice from user
	choice = nil
	loop do
		prompt("Choose one: #{VALID_CHOICES.join(', ')}")
		choice = gets.chomp
		break if VALID_CHOICES.include?(choice.downcase)
		prompt("Invalid choice.")
	end

	# Get computer choice
	computer_choice = VALID_CHOICES.sample

	prompt("You chose: #{choice}")
	prompt("Computer chose: #{computer_choice}")

	display_result(choice, computer_choice)

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