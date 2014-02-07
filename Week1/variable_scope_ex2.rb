require 'pry'
puts "Exercise 2 - Variable Scope"

# addition = 11

def test
  [1,2,3,4,5].each do |n|
    addition = n + 1
  end
end

puts addition 

def test
  [1,2,3,4,5].each do |n|
    addition = n + 1
    addition do
    	puts "i won't be printed"
    end
  end
end

puts addition

