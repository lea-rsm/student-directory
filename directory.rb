student_count = 11

students = ["DR. Hannibal Lecter",
 "Darth Vader",
 "Nurse Ratched",
 "Micheal Corleone",
 "Alex DeLarge",
 "The Wicked Witch of the West",
 "Terminator",
 "Freddy Krueger",
 "The Joker",
 "Joffrey Baratheon",
 "Norman Bates"]

#then print
puts "The students of Villains Academy"
puts " -------------"
students.each do |student|
  puts student
end


#finally we print the total
print "Overall, we have #{students.count} great students!"
