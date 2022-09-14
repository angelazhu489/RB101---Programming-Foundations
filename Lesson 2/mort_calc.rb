# Take everything you've learned so far and build a mortgage calculator
# (or car payment calculator -- it's the same thing).
# You'll need three pieces of information:
# - the loan amount
# - the Annual Percentage Rate (APR)
# - the loan duration
# From the above, you'll need to calculate the following things:
# - monthly interest rate
# - loan duration in months
# - monthly payment
# You can use the following formula: m = p * (j / (1 - (1 + j)**(-n)))
# - m = monthly payment
# - p = loan amount
# - j = monthly interest rate
# - n = loan duration in months

require 'yaml'
MSG = YAML.load_file('mort_calc_msg.yml')

# Style prompts
def prompt(key)
	# msg = MSG[key]
	if MSG[key] == nil
		puts "==> #{key}"
	else 
		puts "==> #{MSG[key]}"
	end
end

# Check loan amount input is float
def valid_loan?(input)
	Float(input) rescue false
end

# Check interest input is float
def valid_interest?(input)
	Float(input.delete('%')) rescue false
end

# Check duration input is a number
def valid_duration?(input)
	Integer(input) rescue false
end

# START ----------------------------------------------------------
# Print welome prompt
prompt('welcome')

# Main loop
loop do
	# Print loan amount prompt
	loan_amnt = nil
	loop do
		prompt('loan_amnt')
		loan_amnt = gets.chomp
		break if valid_loan?(loan_amnt)
		prompt('invalid_loan_amnt')
	end
	loan_amnt = loan_amnt.to_f 

	# Get annual interest rates
	interest = nil
	loop do
		prompt('interest')
		interest = gets.chomp
		break if valid_interest?(interest)
		prompt('invalid_interest')
	end
	annual_interest = interest.delete('%').to_f / 100
	monthly_interest = annual_interest / 12 # Monthly interest rate

	# Get loan duration
	duration = nil
	loop do
		prompt('duration')
		duration = gets.chomp
		break if valid_duration?(duration)
		prompt('invalid_duration')
	end
	duration = duration.to_i
	months = duration * 12

	# Calculate monthly payment
	monthly_payment = loan_amnt * 
		(monthly_interest / (1 - (1 + monthly_interest)**(-months)))

	# Print result
	prompt("Your monthly payment is: $#{format('%.2f', monthly_payment)}")

	# Run again?
	response = nil
	loop do
		prompt('again')
		response = gets.chomp
		break if response.downcase.start_with?('n') || response.downcase.start_with?('y')
		prompt("Not valid. (y) to continue (n) to quit")
	end
	break if response.downcase.start_with?('n')

end