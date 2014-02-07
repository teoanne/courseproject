require 'pry'
# Exercise 1
[1,2,3,4,5].each do |n|
  addition = n + 1
  puts addition 
end

# Exercise 1.a

[1,2,3,4,5].each do |n|
  addition = n + 1
  puts addition = [10, 11, 12, 12, "ab, cd"]
  puts addition
end
puts "Finished 1.a"

# Exercise 1.b
addition = [10, 11, 12, 12, "ab, cd"]
puts addition.uniq #modified

puts "See below - uniq method does not modify the original string"
puts addition #unmodified

puts "Finished 1.b"
# Exercise 1.c
addition = [10, 11, 12, 12, "ab, cd"]
puts addition.uniq!

puts "Finished 1.c" 

# Delete method
addition.delete(10)

puts addition
puts "Finished 1.c"
