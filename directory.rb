def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return five time"

  #create empty array
  students = []

  #get the first name
  name = gets.chomp
  puts "Enter their hobbies"
  #while the name is not empty repeat this code
  hobbies = gets.chomp
  puts "Enter their country of birth"

  country = gets.chomp
  puts "Enter their height"
  height = gets.chomp

  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november, hobbies: hobbies, country_of_birth: country, height: height}
    puts "Now we have #{students.count} students"
    #get another name from user
    name = gets.chomp
    hobbies = gets.chomp
    country = gets.chomp
    height = gets.chomp

  end

#return the array of students
students
end


def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  # students.each_with_index do |student, index|
  #   puts "#{index + 1} - #{student[:name]} (#{student[:cohort]} cohort)"
  # end
  i = 0 #initialize and everytime you "enter" your loop, it's i + 1
  while i < students.length #while i is inferior at my array's length do the following code:

  puts "#{i + 1}. #{students[i][:name]} - #{students[i][:cohort]} - #{students[i][:hobbies]} - #{students[i][:country_of_birth]} - #{students[i][:height]}."

    i += 1
  end

end





def print_footer(students)
  puts "Overall, we have #{students.count} great students"

end


students = input_students

print_header
print(students)

print_footer(students)


# DEMANDER comment faire pour ne pas avoir a écrire chaque #{student[:name]}, #{student[:cohort] etc}
