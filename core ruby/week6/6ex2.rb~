=begin
Exercise2. Write a Ruby program that analyzes an MP3 file. Many MP3
files have a 128-byte data structure at the end called an ID3 tag. These 128 bytes are literally packed with information about the song: its name, the artist, which album it's from, and so on. You can parse this data structure by opening an MP3 file and doing a series of reads from a position near the end of the file. According to the ID3 standard, if you start from the 128th-to-last byte of an MP3 file and read three bytes, you should get the string TAG. If you don't, there's no ID3 tag for this MP3 file, and nothing to do. If there is an ID3 tag present, then the 30 bytes after TAG contain the name of the song, the 30 bytes after that contain the name of the artist, and so on. A sample song.mp3 file is available to test your program. Use Symbols, wherever possible.
=end

class Id3_tag
  attr_reader :id3_tag
  def initialize (mp3file)
    @id3_tag = Hash.new()
    @tags = {song: 30, artist: 30, album: 30, year: 4, comment: 28, zero_byte: 1, track: 1, genre: 1}
    @f = File.new(mp3file)
    @f.seek(-128, IO::SEEK_END)
    @header = @f.read(3)
    if @header == 'TAG'
      @tags.each do |tag, bytes|
        @id3_tag[tag] = @f.pos < @f.size ? @f.read(bytes) : nil
      end

      @id3_tag.each do |tag, value|
        instance_variable_set("@#{tag}",value)

        eigenclass = class<<self; self; end
        eigenclass.class_eval do
          attr_reader tag
        end
      end
    else
      raise ArgumentError.new("The mp3 file #{mp3file} doesn't have and ID3 tag")
    end
  end

end

tag = Id3_tag.new('song.mp3')
puts tag.song     #=> Dancing Shoes
puts tag.artist   #=> Cliff Richard and The Shadows
puts tag.album    #=> (SUMMER HOLIDAY  1963)
puts tag.comment  #=> #100%-Free-MP3s(Dalnet) Anni
