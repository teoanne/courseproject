puts 1+2
puts 1.0 + 2.0
puts 2.0 * 3.0
puts 5.0 - 8.0
puts 9.0 / 2.0

puts 5 * (12 - 8) + -15
puts 98 + (59872 / (13*8)) * -51
puts 24 * 365
puts (60 * 24) * (365 * 10)
puts (60 * 60) * 24 * 365 * 32
puts 1160000000 / 365

puts "Hello World"
puts " "
puts "Good-bye"
puts "I like " + "apple pie"
puts "blink " * 4


puts 'You\'re Swell!'

name = "Teo Sue Anne"
puts "My name is " + name

puts 'Hello there, and what\'s your name?'
name = gets.chomp
puts 'Your name is ' + name + '? What a lovely name!'
puts 'Pleased to meet you ' + name + '. :-)'

puts 'What is your first name?'
firstname = gets.chomp
puts 'Great! ' + firstname + ' What\'s your last name?'
lastname = gets.chomp
puts 'So your firstname is ' + firstname + ' and your last name is ' + lastname + '. Welcome ' + firstname + ' ' + lastname + '.'

# exercise on number

puts 'what\'s your favourite number?'
number = gets.chomp

# exercise on same replies no matter what the input

puts self

puts 'What do you want?'
reply = gets.chomp
boss = 'Whaddaya mean ' + '"' + reply + '"' + '?!? You\'re fired!' 
puts boss

# exercise on rjust, ljust, center

line_width = 50 
puts ('Table of Contents'.center(line_width))
puts ('Chapter 1: Getting Started'.ljust(line_width/2) + 'page 1'.rjust(line_width/2))
puts ('Chapter 2: Numbers'.ljust(line_width/2) + 'page 9'.rjust(line_width/2))
puts ('Chapter 3: Letters'.ljust(line_width/2) + 'page 13'.rjust(line_width/2)) 

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
end

# While loops 

while true
	input = gets.chomp
	puts input
	if input == 'bye'
		break
	end
end

# exercise on elseif

puts 'Hello, what\'s your name?'
name = gets.chomp
puts 'Hello ' + name + '.'
if name == 'Chris'
	puts 'What a lovely name!'
elseif name == 'Anne'
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



# chapter 8 exercises


title = ['Table of Contents'] 
chapters = [['Getting Started, 1'], ['Numbers, 9'], ['Letters, 1']]

puts title
puts

chap_num = 1

chapters.each do |chap|
	name = chap[0]
	page = chap[1]

beginning = 'Chapter ' + chap_num.to_s + ': ' + name
ending = 'page ' + page.to_s
end