# 1 ----------------------------------------------------------------
# Every object in Ruby has access to a method called object_id, which 
# returns a numerical value that uniquely identifies the object. 
# This method can be used to determine whether two variables are 
# pointing to the same object.
# Take a look at the following code and predict the output:
a = "forty two"
b = "forty two"
c = a

puts a.object_id
puts b.object_id
puts c.object_id
# 2551085120
# 2551085100
# 2551085120

# 2 ----------------------------------------------------------------
a = 42
b = 42
c = a

puts a.object_id
puts b.object_id
puts c.object_id

# 85
# 85
# 85
# Integers are immutable; that is, the value of an integer object 
# cannot be mutated. In Ruby, each integer is a single immutable 
# object (eg, there can only ever be one integer 1 object, one 
# integer 2 object, and so on). As a result, a, b, and c all 
# reference the same immutable integer 42 object. Any operation 
# on an integer simply returns a new integer object.

# 3 ----------------------------------------------------------------
# Let's call a method, and pass both a string and an array as 
# arguments and see how even though they are treated in the same 
# way by Ruby, the results can be different.
# Study the following code and state what will be displayed...and why:
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga" # Does not modify string
  an_array_param << "rutabaga" # Modifies array
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}" # pumpkins
puts "My array looks like this now: #{my_array}" # ["pumpkins", "rutabaga"]

# 4 ----------------------------------------------------------------
# To drive that last one home...let's turn the tables and have the 
# string show a modified output, while the array thwarts the method's 
# efforts to modify the caller's version of it.
def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga' # Modifies string
  an_array_param = ['pumpkins', 'rutabaga'] # Does not modify array
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}" # pumpkinsrutabaga
puts "My array looks like this now: #{my_array}" # ["pumpkins"]

# 5 ----------------------------------------------------------------
# How can we change this code to make the result easier to predict 
# and easier for the next programmer to maintain? That is, the 
# resulting method should not mutate either argument, but my_string 
# should be set to 'pumpkinsrutabaga' and my_array should be set 
# to ['pumpkins', 'rutabaga']
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# ==>
def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# 6 ----------------------------------------------------------------
# How could the following method be simplified without changing 
# its return value?
def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end
# ==> 
def color_valid(color)
  color == "blue" || color == "green"
end