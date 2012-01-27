f = File.open('text.txt','r')
line_count = 0
char_count = 0
char_count_no_space = 0
word_count = 0
sentence_count = 0
paragraph_count = 1

while line = f.gets
  line_count = line_count + 1
  char_count = char_count + line.strip.length
  char_count_no_space = char_count_no_space + line.strip.gsub(/ /, '').length
  word_count = word_count + line.split(/ /).length
  sentence_count = sentence_count + line.count(".!?")
  paragraph_count = paragraph_count + line.count("\n\n")
end

puts "Character count: %d" % char_count
puts "Character count (excluding spaces): %d" % char_count_no_space
puts "Line count: %d" % line_count
puts "Word count: %d" % word_count
puts "Sentence count: %d" % sentence_count
puts "Paragraph count: %d" % paragraph_count
puts "Average number of words per sentence: %.2f" % (word_count.to_f/sentence_count)
puts "Average number of sentences per paragraph: %.2f" % (sentence_count.to_f/paragraph_count)
f.close
