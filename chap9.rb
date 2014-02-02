
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
roman = roman + 'D' * (num%1000/ 500) 
roman = roman + 'C' * (num% 500/ 100) 
roman = roman + 'L' * (num% 100/ 50) 
roman = roman + 'X' * (num% 50/ 10) 
roman = roman + 'V' * (num% 10/ 5) 
roman = roman + 'I' * (num% 5/ 1) 
roman
end
puts(old_romans(1999))

# I = 1 V = 5 X = 10 L = 50 C = 100 D = 500 M = 1000

# New Roman numerals chapter 9 exercise

def new_romans number

thousands = (number / 1000)
hundreds = (number % 1000 / 100)
tens = (number % 100 / 10)
ones = (number / 10)

roman = 'M' * thousands

if hundreds == 9
	roman = roman + 'CM'
elsif hundreds == 4
	roman = roman + 'CD'
else
	roman = roman + 'D' * (number % 1000 / 500)
	roman = roman + 'C' * (number % 500 / 100)
end

if tens == 9
	roman = roman + 'XC'
elsif tens == 4 
	roman = roman + 'XL'
else
	roman = roman + 'L' * (number % 100 / 50)
	roman = roman + 'X' * (number % 50 / 10)
end

if ones == 9
	roman = roman + 'IX'
elsif ones == 4
	roman = roman + 'IV'
else
	roman = roman + 'V' * (number % 10 / 5)
	roman = roman + 'I' * (number % 5 / 1)
end

roman
end

puts(new_romans(1999))







