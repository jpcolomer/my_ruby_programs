=begin
  Exercise11. Write a Ruby program that, when given an array: collection = [12, 23, 456, 123, 4579] prints each number, and tells you whether it is odd or even
=end

def odd_or_even (number)
  number % 2 == 0 ? "even" : "odd"
end

collection = [12, 23, 456, 123, 4579]

collection.each {|value| puts "#{value}: #{odd_or_even(value)}"}
