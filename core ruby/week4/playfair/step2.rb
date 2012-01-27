class Ciphersquare
  attr_reader :table
  def initialize(key_phrase)
    @key_phrase = key_phrase
    @content = (@key_phrase.gsub(/j/i,"I") + [*('a'..'z')].join(' ') ).upcase.gsub(/[^A-Z]|J/,"").split("").uniq
    @table = Array.new(5) {Array.new(5)}
    @table.each_with_index do |row, row_index|
      row.each_index do |col_index|
        @table[row_index][col_index] = @content[5*row_index + col_index]
      end
    end
  end
  def to_s
    @content_string = ""
    @content.each_with_index do |character, index|
      @content_string << character + " "
      @content_string << "\n" if (index+1) % 5 == 0
    end
    return @content_string
  end
end


class Playfaire
  attr_reader :key_phrase, :cipher_square

  def initialize(key_phrase)
    @key_phrase = key_phrase
    @cipher_square = Ciphersquare.new(@key_phrase)
  end

  def formed_message(input_message)
    @message_tmp = input_message.upcase.gsub(/[^A-Z]/,"").scan(/./)
    @message = ""
    while @message_tmp.length > 0
      if @message_tmp.length == 1
        @message << @message_tmp[0] + "X"
      elsif @message_tmp[0] == @message_tmp[1] && @message_tmp[0] != @message_tmp[2]
        @message << @message_tmp[0] + "X"
      elsif @message_tmp[0] == @message_tmp[1] && @message_tmp[0] == @message_tmp[2]
        @message << @message_tmp[0] + "X"
        @message << @message_tmp[1] + "Z"
        @message_tmp.delete_at(1)
      else
        @message << @message_tmp[0] + @message_tmp[1]
        @message_tmp.delete_at(1)
      end
      @message_tmp.delete_at(0)
    end
    return @message
  end

end


playfair = Playfaire.new("I love Ruby")
puts playfair.formed_message("King JP XX")
