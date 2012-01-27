=begin
Write a Deaf Grandma program. Whatever you say to grandma (whatever you type in), she should respond with HUH?! SPEAK UP, SONNY!, unless you shout it (type in all capitals). If you shout, she can hear you (or at least she thinks so) and yells back, NO, NOT SINCE 1938! To make your program really believable, have grandma shout a different year each time; maybe any year at random between 1930 and 1950. You can't stop talking to grandma until you shout BYE.
=end

puts "Talk to Grandma"
STDOUT.flush
sonny_says = ""
while sonny_says != "BYE"
  puts "You enter: "
  sonny_says = gets.chomp
  unless sonny_says == 'BYE'
    if sonny_says.scan(/[a-z]/) == []
      puts "NO, NOT SINCE %d!" % (1930+rand(21))
    else
      puts "Grandma responds: HUH?! SPEAK UP, SONNY!"
    end
  end
end
