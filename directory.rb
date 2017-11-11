  @students = []

def interactive_menu

  loop do
    print_menu
    process(gets.chomp)
  end
end

  #2.read the input and save it into a variable
    #selection = gets.chomp

def process(selection)
  #3.do what the user asked
    case selection
    when "1"
      #input the students
      @students = input_students
    when "2"
      show_students_cohort
    when "3"
      #show the students
      show_students
    when "9"
      exit #will quit the program
    else
      "Try again please."
    end
    end


def print_menu
  #1.print the menu and ask the user what to do
  puts "Type 1 for Input the students"
  puts "Type 2 for Show the students by cohort"
  puts "Type 3 for Show the students"
  puts "Type 9 for Exit"
end

def show_students_cohort
  print_header
  print_by_cohort
  print_footer
  end
def show_students
  print_header
  print_student_list
  print_footer

end


def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return five time"



  #get the first name
  name = gets.strip.to_s

  puts "Please enter their cohort"
  #we can also use delete method
  cohort = gets.delete("\n").to_s
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
    @students << {name: name, cohort: cohort}
    if students.count == 1
    puts "Now we have only #{students.count} student."
    else
    puts "Now we have #{students.count} students."
    end
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

def print_student_list
  if @students.length <= 1
  puts "No students!"
  end
  @students.each_with_index do |student, index|
      puts "#{index + 1} - #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_by_cohort
  if @students.length >= 1
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
  else
    puts "No students!"
  end
  # i = 0 #initialize and everytime you "enter" your loop, it's i + 1
  # while i < students.length #while i is inferior at my array's length do the following code:
  #
  # puts "#{i + 1}. #{students[i][:name]} - #{students[i][:cohort]} - #{students[i][:hobbies]} - #{students[i][:country_of_birth]} - #{students[i][:height]}".center(line_width)
  #
  #   i += 1
  # end



end


def print_footer
  puts ""
  puts "However, Overall, we have #{@students.count} great students"

end

interactive_menu



# DEMANDER comment faire pour ne pas avoir a écrire chaque #{student[:name]}, #{student[:cohort] etc}
