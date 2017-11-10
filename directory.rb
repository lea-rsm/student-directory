def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  #create empty array
  students = []

  #get the first name
  name = gets.chomp
  #while the name is not empty repeat this code

  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name from user
    name = gets.chomp
  end

#return the array of students
students
end


def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  puts "What letter do you want the names of students to start with?"
  answer = gets.chomp.downcase

    students.each_with_index do |student, index|

      if student[:name].downcase.start_with?(answer) && student[:name].length < 12
        puts "#{index + 1} - #{student[:name]} (#{student[:cohort]} cohort)"
      end

    end


end


def print_footer(students)
  puts "However, Overall, we have #{students.count} great students"

end


students = input_students

print_header
print(students)

print_footer(students)
