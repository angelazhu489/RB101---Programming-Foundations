# 1 ----------------------------------------------------------------
# What would you expect the code below to print out?
numbers = [1, 2, 2, 3]
numbers.uniq # does not modify numbers array
puts numbers
# ==> 1, 2, 2, 3

# 2 ----------------------------------------------------------------
# Describe the difference between ! and ? in Ruby. 
# And explain what would happen in the following scenarios:
# 1. what is != and where should you use it?
# ==> "not equals"
# 2. put ! before something, like !user_name
# ==> boolean opposite
# 3. put ! after something, like words.uniq!
# ==> modifies words array
# 4. put ? before something
# ==> ? : is the ternary operator for if...else
# 5. put ? after something
# ==> part of method name; could be a method returning boolean
# 6. put !! before something, like !!user_name
# ==> turn into boolean

# 3 ----------------------------------------------------------------
# Replace the word "important" with "urgent" in this string:
advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.gsub!('important', 'urgent')

# 4 ----------------------------------------------------------------
# What do the following method calls do (assume we reset numbers 
# to the original array between method calls)?
numbers = [1, 2, 3, 4, 5]

numbers.delete_at(1) # ==> delete at index 1 [1, 3, 4, 5]
numbers.delete(1) # ==> delete '1' in array [2, 3, 4, 5]

# 5 ----------------------------------------------------------------
# Programmatically determine if 42 lies between 10 and 100.
# puts true if 42 > 10 && 42 < 100
puts (10..100).cover?(42)

# 5 ----------------------------------------------------------------
# show two different ways to put the expected "Four score and " 
# in front of it.
famous_words = "seven years ago..."
puts famous_words.prepend("Four score and ")
# puts "Four score and ".concat(famous_words)
# "Four score and " + famous_words
# "Four score and " << famous_words

# 5 ----------------------------------------------------------------
# Make this into an un-nested array.
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
# ==> ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
p flintstones.flatten!

# 6 ----------------------------------------------------------------
# Turn this into an array containing only two elements: Barney's 
# name and Barney's number
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
p flintstones.assoc("Barney")