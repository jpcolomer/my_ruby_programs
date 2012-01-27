=begin

Write a program that processes the string s = "Welcome to the forum.\nHere you can learn Ruby.\nAlong with other members.\n" a line at a time, using all that we have learned so far. The expected output is:

>ruby tmp.rb
Line 1: Welcome to the forum.
Line 2: Here you can learn Ruby.
Line 3: Along with other members.
>Exit code: 0

=end


s = "Welcome to the forum.\nHere you can learn Ruby.\nAlong with other members.\n"
#def processes(str)
#  str.split("\n")
#end

line = s.split("\n")

line.each do |line|
  puts line
end

(0..line.length-1).each do |line_index|
  puts "Line #{line_index+1}: #{line[line_index]}"
end
