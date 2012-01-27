def isLeap(year)
	if (year % 4) == 0
		true
	else
		false
	end
end

DAYS_IN_NORMAL_YEAR = 365
DAYS_IN_LEAP_YEAR = 366
HOURS_IN_DAY = 24
MINUTES_IN_HOUR = 60

MINUTES_IN_LEAP_YEAR = DAYS_IN_LEAP_YEAR*HOURS_IN_DAY*MINUTES_IN_HOUR
MINUTES_IN_NORMAL_YEAR = DAYS_IN_NORMAL_YEAR*HOURS_IN_DAY*MINUTES_IN_HOUR

def minutesInYear(year)
	if isLeap(year)
		MINUTES_IN_LEAP_YEAR
	else
		MINUTES_IN_NORMAL_YEAR
	end
end

def printResult(year)
	puts "There are #{minutesInYear(year)} minutes in the year #{year}"
#	puts "There are " + minutesInYear(year).to_s + " minutes in the year " + year.to_s
end

printResult(2012)
printResult(2015)
