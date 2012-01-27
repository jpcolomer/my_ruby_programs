=begin
Write a Deaf Grandma program. Whatever you say to grandma (whatever you type in), she should respond with HUH?! SPEAK UP, SONNY!, unless you shout it (type in all capitals). If you shout, she can hear you (or at least she thinks so) and yells back, NO, NOT SINCE 1938! To make your program really believable, have grandma shout a different year each time; maybe any year at random between 1930 and 1950. You can't stop talking to grandma until you shout BYE.
=end

=begin
Exercise3. Call this program (p026zdeafgm2.rb) - Modify your Deaf Grandma program (Week 3 / Exercise6): What if grandma doesn't want you to leave? When you shout BYE, she could pretend not to hear you. Change your previous program so that you have to shout BYE three times in a row. Make sure to test your program: if you shout BYE three times, but not in a row, you should still be talking to grandma. You must shout BYE three separate times. If you shout BYEBYEBYE or BYE BYE BYE, grandma should pretend not to hear you (and not count it as a BYE).
=end

puts "Talk to Grandma"
sonny_says = ""
bye_counter = 0
until bye_counter == 3
  puts "You enter: "
  STDOUT.flush
  sonny_says = gets.chomp

  if sonny_says == 'BYE'
    bye_counter += 1
  else
    bye_counter = 0
    if sonny_says.scan(/[a-z]/) == []
      puts "NO, NOT SINCE %d!" % (1930+rand(21))
    else
      puts "Grandma responds: HUH?! SPEAK UP, SONNY!"
    end
  end
end
