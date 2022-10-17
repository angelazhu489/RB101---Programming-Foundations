require 'pry' # binding.pry

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +  # Rows
								[[1, 4, 7], [2, 5, 8], [3, 6, 9]] +  # Cols
								[[1, 5, 9], [3, 5, 7]]               # Diagonals

# Format prompts
def prompt(msg)
	puts "=> #{msg}"
end

# Display board to terminal with board hash
def display_board(brd)
	# system "clear"
	puts "You are '#{PLAYER_MARKER}'. Computer is '#{COMPUTER_MARKER}'"
	puts "Best to 5..."
	puts ""
	puts "     |     |"
	puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
	puts "     |     |"
	puts "-----+-----+-----"
	puts "     |     |"
	puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
	puts "     |     |"
	puts "-----+-----+-----"
	puts "     |     |"
	puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
	puts "     |     |"
	puts ""
end

# Initialize empty board hash
def initialize_board
	new_board = {}
	(1..9).each { |ind| new_board[ind] = INITIAL_MARKER }
	new_board
end

# Get array of empty squares
def empty_squares(brd)
	brd.keys.select { |key| brd[key] == INITIAL_MARKER}
end

# Get string of empty square choices
def joinor(arr)
	str = ''
	ind = 0
	return arr[0].to_s if arr.length == 1
	arr.each do |num|
		if ind == arr.length - 1
			str << "or #{num}"
		else
			str << "#{num}, "
		end
		ind += 1
	end
	str
end

# Add player's move to board hash
def player_moves!(brd)
	square =''
	loop do
		prompt("Choose a square (#{joinor(empty_squares(brd))}): ")
		square = gets.chomp.to_i
		break if empty_squares(brd).include?(square)
		prompt("Sorry, not a valid choice :-(")
	end
	brd[square] = PLAYER_MARKER
end

# Check if there is line with two of same marker
# Return square (int) to put next marker
def two_in_row(brd, marker)
	square = 0
	WINNING_LINES.each do |line|
		# Get array of true/false. True if (player marker) false else
		arr = line.map do |sqr|
			brd[sqr] == marker
		end

		# Check if array contains two trues
		if arr.count(true) == 2
			# Find which square in line is false
			check_sqr = line[arr.find_index(false)]
			if brd[check_sqr] == INITIAL_MARKER
				square = check_sqr 
				# binding.pry
				break
			end
		end
	end
	square
end

# Add computers move to board hash
def computer_moves!(brd)
	square = 0
	# Offense: If no threat, and comp already has two in a row
	if (1..9).include?(two_in_row(brd, COMPUTER_MARKER))
		square = two_in_row(brd, COMPUTER_MARKER)
	# Defense: If player about to win, computer mark square to block 
	# player
	elsif (1..9).include?(two_in_row(brd, PLAYER_MARKER))
		square = two_in_row(brd, PLAYER_MARKER)
	# If no threat, choose random square or 5th square
	else
		if brd[5] == INITIAL_MARKER 
			square = 5
		else
			square = empty_squares(brd).sample
		end
	end
	brd[square] = COMPUTER_MARKER
end

# Return true or false is board is empty or not
def board_full?(brd)
	empty_squares(brd).empty?
end

# Return true or false is anyone won round
def winner?(brd)
	!!detect_winner(brd)
end

# Return string of round winner or nil
def detect_winner(brd)
	WINNING_LINES.each do |line|
		if brd[line[0]] == PLAYER_MARKER &&
			brd[line[1]] == PLAYER_MARKER &&
			brd[line[2]] == PLAYER_MARKER
			return 'Player'
		elsif brd[line[0]] == COMPUTER_MARKER &&
			brd[line[1]] == COMPUTER_MARKER &&
			brd[line[2]] == COMPUTER_MARKER
			return 'Computer'
		end
	end
	nil
end

# Find final winner, best to 5, rest scores
def final_winner?(player, comp)
	if player == 5
		prompt("Player won!!!!!")
		true
	elsif comp == 5
		prompt("Computer won!!!!!")
		true
	else
		false
	end
end

# Play move
def play_piece!(brd, curr_play)
	player_moves!(brd) if curr_play == 'player'
	computer_moves!(brd) if curr_play == 'comp'
end

# Alternate player turn
def change_player!(curr_play)
	return 'comp' if curr_play == 'player'
	return 'player' if curr_play == 'comp'
end

player_score = 0
computer_score = 0
current_player = 'player'

# MAIN LOOP
loop do 
	board = initialize_board

	# Who goes first?
	ans = ''
	loop do
		prompt("Do you want to go first? (y/n): ")
		ans = gets.chomp
		break if ans.downcase.start_with?('y') || 
			ans.downcase.start_with?('n')
		prompt("Not valid input.")
	end
	if ans == 'n'
		display_board(board)
		current_player = 'comp'
	end

	loop do
		display_board(board)
		play_piece!(board, current_player)
		current_player = change_player!(current_player)
		break if winner?(board) || board_full?(board)
	end

	display_board(board)

	# Show results
	if winner?(board)
		prompt("#{detect_winner(board)} won the round!")
		player_score +=1 if detect_winner(board) == 'Player'
		computer_score +=1 if detect_winner(board) == 'Computer'
	else
		prompt("It's a tie!")
	end

	# Show score
	prompt("Score -----------------    ")
	prompt("Player: #{player_score}")
	prompt("Computer: #{computer_score}")

	# Reset scores if someone won 5 times
	if final_winner?(player_score, computer_score)
		player_score = 0 
		computer_score = 0
	end

	# Play again?
	ans = ''
	loop do
		prompt("Do you want to play again? (y/n): ")
		ans = gets.chomp
		break if ans.downcase.start_with?('y') || 
			ans.downcase.start_with?('n')
		prompt("Not valid input.")
	end
	if ans == 'n'
		prompt("Thanks for playing!! Goodbye :-)")
		break
	end
end