
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
