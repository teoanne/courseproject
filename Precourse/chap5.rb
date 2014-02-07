# Chapter 5 name exercise

puts 'Hello there, and what\'s your name?'
name = gets.chomp
puts 'Your name is ' + name + '? What a lovely name!'
puts 'Pleased to meet you ' + name + '. :-)'

puts 'What is your first name?'
firstname = gets.chomp
puts 'Great! ' + firstname + ' What\'s your last name?'
lastname = gets.chomp
puts 'So your firstname is ' + firstname + ' and your last name is ' + lastname + '. Welcome ' + firstname + ' ' + lastname + '.'



# Chapter 5 exercise on number

puts 'what\'s your favourite number?'
number = gets.chomp
number = number.to_i
number = number + 1
puts number.to_s + ' is a better number!'