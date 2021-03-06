pairs = {3 => "Fizz", 5 => "Buzz", 7 => "Dazz", 11 => "Kezz"}

def number_output (number, pairs)
  output = ""
  pairs.each_pair do |key, value|
    if number % key == 0
      output << value
    end
  end

  if output == ""
    output = number
  end
  return output
end

(1..100).each do |number|
  puts number_output(number, pairs)
end
