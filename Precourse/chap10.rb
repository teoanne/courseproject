

# Recursion shuffle exercise 1 Chapter 10

def shuffle array
  array.sort_by{rand}
end

p(shuffle([9, 8, 7, 6, 5, 4, 3, 2, 1]))


# Exercise 2 Chapter 10 Dictionary sort

def dictionary_sort array
  dic_sort array, []
end

def dic_sort unsorted, sorted
  if unsorted.length <= 0
    return sorted
  end

smallest = unsorted.pop
still_unsorted = []

unsorted.each do |done|
  if done.downcase < smallest.downcase
    still_unsorted.push smallest
    smallest = done
  else
    still_unsorted.push done
  end
end

sorted.push smallest

dic_sort still_unsorted, sorted
end

puts (dictionary_sort(['nano', 'bottle', 'corona', 'item', 'tuna', 'Nano', 'Tuna']))

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













