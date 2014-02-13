# 1. Use the "each" method of Array to iterate over [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], and print out each value.

a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
a.each { |n| puts n }

# 2. Same as above, but only print out values greater than 5.

a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
a.each { |n| puts n if n > 5 }

# 3. Now, using the same array from #2, use the "select" method to extract all odd numbers into a new array.
a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

a.select { |n| n % 2 == 1 }

# 4. Append "11" to the end of the array. Prepend "0" to the beginning.
a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
a << 11

a.unshift(0)

# 5. Get rid of "11". And append a "3".
a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

a.pop && a << 3

# 6. Get rid of duplicates without specifically removing any one value. 
a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 4, 5, 4, 5]
a.uniq

# 7. What's the major difference between an Array and a Hash?
puts "an array is referenced by index, a hash is referenced by key value pairs"

# 8. Create a Hash using both Ruby 1.8 and 1.9 syntax.
# Suppose you have a h = {a:1, b:2, c:3, d:4}
puts "Ruby 1.8 syntax"
Hash = {
  :a => 1
  :b => 2
  :c => 3
  :d => 4
}

puts "Ruby 1.9 syntax"

Hash = {
  a: 1
  b: 2
  c: 3
  d: 4
}

# 9. Get the value of key "b".

puts "'b' is a string. There is no such object above." 

puts "to get the value of :b instead, we do the following => Hash[:b]"

# 10. Add to this hash the key:value pair {e:5}

Hash[:e] = 5

# 13. Remove all key:value pairs whose value is less than 3.5

Hash.each { |k, v| Hash.delete k if v < 3.5 }

# 14. Can hash values be arrays? Can you have an array of hashes? (give examples)

puts 'Yes. Examples below'

Hash[:f] = [1, 2, 3, 4]

a = ['a', 'b,', '{a:4, b:3, s:7}']

# 15. Look at several Rails/Ruby online API sources and say which one your like best and why.

puts "Product and Pop methods"




