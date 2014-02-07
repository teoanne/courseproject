# In Ruby, it depends on what happens in the method. If the method mutates the caller, then object changes, if not, the object will not change

# passing by value of the reference

def array(obj)
  obj.uniq
end

outer_stuff = [1,2,3,4,4,4]

array(outer_stuff)

puts outer_stuff

def array(obj)
  obj.uniq!
end

outer_stuff = [1,2,3,4,4,4]

array(outer_stuff)

puts outer_stuff