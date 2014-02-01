puts self

# Chapter 6.2 exercise on same replies no matter what the input 


puts 'What do you want?'
reply = gets.chomp
boss = 'Whaddaya mean ' + '"' + reply + '"' + '?!? You\'re fired!' 
puts boss

# exercise on rjust, ljust, center Chapter 6.2

line_width = 50
puts ('Table of Contents'.center(line_width))
puts ('Chapter 1: Getting Started'.ljust(30) + 'page 1'.rjust(20))
puts ('Chapter 2: Numbers'.ljust(30) + 'page 9'.rjust(20))
puts ('Chapter 3: Letters'.ljust(30) + 'page 13'.rjust(20)) 

# random 

puts (rand(100))
srand 1000
puts (rand(100))
puts (rand(100))
puts (rand(100))
puts " "
srand 1000
puts (rand(100))
puts (rand(100))
puts (rand(100))

# if else 

puts 'Hello, welcome to 7th grade'
puts 'What\'s your name?'
name = gets.chomp
if name == name.capitalize
  puts 'Please take a seat ' + name + '.'
else
	puts name + '? You mean ' + name.capitalize + ' right?'
	puts 'Don\'t you even know how to spell your name?'
reply = gets.chomp
if reply.downcase == 'yes'
	puts 'Sit down'
else
	puts 'You spell your name starting with the capital letter.'
end
puts 'You\'re Done'
end

# While loops 

while true
	input = gets.chomp
	puts input
	if input == 'bye'
		break
	end
end

# exercise on elsif

puts 'Hello, what\'s your name?'
name = gets.chomp
puts 'Hello ' + name + '.'
if name == 'Chris'
	puts 'What a lovely name!'
elsif name == 'Anne'
  puts 'What a lovely name!'
end

# elseif DRY code exercise with the use of 'or' ||

puts 'Hello, what\'s your name?'
name = gets.chomp
puts 'Hello ' + name + '.'
if name == 'Chris' || name == 'Anne'
	puts 'What a lovely name!'
end

# exercise on other logical operators && (and) ! (not)

i_am_chris = true
i_am_purple = false
i_like_beer = true
i_eat_rocks = false

puts i_am_chris && i_like_beer
puts i_like_beer && i_eat_rocks
puts i_am_purple && i_like_beer
puts i_am_purple && i_eat_rocks
puts

puts i_am_chris || i_like_beer
puts i_like_beer || i_eat_rocks
puts i_am_purple || i_like_beer
puts i_am_purple || i_eat_rocks
puts

puts !i_am_purple
puts !i_am_chris