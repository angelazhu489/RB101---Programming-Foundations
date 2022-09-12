# Build a command line calculator program that does the following:

# - asks for two numbers
# - asks for the type of operation to perform: add, subtract, multiply 
#   or divide
# - displays the result

# Use the Kernel.gets() method to retrieve user input, and use 
# Kernel.puts() method to display output. Remember that Kernel.gets() 
# includes the newline, so you have to call chomp() to remove it: 
# Kernel.gets().chomp().

def prompt(message)
	puts "=> #{message}"
end

# Check if input is number and not 0
def valid_number?(num)
	num != 0 && num.is_a?(Integer)
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

def op_to_msg(op)
	case op
	when 1
		"Adding"
	when 2
		"Subtracting"
	when 3
		"Multiplying"
	when
		"Dividing"
	end
end

prompt("Welcome to Angela's Calculator! Enter your name: ")

# Get name of user
name = nil
# Check if name is not empty
loop do
	name = gets.chomp
	break unless name.empty?
	prompt("Please give a valid name.")
end
prompt("Hello #{name.capitalize}!")

# Main loop
loop do

	# Get first number
	first = nil
	loop do
		prompt("Give a number: ")
		first = gets.chomp.to_i
		break if valid_number?(first)
		prompt("Not a valid number.")
	end

	# Get second number
	second = nil
	loop do
		prompt("Give another number: ")
		second = gets.chomp.to_i
		break if valid_number?(second)
		prompt("Not a valid number.")
	end

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