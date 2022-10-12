produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(input)
	input_list = input.keys
	fruits = {}
	counter = 0
	while counter < input_list.length
		fruits[input_list[counter]] = 'Fruit' if input[input_list[counter]] == 'Fruit'
		counter += 1
	end
	fruits
end

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

# -----------------------------------------------------------------
my_numbers = [1, 4, 3, 7, 2, 6]

def double_numbers!(input)
	count = 0
	while count < input.length
		input[count] = input[count] * 2
		count += 1
	end
	input
end

p double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]
p my_numbers # => [2, 8, 6, 14, 4, 12]

# -----------------------------------------------------------------

my_numbers = [1, 4, 3, 7, 2, 6]

def double_odd_indices(input)
	doubled = []
	counter = 0

	while counter < input.length
		if counter % 2 == 0
			doubled.push(input[counter])
		else 
			doubled.push(input[counter] * 2)
		end
		counter += 1
	end
	doubled
end

p double_odd_indices(my_numbers)  # => [1, 8, 3, 14, 2, 12]
p my_numbers # => [1, 4, 3, 7, 2, 6]

# -----------------------------------------------------------------

my_numbers = [1, 4, 3, 7, 2, 6]

def multiply(input, num)
	multiplied = []
	counter = 0

	while counter < input.length
		multiplied.push(input[counter] * num)
		counter += 1
	end
	multiplied
end

p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]
p my_numbers