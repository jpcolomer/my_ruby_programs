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
      @content_string &lt;&lt; character + " "
      @content_string &lt;&lt; "\n" if (index+1) % 5 == 0
    end
    return @content_string
  end

  def search_coordinates(character)
    @table.each_with_index do |row, row_index|
      return [row_index, row.index(character)] if row.include?(character)
    end
  end

  def encrypt_rectangle(coord1, coord2)
    [@table[coord1[0]][coord2[1]], @table[coord2[0]][coord1[1]]]
  end

  alias decrypt_rectangle encrypt_rectangle

  def move_index(index, n)
  #n > 0: return the index of a row or column moved n places to the right or down
  #n &lt; 0: return the index of a row or column moved n places to the left or up
    @movement = n > 0 ? n % @table.length : -(n.abs % @table.length)
    case
    when index + @movement >= @table.length
      @cipher_index = index + @movement - @table.length
    when index + @movement &lt; 0
      @cipher_index = @table.length + index + @movement
    else
      @cipher_index = index + @movement
    end
  end

  def encrypt_row (coord, mov = 1)
    @row, @col = coord
    @table[@row][move_index(@col, mov)]
  end

  def encrypt_col (coord, mov = 1)
    @row, @col = coord
    @table[move_index(@row, mov)][@col]
  end

  def decrypt_row (coord, mov = -1)
    encrypt_row(coord, mov)
  end

  def decrypt_col (coord, mov = -1)
    encrypt_col(coord, mov)
  end

  def encrypt_pair(pair)
    @pair_tmp = pair.scan(/./)
    @coord1 = search_coordinates(@pair_tmp[0])
    @coord2 = search_coordinates(@pair_tmp[1])
    if @coord1[0] == @coord2[0]
      @encrypt_char1 = encrypt_row(@coord1)
      @encrypt_char2 = encrypt_row(@coord2)
    elsif @coord1[1] == @coord2[1]
      @encrypt_char1 = encrypt_col(@coord1)
      @encrypt_char2 = encrypt_col(@coord2)
    else
      @encrypt_char1, @encrypt_char2 = encrypt_rectangle(@coord1, @coord2)
    end
    @encrypt_char1 + @encrypt_char2
  end

  def decrypt_pair(pair)
    @pair_tmp = pair.scan(/./)
    @coord1 = search_coordinates(@pair_tmp[0])
    @coord2 = search_coordinates(@pair_tmp[1])
    if @coord1[0] == @coord2[0]
      @decrypt_char1 = decrypt_row(@coord1)
      @decrypt_char2 = decrypt_row(@coord2)
    elsif @coord1[1] == @coord2[1]
      @decrypt_char1 = decrypt_col(@coord1)
      @decrypt_char2 = decrypt_col(@coord2)
    else
      @decrypt_char1, @decrypt_char2 = decrypt_rectangle(@coord1, @coord2)
    end
    @decrypt_char1 + @decrypt_char2
  end

end


class Playfaire
  attr_reader :key_phrase, :cipher_square

  def initialize(key_phrase)
    @key_phrase = key_phrase
    @cipher_square = Ciphersquare.new(@key_phrase)
  end

  def formed_message(input_message)
    @message_tmp = input_message.upcase.gsub(/j/i,"I").gsub(/[^A-Z]/,"").scan(/./)
    @message = ""
    while @message_tmp.length > 0
      if @message_tmp.length == 1
        @message &lt;&lt; @message_tmp[0] + "X"
      elsif @message_tmp[0] == @message_tmp[1] && @message_tmp[0] != @message_tmp[2]
        @message &lt;&lt; @message_tmp[0] + "X"
      elsif @message_tmp[0] == @message_tmp[1] && @message_tmp[0] == @message_tmp[2]
        @message &lt;&lt; @message_tmp[0] + "X"
        @message &lt;&lt; @message_tmp[1] + "Z"
        @message_tmp.delete_at(1)
      else
        @message &lt;&lt; @message_tmp[0] + @message_tmp[1]
        @message_tmp.delete_at(1)
      end
      @message_tmp.delete_at(0)
    end
    return @message
  end

  def encrypt_message(input_message)
    @encrypted_message = ''
    @message = formed_message(input_message).scan(/../)
    @message.each do |pair|
      @encrypted_message &lt;&lt; @cipher_square.encrypt_pair(pair)
    end
    return @encrypted_message
  end

  def decrypt_message(input_message)
    @decrypted_message = ''
    @message = formed_message(input_message).scan(/../)
    @message.each do |pair|
      @decrypted_message &lt;&lt; @cipher_square.decrypt_pair(pair)
    end
    return @decrypted_message
  end

end


playfair = Playfaire.new('Playfair Example.')
puts playfair.cipher_square.to_s
input_message = 'japan'
puts playfair.formed_message(input_message)
encrypted_message = playfair.encrypt_message(input_message)
puts encrypted_message
puts playfair.decrypt_message(encrypted_message)
