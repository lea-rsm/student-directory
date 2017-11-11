def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return five time"

  #create empty array
  students = []

  #get the first name
  name = gets.chomp.to_s

  puts "Please enter their cohort"
  cohort = gets.chomp.to_s
  # puts "Enter their hobbies"
  # #while the name is not empty repeat this code
  # hobbies = gets.chomp
  # puts "Enter their country of birth"
  #
  # country = gets.chomp
  # puts "Enter their height"
  # height = gets.chomp


#for it to be applicable to the first student.
  if name.nil?
    name = "Default"
  end
  if cohort.nil?
     cohort = "november"
  end

    puts "Enter 1 to change the name, 2 to change the cohort or 3 to continue"
      answer = gets.chomp.to_i
      if  answer == 2
        puts "Type the cohort again"
        cohort = gets.chomp

      elsif answer == 1
        puts "Type again the name"
        name = gets.chomp

        else
        puts "All good then!"
      end


  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    #get another name from user
    name = gets.chomp.to_s
    cohort = gets.chomp.to_s
    # hobbies = gets.chomp
    # country = gets.chomp
    # height = gets.chomp

    # so it loops for each student

    if name.nil?
      name = "Default"
    end
    if cohort.nil?
      cohort = "november"
    end

    if !name.empty?
      puts "Enter 1 to change the name, 2 to change the cohort or 3 to continue"
      answer = gets.chomp.to_i
      if  answer == 2
        puts "Type the cohort again"
        cohort = gets.chomp

      elsif answer == 1
        puts "Type again the name"
        name = gets.chomp

        else
        puts "All good then!"
      end
    end
  end


#return the array of students
students
end


def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end


def print(students)
  puts "Enter the cohort you want to display"
  selected_cohort = gets.chomp

  line_width = 50

  #we create an empty array, and with select that puts all the student cohort equal to
  #the user's input in the empty array. and returns it.
  selected_student = students.select do |student|
    student[:cohort] == selected_cohort
  end

  selected_student.each_with_index do |student, index|
    puts "#{index + 1} - #{student[:name]} (#{student[:cohort]} cohort)"
  end
  # i = 0 #initialize and everytime you "enter" your loop, it's i + 1
  # while i < students.length #while i is inferior at my array's length do the following code:
  #
  # puts "#{i + 1}. #{students[i][:name]} - #{students[i][:cohort]} - #{students[i][:hobbies]} - #{students[i][:country_of_birth]} - #{students[i][:height]}".center(line_width)
  #
  #   i += 1
  # end



end





def print_footer(students)
  puts ""
  puts "However, Overall, we have #{students.count} great students"

end


students = input_students

print_header
print(students)

print_footer(students)


# DEMANDER comment faire pour ne pas avoir a écrire chaque #{student[:name]}, #{student[:cohort] etc}
