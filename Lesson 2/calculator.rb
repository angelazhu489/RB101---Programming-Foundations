# Build a command line calculator program that does the following:

# - asks for two numbers
# - asks for the type of operation to perform: add, subtract, multiply 
#   or divide
# - displays the result

# Use the Kernel.gets() method to retrieve user input, and use 
# Kernel.puts() method to display output. Remember that Kernel.gets() 
# includes the newline, so you have to call chomp() to remove it: 
# Kernel.gets().chomp().

# Yaml file for messages
require 'yaml'
MESSAGES = YAML.load_file('calc_messages.yml')
LANGUAGE = 'en'

# Get messages of chosen language
def messages(message, lang='en')
  MESSAGES[lang][message]
end

# Message style
def prompt(message)
	# message = messages(key, LANGUAGE)
	puts "=> #{message}"
end

# Check if input is number or float
def valid_number?(input)
	input.to_i.to_s == input || input.to_f.to_s == input
end

# Check if op 1-4 or a, s, m, d
def valid_op?(op)
	true if (op.to_i > 0 && op.to_i < 5) || op.downcase.start_with?('a') || op.downcase.start_with?('s') || op.downcase.start_with?('m') || op.downcase.start_with?('d')
end

# Turn option to number 1, 2, 3, 4
def get_op(op)
	if op.to_i == 1 || op.downcase.start_with?('a')
		1
	elsif op.to_i == 2 || op.downcase.start_with?('s')
		2
	elsif op.to_i == 3 || op.downcase.start_with?('m')
		3
	elsif op.to_i == 4 || op.downcase.start_with?('d')
		4
	end
end

# Convert operation to message
def op_to_msg(op)
	word = case op
	when 1
		"Adding"
	when 2
		"Subtracting"
	when 3
		"Multiplying"
	when
		"Dividing"
	end
	word
end

prompt(messages('welcome', LANGUAGE))

# Get name of user
name = nil
# Check if name is not empty
loop do
	name = gets.chomp
	break unless name.empty?
	prompt(messages('valid_name', LANGUAGE))
end
prompt("Hello #{name.capitalize}!")

# Main loop
loop do

	# Get first number
	first = nil
	loop do
		prompt("Give a number: ")
		first = gets.chomp
		break if valid_number?(first)
		prompt("Not a valid number.")
	end
	first = first.to_f

	# Get second number
	second = nil
	loop do
		prompt("Give another number: ")
		second = gets.chomp
		break if valid_number?(second)
		prompt("Not a valid number.")
	end
	second = second.to_f

	# Get operation
	op = nil
	prompt("Which operation?")
	op_prompt = <<-MSG 
		1) add
		2) subtract
		3) multiply
		4) divide
	MSG
	prompt(op_prompt)
	loop do
		op = gets.chomp
		break if valid_op?(op)
		prompt("Not a valid operation.")
		prompt("Must choose:")
		prompt(op_prompt)
	end

	def compute(first, second, op)
		case op
		when 1
			first + second
		when 2
			first - second
		when 3
			first * second
		when 4
			first / second
		end
	end

	# Print result
	op = get_op(op)
	result = compute(first, second, op).to_s
	prompt("#{op_to_msg(op)} #{first} and #{second}...")
	prompt("Result: #{result}")

	# Run again?
	prompt("Do you want to perform another calulation? (y/n)")
	answer = nil
	loop do
		answer = gets.chomp
		break if answer.downcase.start_with?('n') || answer.downcase.start_with?('y')
		prompt("Not valid. (y) to continue (n) to quit")
	end
	break if answer.downcase.start_with?('n')
end

prompt("Thank you for using Angela's Calulator! Goodbye!")