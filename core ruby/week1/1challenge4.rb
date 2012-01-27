=begin

 multiplication_table (integer, heading = '', decorate = false)
  returns a string object.
=end

def multiplication_table (n, heading = '', decorate = false)
  table = ''
  max_nb_digits = (n*n).to_s.size

  if heading != ''
    table << heading.center((max_nb_digits+1)*(n-1)+n.to_s.size+2)
    table << "\n"
#    table << "% #{((max_nb_digits+1)*(n-1)+n.to_s.size+2 + heading.size)/2}s\n" % heading
  end

  if decorate
    ((max_nb_digits+1)*(n-1)+n.to_s.size+2).times do
      table << "="
    end
    table << "\n"
  end

  (1..n).each do |j|
    (1..n).each do |i|
      if i ==1
        table << "%#{n.to_s.size+1}d" % (j*i)
      elsif i == n
        table << "%#{max_nb_digits+1}d\n" % (j*i)
      else
        table << "%#{max_nb_digits+1}d" % (j*i)
      end
    end
  end

  if decorate
    ((max_nb_digits+1)*(n-1)+n.to_s.size+2).times do
      table << "="
    end
  end

  return table
end

puts multiplication_table(13, "Times to table 13", true)
