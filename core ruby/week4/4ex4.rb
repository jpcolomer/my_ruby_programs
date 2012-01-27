file_A = File.open("A.txt","r")
file_B = File.open("B.txt","r")

file_tmp_A = file_A.read
file_tmp_B = file_B.read

file_A.close
file_B.close

file_A = File.open("A.txt","w")
file_A.puts file_tmp_B
file_A.close

file_B = File.open("B.txt", "w")
file_B.puts file_tmp_A
file_B.close
