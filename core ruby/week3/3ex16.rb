a = ["Magazine", "Sunday", "Jump"]
#puts a.sort
#puts a.sort { |s| s }
#puts a.sort { |l, r| l <=> r }
puts a.sort { |l, r| l.length <=>  r.length }
#puts a.sort_by { |s| s }
puts a.sort_by { |s| s.length }
