units = ["Celsius", "Fahrenheit", "Kelvin"]

puts "Enter the temperature in Celsius, Fahrenheit or Kelvin, ex: 21 Celsius"
STDOUT.flush
temperature_to_convert, unit_from = gets.chomp.split(/ /)
temperature_to_convert = temperature_to_convert.to_f

unit_from = units.index(unit_from)


unit_to_question = "Enter the number for the unit you would like to convert to:"

(0..units.length-1).each do |i|
#for i in 0..units.length-1
  unit_to_question << "\n#{i+1}: #{units[i]} "
end

puts(unit_to_question)

unit_to = gets.chomp.to_i-1

def convert_unit(temperature_to_convert, unit_from, unit_to)

  case unit_from
  when 0
    case unit_to
    when 1
      #convert Celsius to Fahrenheit
      temperature = temperature_to_convert*9/5 + 32
    when 2
      #convert Celsius to Kelvin
      temperature = temperature_to_convert + 273.15
    end
  when 1
    case unit_to
    when 0
      #convert Fahrenheit to Celsius
      temperature = (temperature_to_convert-32)*5/9
    when 2
      #convert Fahrenheit to Kelvin
      temperature = convert_unit(temperature_to_convert, unit_from, 0) - 273.15
    end
  when 2
    case unit_to
    when 0
      #convert Kelvin to Celsius
      temperature = temperature_to_convert -273.15
    when 1
      #convert Kelvin to Fahrenheit
      temperature = convert_unit(temperature_to_convert - 273.15, 0, 1)
    end
  end

  return temperature

end

#  if unit_from == 0
#    if unit_to == 1
#      #convert Celsius to Fahrenheit
#      temperature = temperature_to_convert*9/5 + 32
#    elsif unit_to == 2
#      #convert Celsius to Kelvin
#      temperature = temperature_to_convert + 273.15
#    end
#  elsif unit_from == 1
#    if unit_to == 0
#      #convert Fahrenheit to Celsius
#      temperature = (temperature_to_convert-32)*5/9
#    elsif unit_to == 2
#      #convert Fahrenheit to Kelvin
#      temperature = convert_unit(temperature_to_convert, unit_from, 0) - 273.15
#    end
#  elsif unit_from == 2
#    if unit_to == 0
#      #convert Kelvin to Celsius
#      temperature = temperature_to_convert -273.15
#    elsif unit_to == 1
#      #convert Kelvin to Fahrenheit
#      temperature = convert_unit(temperature_to_convert - 273.15, 0, 1)
#    end
#  end
#  return temperature
#end

puts "%.2f %s are %.2f %s" % [temperature_to_convert, units[unit_from], convert_unit(temperature_to_convert, unit_from, unit_to), units[unit_to]]
