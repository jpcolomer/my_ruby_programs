=begin
Exercise9. Given a string, write a program to reverse the word order (rather than character order). The String and Array classes provide methods which will be very helpful for solving this exercise.
=end

def reverse_sentence_order (sentence)
  sentence.split.reverse.join(" ")
end

puts reverse_sentence_order("Hello World")
