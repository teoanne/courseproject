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
