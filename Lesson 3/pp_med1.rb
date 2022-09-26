# 1 ----------------------------------------------------------------
# write a one-line program that creates the following output 10 times, 
# with the subsequent line indented 1 space to the right:
line = "The Flintstones Rock!"
10.times {puts line = " #{line}"}
10.times { |number| puts (" " * number) + "The Flintstones Rock!" }

# 2 ----------------------------------------------------------------
# The result of the following statement will be an error. 
# Why is this and what are two possible ways to fix this?
# puts "the value of 40 + 2 is " + (40 + 2)
puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "the value of 40 + 2 is #{40 + 2}"

# 3 ----------------------------------------------------------------
# Alyssa noticed that this will fail if the input is 0, or a negative 
# number, and asked Alan to change the loop. How can you make this 
# work without using begin/end/until? Note that we're not looking to 
# find the factors for 0 or negative numbers, but we just want to 
# handle it gracefully instead of raising an exception or going into 
# an infinite loop.
def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
	end
  factors
end
p factors(10)
p factors(0)
p factors(-10)

# 4 ----------------------------------------------------------------
# Alyssa was asked to write an implementation of a rolling buffer. 
# Elements are added to the rolling buffer and if the buffer becomes 
# full, then new elements that are added will displace the oldest 
# elements in the buffer.
# She wrote two implementations saying, "Take your pick. Do you 
# like << or + for modifying the buffer?". Is there a difference 
# between the two, other than what operator she chose to use to 
# add an element to the buffer?

# Modifies input element buffer
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# Does not modify input element input_array
def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# 5 ----------------------------------------------------------------
# Alyssa asked Ben to write up a basic implementation of a Fibonacci 
# calculator. A user passes in two numbers, and the calculator will 
# keep computing the sequence until some limit is reached.
# Ben coded up this implementation but complained that as soon 
# as he ran it, he got an error. Something about the limit 
# variable. What's wrong with the code?
limit = 15
def fib(first_num, second_num)
  while first_num + second_num < limit # limit not in scope
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end
result = fib(0, 1)
puts "result is #{result}"

limit = 15
def fib(first_num, second_num, limit)
  while first_num + second_num < limit # limit not in scope
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end
result = fib(0, 1, limit)
puts "result is #{result}"

# 6 ----------------------------------------------------------------
# What is the output of the following code?
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8 # ==> 42 - 8 = 34

# 7 ----------------------------------------------------------------
# One day Spot was playing with the Munster family's home computer 
# and he wrote a small program to mess with their demographic data:
# Did the family's data get ransacked? Why or why not?
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

mess_with_demographics(munsters)
# Yes. demo_hash points to munsters hash

# 8 ----------------------------------------------------------------
# Method calls can take expressions as arguments. Suppose we define 
# a method called rps as follows, which follows the classic rules of 
# rock-paper-scissors game: it returns the winning fist or, in the 
# case of a tie, the fist that both players played.
# What is the result of the following call?
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end
puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
# ==> paper

# 9 ----------------------------------------------------------------
# What would be the return value of the following method invocation?
def foo(param = "no")
  "yes" # ==> yes
end

def bar(param = "no") # (yes)
  param == "no" ? "yes" : "no" # if statement is false ==> no
end

bar(foo)
# ==> no