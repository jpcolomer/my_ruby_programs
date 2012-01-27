text = ''
(1..100).each do |number|
  tmp =  case
    when number % (3*5) == 0 then  'FizzBuzz'
    when number % 3 == 0 then  'Fizz'
    when number % 5 == 0 then  'Buzz'
    else  number.to_s
  end
  text << tmp + '\n'
end
puts text
