  @students = []

def interactive_menu

  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

  #2.read the input and save it into a variable
    #selection = gets.chomp

def process(selection)
  #3.do what the user asked
    case selection
    when "1"
      #input the students
      puts "Inputting students."
      @students = input_students
    when "2"
      puts "Showing students filtered by cohort."
      show_students_cohort
    when "3"
      puts "Showing students."
      #show the students
      show_students
      puts
    when "9"
      puts "Exiting"
      exit #will quit the program
    when "4"
      save_students

    when "5"
      load_students
      puts "Loaded!"
    else
      "Try again please."
    end
    end


def print_menu
  #1.print the menu and ask the user what to do
  puts "Type 1 for Input the students"
  puts "Type 2 for Show the students by cohort"
  puts "Type 3 for Show the students"
  puts "Type 4 for Save the list of students"
  puts "Type 5 for Load the list for students"
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
  puts "To finish, just hit return twice"
  #get the first name
  @name = STDIN.gets.strip.to_s

  puts "Please enter their cohort"
  #we can also use delete method
  @cohort = STDIN.gets.delete("\n").to_s
  # puts "Enter their hobbies"
  # #while the name is not empty repeat this code
  # hobbies = gets.chomp
  # puts "Enter their country of birth"
  #
  # country = gets.chomp
  # puts "Enter their height"
  # height = gets.chomp


#for it to be applicable to the first student.
defaultname
#if name.nil?
  #name = "Default"
#end
defaultcohort

#if cohort.nil?
  #cohort = "november"
#end
  correction
  while !@name.empty? do
    #add the student hash to the array
    student_infos(name, cohort) #method created down below
    if @students.count == 1
      puts "Now we have only #{@students.count} student."
    else
      puts "Now we have #{@students.count} students."
    end
    #get another name from user
    @name = STDIN.gets.chomp.to_s
    @cohort = STDIN.gets.chomp.to_s
    # hobbies = gets.chomp
    # country = gets.chomp
    # height = gets.chomp

    # so it loops for each student
    defaultname
    #if name.nil?
      #name = "Default"
    #end
    defaultcohort
    #if cohort.nil?
      #cohort = "november"
    #end

    if !@name.empty?
      correction
    end
  end


#return the array of students
@students
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
    selected_cohort = STDIN.gets.chomp

    line_width = 50

    #we create an empty array, and with select that puts all the student cohort equal to
    #the user's input in the empty array. and returns it.
    selected_student = @students.select do |student|
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
def save_students
  #open file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name]], [student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line #we call it on a file so it write on the file not the screen
  end
  file.close
  puts "Saved!"
end
def load_students(filename = "students.csv") #default file if not any
  file = File.open(filename, "r")
  file.readlines.each do |line| #read all the lines and iterate over it
    name, cohort = line.chomp.split(',') #parallele assignment
    student_infos(name, cohort)

  end
  file.close
end



def try_load_students
  puts "What is the name of the file you want to load from?"
  puts "If no filename, the default file is student.csv"
  filename = STDIN.gets.chomp
  #filename = ARGV.first #first argument from command line
  if filename.nil?
    puts "What is the name you want to give to the file?"
    load_students
    puts "Loaded #{@students.count} from default"
   #get out of the method if it isnt given

  elsif File.exist?(filename) #if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}."
  else #if it doesnt exists
    puts "Sorry, #{filename} doesn't exist.."
    exit #quit the program
  end
end

def student_infos(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end
def correction
  puts "Enter 1 to change the name, 2 to change the cohort or press return to continue"
    answer = STDIN.gets.chomp.to_i
    if  answer == 2
      puts "Type the cohort again"
      @cohort = STDIN.gets.chomp

    elsif answer == 1
      puts "Type again the name"
      @name = STDIN.gets.chomp

      else
      puts "All good then! An other one? otherwise press return twice."
    end
  end
  def defaultname
    if @name.nil?
      @name = "Default"
    end
  end
  def defaultcohort
    if @cohort.nil?
      @cohort = "november"
    end
  end



try_load_students
interactive_menu



# DEMANDER comment faire pour ne pas avoir a écrire chaque #{student[:name]}, #{student[:cohort] etc}
