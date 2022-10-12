['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
# => 2

[1, 2, 3].reject do |num|
  puts num
end
# => [1, 2, 3]

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
# => { "a" => "ant", "b" => "bear", "c" => "cat" }

hash = { a: 'ant', b: 'bear' }
hash.shift
# => [:a, "ant"]

['ant', 'bear', 'caterpillar'].pop.size
# => 11

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
# => true

arr = [1, 2, 3, 4, 5]
arr.take(2)
# => [1, 2]

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
# => [nil, "bear"]

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
# => [1, nil, nil]

# 1 ------------------------------------------------------------
# Turn this array into a hash where the names are the keys and the
# values are the positions in the array.
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
new_hash = {}
flintstones.each_with_index do |val, index|
	new_hash[val] = index
end
p new_hash

# 2 ------------------------------------------------------------
# Add up all of the ages from the Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
total = 0
ages.each { |key, val| total += val }
p total

# 3 ------------------------------------------------------------
# Remove people with age 100 and greater.
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.map { |key, val| ages.delete(key) if val >= 100 }
p ages

# 4 ------------------------------------------------------------
# Pick out the minimum age from our current Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
p ages.values.min

# 5 ------------------------------------------------------------
# Find the index of the first name that starts with "Be"
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.index { |name| name[0, 2] == "Be" }

# 6 ------------------------------------------------------------
# Amend this array so that the names are all shortened to just the 
# first three characters:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.map! {|elem| elem = elem[0, 3]}
p flintstones

# 7 ------------------------------------------------------------
# Create a hash that expresses the frequency with which each letter occurs in this string:
statement = "The Flintstones Rock"
counts = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
	letter_frequency = statement.count(letter)
	counts[letter] = letter_frequency if letter_frequency > 0
end
p counts

# 8 ------------------------------------------------------------
# What happens when we modify an array while we are iterating over 
# it? What would be output by this code?
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number # prints 1, 3
  numbers.shift(1) # => [2, 3, 4], [3, 4]
end
# irb(main):005:1> 
# 1
# 3
# => [3, 4]

# What would be output by this code?
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number # prints 1, 2
  numbers.pop(1) # => [1, 2, 3], [1, 2]
end
# irb(main):010:1> 
# 1
# 2
# => [1, 2]

# 9 ------------------------------------------------------------
# As we have seen previously we can use some built-in string methods 
# to change the case of a string. A notably missing method is 
# something provided in Rails, but not in Ruby itself...titleize. 
# This method in Ruby on Rails creates a string that has each 
# word capitalized as it would be in a title. 
# Write your own version of the rails titleize implementation.
words = "the flintstones rock"
# words = words.split(" ")
# words.map! { |val| val.capitalize! }
# words = words.join(" ")
# p words

p words.split.map { |word| word.capitalize }.join(' ')
p words

# 9 ------------------------------------------------------------
# Modify the hash such that each member of the Munster family 
# has an additional "age_group" key that has one of three values 
# describing the age group the family member is in (kid, 
# adult, or senior). Your solution should produce the hash below
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
# munsters.each do|key, val| 
# 	if munsters[key]["age"] > 0 && munsters[key]["age"] < 18
# 		munsters[key]["age_group"] = "kid"
# 	elsif munsters[key]["age"] > 17 && munsters[key]["age"] < 65
# 		munsters[key]["age_group"] = "adult"
# 	else
# 		munsters[key]["age_group"] = "senior"
# 	end
# end

p munsters

munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end