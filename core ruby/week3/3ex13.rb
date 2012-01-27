h = { "Ruby" => "Matz", "Perl" => "Larry", "Python" => "Guido" }

puts h.member?("Matz")
puts h.member?("Python")
puts h.include?("Guido")
puts h.include?("Ruby")
puts h.has_value?("Larry")
puts h.exists?("Perl")
