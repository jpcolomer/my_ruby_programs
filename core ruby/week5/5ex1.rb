=begin
Write a class UnpredictableString which is a sub-class of String. This sub-class should have a method called scramble() which randomly rearranges any string as follows:

>ruby unpredictablestring.rb
daano.r n sdt a htIsw taikmgy r
>Exit code: 0
# the original string was: "It was a dark and stormy night."
=end


class UnpredictableString &lt; String
  def scramble
    self.scan(/./).shuffle.join('')
#    @string_tmp = self.scan(/./)
#    @string = ''
#    while @string_tmp.length > 0
#      index = rand(@string_tmp.length)
#      @string &lt;&lt; @string_tmp[index]
#      @string_tmp.delete_at(index)
#    end
#    return @string
  end
end

puts UnpredictableString.new('It was a dark and stormy night.').scramble
