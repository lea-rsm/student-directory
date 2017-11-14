#Quine program

scr = "\nputs \"scr = \" + scr.inspect + scr"
puts "scr = " + scr.inspect + scr

#or

puts File.read(__FILE__)
