File.open('3ex2.txt','r+') do |f|
  lines = ''
  while line = f.gets
    lines << line.gsub(/word/, "inserted word")
  end
  f.pos = 0
  f.puts lines
end
