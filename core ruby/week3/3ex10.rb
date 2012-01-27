=begin
Exercise10. Write a Ruby program that, when given an array: collection = [1, 2, 3, 4, 5] calculates the sum of its elements.
=end

collection = [1, 2, 3, 4, 5]

def sum_elements (collection)
  sum = 0
  collection.each {|value| sum += value}
  return sum
end

puts sum_elements(collection)
