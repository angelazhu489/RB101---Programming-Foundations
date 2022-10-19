require 'pry' # binding.pry

NON_NUMBER_NAMES = { 'J' => 'Joker', 'Q' => 'Queen', 'K' => 'King', 
										'A' => 'Ace'}
SUITS = { 'H' => 'Hearts', 'D' => 'Diamonds', 'C' => 'Clubs', 
				'S' => 'Spades'}
NON_NUMBER_VALUES = { 'J' => 10, 'Q' => 10, 'K' => 10, 
									'A' => [1, 11]}

# Format prompt with '=>'
def prompt(msg)
	puts "=> #{msg}"
end

# Initialize new nexted array of full card deck [[suit, value], ...]
def new_deck(deck)
	suits = ['H', 'D', 'C', 'S'] # Hearts, Diamonds, Clubs, Spades
	values = ('2'..'10').to_a + ['J', 'K', 'Q', 'A']
	deck = []
	values.each do |val|
		suits.each { |suit| deck << [suit, val] }
	end
	deck
end

# Get card from deck and remove from deck
# Return card
def deal_card(deck)
	card = deck.sample
	deck.delete(card)
	card
end

# Get full name of card as eg. 4 of diamonds
def card_to_string(card)
	suit = SUITS[card[0]]
	value = card[1]
	# If value of card is a letter
	value = NON_NUMBER_NAMES[value] if value.to_i == 0
	"#{value} of #{suit}"
end

# Show cards to player
def show_cards(cards)
	hand = ''
	counter = 0
	cards.each do |card|
		hand << card_to_string(card)
		if counter == cards.length - 2
			hand << " and "
		end
		if cards.length != 2 && counter < cards.length - 2
			hand << ", "
		end
		counter += 1
	end
	hand
end

# Get the total value of cards
def sum_cards(cards)
	sum = 0
	aces = 0
	value = 0
	cards.each do |card|
		# If card is a number card
		value = card[1].to_i if card[1].to_i != 0
		# If card is non number card
		if card[1].to_i == 0 
			# If card is an ace
			if card[1] == 'A'
				aces += 1
			else
				value = NON_NUMBER_VALUES[card[1]]
			end
		end
		sum += value
	end
	# If aces exists in hand
	while aces > 0
		if sum + 11 > 21
			sum += 1
		else
			sum += 11
		end
		aces -= 1
	end
	sum
end

# Check if total value of cards is busted (> 21)
def busted?(val)
	val > 21
end

# Input value totals of players and return string of winner or tie
def compare_cards(dealer_total, player_total)
	dealer_total > player_total ? winner = 'Dealer' : winner = 'Player'
	winner = 'tie' if dealer_total == player_total
	winner
end

prompt("Welcome to Angela's game of Twenty One!")

loop do
	player_bust = false
	dealer_bust = false

	# Initialize deck
	deck = new_deck(deck)

	# Deal cards to player and dealer
	player_cards = [deal_card(deck), deal_card(deck)]
	dealer_cards = [deal_card(deck), deal_card(deck)]
	player_total = sum_cards(player_cards)
	dealer_total= sum_cards(dealer_cards)

	# Show cards on table
	prompt("=================================================")
	prompt("Dealer has: #{card_to_string(dealer_cards[0])}")
	prompt("You have: #{show_cards(player_cards)} - Total: #{player_total}")
	prompt("=================================================")

	# PLAYER TURN
	choice = ''
	loop do
		# Ask player to hit or stay
		loop do
			prompt("Do you want to hit (h) or stay (s)?")
			choice = gets.chomp
			break if choice.downcase.start_with?('h') || choice.downcase.start_with?('s')
			prompt("Not a valid choice :-(")
		end
		
		# If stay, compare cards and declare winner
		break if choice == 's'
		prompt("You hit") if choice == 'h'

		# Player hits
		# Give player a card
		player_cards << deal_card(deck)
		player_total = sum_cards(player_cards)
		prompt("=================================================")
		prompt("Dealer has: #{card_to_string(dealer_cards[0])}")
		prompt("You have: #{show_cards(player_cards)} - Total: #{player_total}")
		prompt("=================================================")

		# Check if player busted
		player_bust = busted?(player_total)
		# If busted, break loop, dealer wins
		if player_bust
			prompt("Oh no you busted!")
			prompt("Dealer wins :-(")
			break
		end
	end

	# DEALER TURN
	# If player stayed and player did not bust
	if choice == 's' && player_bust == false
		# dealer_total = sum_cards(dealer_cards)

		# Dealer hits until total >= 17
		loop do
			# Dealer stays if dealer total >= 17
			if dealer_total >= 17
				prompt("Dealer has: #{show_cards(dealer_cards)} - Total: #{dealer_total}")
				prompt("Dealer stays")
				break
			end

			# Dealer hits if dealer total < 17
			prompt("Dealer hits")
			dealer_cards << deal_card(deck)
			dealer_total = sum_cards(dealer_cards)
			prompt("=================================================")
			prompt("Dealer has: #{show_cards(dealer_cards)} - Total: #{dealer_total}")
			prompt("You have: #{show_cards(player_cards)} - Total: #{player_total}")
			prompt("=================================================")
			# Check if dealer busted
			dealer_bust = busted?(dealer_total)
			if dealer_bust
				prompt("Dealer busted!")
				prompt("Player wins :-)")
				break
			end
		end

		# Dealer stayed (noone busts), compare cards
		if !player_bust && !dealer_bust
			winner = compare_cards(dealer_total, player_total)
			prompt("It's a tie :/") if winner == 'tie'
			prompt("Dealer wins :-(") if winner == 'Dealer'
			prompt("Player wins :-)") if winner == 'Player'
		end
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
		prompt("Byee, thanks for playing!!")
		break
	end
end