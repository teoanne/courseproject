
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

