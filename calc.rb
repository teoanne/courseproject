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
number = number.to_i
number = number + 1
puts number.to_s + ' is a better number!'

# exercise on same replies no matter what the input Chapter 6.2

puts self

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

# 99 bottles of beer on the wall exercise Chapter 7

number = 99
while number <= 99
puts number.to_s + ' bottles of beer on the wall, ' + number.to_s + 'bottles of beer.'
number = number - 1
puts 'Take one down and pass it around, ' + number.to_s + 'bottles of beer on the wall.' 
if number == 0
break
end
end

# Grandma exercise chapter 7

puts 'What did you say?'

while true
reply = gets.chomp

if reply == 'BYE' 
	puts 'Ok bye!'
	break
elsif reply != reply.upcase
	puts 'HUH?! SPEAK UP, SONNY'
else 
	random = 1930 + rand(21)
	puts 'NO, NOT SINCE ' + random.to_s + '!'
end
end

# Deaf grandma 'BYE' 3 times exercise

bye_count = 0

while true
	bye = gets.chomp
	if bye == 'BYE'
		bye_count = bye_count + 1
	else
		bye_count = 0
	end
	if bye_count >= 3
		puts 'Ok Bye!'
		break
end
end


# Chapter 8: Array exercise 1 - building and sorting an array

puts 'Write as many words as you like: '
typed = []

while true
	type = gets.chomp
	break if type.empty?

	typed.push type
end

puts 'Here it is all sorted'
puts typed.sort

# Chapter 8 Arrays exercise 2 Table of Contents

title = ['Table of Contents'] 
chapters = [['Getting Started', 1], ['Numbers', 9], ['Letters', 1]]

puts title
puts

chap_num = 1

chapters.each do |chap|
	name = chap[0]
	page = chap[1]

beginning = 'Chapter ' + chap_num.to_s + ': ' + name
ending = 'page ' + page.to_s

puts beginning.ljust(30) + ending.rjust(20)
chap_num = chap_num + 1

end

# Exercise on saying moo - chapter 9

def say_moo number_of_moos
puts 'moooo....' * number_of_moos
end

say_moo 3

# Chapter 9 exercise on the 'ask' method using return

def ask question

	while true
		puts question
		reply = gets.chomp.downcase
		if (reply == 'yes' || reply == 'no')
			if reply == 'yes'
				return true
			else
				return false
				end
			break
			else 
				puts 'You have to answer yes or no.'
			end
		end
	end

ask 'lets start, do you like chinese food?'
wets_bed = ask 'do you wet the bed?'
puts wets_bed

# Old School Roman numerals chapter 9 exercise


def old_romans num

roman	= ''

roman = roman + 'M' * (num / 1000)
roman = roman +'D'*(num%1000/ 500) 
roman = roman +'C'*(num% 500/ 100) 
roman = roman +'L'*(num% 100/ 50) 
roman = roman +'X'*(num% 50/ 10) 
roman = roman +'V'*(num% 10/ 5) 
roman = roman +'I'*(num% 5/ 1) 
roman
end
puts(old_romans(1999))

# I = 1 V = 5 X = 10 L = 50 C = 100 D = 500 M = 1000

# New Roman numerals chapter 9 exercise

def new_romans numbers
end


# Recursion shuffle exercise 1 Chapter 10

def shuffle_words word
	word.array.shuffle
	if word >= 5
		puts []
	else
		shuffle_words 
	end
	shuffle_words word
end

word_string = ''

# Exercise 2 Chapter 10 Dictionary sort

def dictionary_sort
	[].sort.by_alphabet
end

# Extended exercise Chapter 10 

def english_number number
	if number < 0
		return 'Please write a number bigger than 0'
	end

	if number == 0
		return 'zero'
	end


num_string = ''

ones_place = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
tens_place = ['ten', 'twenty', 'thirty', 'fourty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety']
teenagers = ['eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']
hundreds = ['']
thousands = ['']

left = number
write = left/1000
left = left - write*1000

if write > 0
	thousands = english_number write
	num_string = num_string + thousands + 'thousand'
	if left > 0
		num_string = num_string + ' '
	end
end

left = number
write = left/100
left = left - write*100

if write > 0
	hundreds = english_number write
	num_string = num_string + hundreds + 'hundred'
	if left > 0
		num_string = num_string + ' '
end
end

write = left/10
left = left - write*10

if write > 0
	if ((write==1) and (left>0))
		num_string = num_string + teenagers[left-1]
		left = 0
	else 
		num_string = num_string + tens_place[write-1]
end

if left > 0
	num_string = num_string + ''
	end
end

write = left
left = 0

if write > 0 
	num_string = num_string + ones_place[write-1]
end

num_string
end


puts english_number(8)
puts english_number(1000)
puts english_number(91)
















