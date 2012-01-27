SECONDS_IN_MONTH = 60*60*24*365/12

def age_in_years_months(age)
	years = age/SECONDS_IN_MONTH/12
	months = age/SECONDS_IN_MONTH % 12
	return [years, months]
end

def print_result(age)
	years, months = age_in_years_months(age)
	puts "I'm #{years} years and #{months} months old"
end

print_result(979000000)
print_result(2158493738)
print_result(246144023)
print_result(1270166272)
print_result(1025600095)
