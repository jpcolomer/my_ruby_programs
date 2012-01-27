puts Dir.pwd
Dir.mkdir('tmp')
Dir.chdir('./tmp')
puts Dir.pwd
Dir.chdir('..')
Dir.delete('tmp')
