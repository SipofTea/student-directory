students_array = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november},  
  ]

# print_header
# print(students_array)
# print_footer(students_array)

# user input to create student body
# def input_students
#   puts "Please enter the names of the students"
#   puts "To finish, just hit return twice"
  
#   students = []
  
#   name = gets.chomp
  
#   while !name.empty? do
#     students << {name: name, cohort: :november}
#     puts "Now we have #{students.count} students"
#     name = gets.chomp
#   end
  
def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

def print(students)
  students.each_with_index do |student|
  puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

current_students = students_array

print_header
print(current_students)
print_footer(current_students)

# Testing config