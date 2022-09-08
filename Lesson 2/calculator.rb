# Build a command line calculator program that does the following:

# - asks for two numbers
# - asks for the type of operation to perform: add, subtract, multiply 
#   or divide
# - displays the result

# Use the Kernel.gets() method to retrieve user input, and use 
# Kernel.puts() method to display output. Remember that Kernel.gets() 
# includes the newline, so you have to call chomp() to remove it: 
# Kernel.gets().chomp().

print "Give a number: "
first = gets.chomp.to_i

print "Give another number: "
second = gets.chomp.to_i

print "What operation? Add, subtract, multiply, or divide: "
op = gets.chomp

def compute(first, second, op)
	case op
	when "add"
		result = first + second
	when "subtract"
		result = first - second
	when "multiply"
		result = first * second
	when "divide"
		result = first / second
	end
end

puts "Result: " + compute(first, second, op).to_s
