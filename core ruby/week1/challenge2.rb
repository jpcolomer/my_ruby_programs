lines = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit.", "Duis imperdiet sem eu quam.", "Donec bibendum tincidunt purus.", "Nunc eu tellus sed turpis volutpat pellentesque.", "asdfasf", "asdfasf", "asdfasf", "asdfasf", "asdfasf", "asdfasf", "asdfasf", "asdfasf"
lines2 = "asldfnasldnfasdfasdf\nldnfasdfasdf\naskgfjhaskfbaskdbfasf\nophsoqwrhoaqwrhfeaqwrogiherg  asohfasoidhdf \n"

def align_output(lines)

  output_str = ""
  lines = lines.split(/\n/)
  max_nb_line_digits = lines.length.to_s.length

  lines.each_with_index do |line, index|
    output_str &lt;&lt; "Line %#{max_nb_line_digits}d: %s\n" % [index+1, line]
  end
  return output_str
end

#puts align_output(lines)
puts align_output(lines)
