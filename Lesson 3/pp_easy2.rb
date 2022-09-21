# 1 ----------------------------------------------------------------
# see if "Spot" is present.
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages.key?("Spot")
p ages.include?("Spot")

# 2 ----------------------------------------------------------------
# Convert the string in the following ways (code will be executed on original munsters_description above):
munsters_description = "The Munsters are creepy in a good way."
# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
p munsters_description.swapcase
# "The munsters are creepy in a good way."
p munsters_description.capitalize
# "the munsters are creepy in a good way."
p munsters_description.downcase
# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."
p munsters_description.upcase

# 3 ----------------------------------------------------------------
# add ages for Marilyn and Spot to the existing hash
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
p ages.merge(additional_ages)

# 4 ----------------------------------------------------------------
# See if the name "Dino" appears in the string below:
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.include?('Dino') # # Note that this is not a perfect solution, as it would match any substring with Dino in it.
p advice.match?("Dino") # # Note that this is not a perfect solution, as it would match any substring with Dino in it.

# 5 ----------------------------------------------------------------
# Show an easier way to write this array:
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
p flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# 6 ----------------------------------------------------------------
# How can we add the family pet "Dino" to our usual array:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"
p flintstones

# 7 ----------------------------------------------------------------
# We could have used either Array#concat or Array#push to add Dino 
# to the family.
# How can we add multiple items to our array? (Dino and Hoppy)
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.concat(["Dino", "Hoppy"])
p flintstones.push("Dino", "Hoppy")

# 8 ----------------------------------------------------------------
# Shorten the following sentence:
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.slice!(0..38)
# advice.slice!(0, advice.index('house'))
p advice

# 9 ----------------------------------------------------------------
# Write a one-liner to count the number of lower-case 't' characters 
# in the following string:
statement = "The Flintstones Rock!"
p statement.count('t')

# 10 ----------------------------------------------------------------
# Back in the stone age (before CSS) we used spaces to align things 
# on the screen. If we had a table of Flintstone family members that 
# was forty characters in width, how could we easily center that 
# title above the table with spaces?
title = "Flintstone Family Members"
p title.center(40)