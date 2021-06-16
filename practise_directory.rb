students_array = [
  {name: "Dr. Hannibal Lecter", cohort: :april, colour: "bloodred"},
  {name: "Darth Vader", cohort: :november, colour: "black"},
  {name: "Nurse Ratched", cohort: :april, colour: "white"},
  {name: "Michael Corleone", cohort: :november, colour: "gray"},
  {name: "Alex DeLarge", cohort: :november, colour: "white"},
  {name: "The Wicked Witch of the West", cohort: :november, colour: "green" },
  {name: "Terminator", cohort: :november, colour: "black"},
  {name: "Freddy Krueger", cohort: :november, colour: "red"},
  {name: "The Joker", cohort: :november, colour: "purple"},
  {name: "Joffrey Baratheon", cohort: :november, colour: "gold"},
  {name: "Norman Bates", cohort: :november, colour: "blue"},  
  ]
  
students = []
# user input to create student body
def input_students(students)
  while true do
    puts "Please enter the name of the student"
    puts "To finish, just hit return twice"
    name = gets.delete("\n").capitalize
    if name.empty?
      break
    else
      puts "Please enter the student cohort"
      cohort = gets.chomp.to_sym
      if cohort.empty? 
        cohort = :none
      end
      students << {name: name, cohort: cohort}
    end
  end
  return students
end

def fix_typo(students)
  puts "Please enter the number of the student you would like to change"
  student_n = gets.chomp.to_i
  puts "Please enter the name of the student"
      name = gets.chomp.capitalize
  puts "Please enter the student cohort"
      cohort = gets.chomp.to_sym
  index = student_n - 1
  students[index] = {name: name, cohort: cohort}
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

def print_specific_inital(students)
  puts "Please enter a letter to see students with that first initial."
  starting_letter = gets.chomp.upcase
  students.each_with_index do |student, index|
    if student[:name][0] == starting_letter
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(50)
    end
  end
end

def print_short_names(students)
  students.each_with_index do |student, index|
    if student[:name].size() <= 12
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(50)
    end
  end
end

def print_students_colour(students)
  students.each_with_index do |student, index|
  puts "#{index + 1}. #{student[:name]}'s favourite colour is #{student[:colour]}".center(50)
  end
end

def print_by_cohort(students)
  sorted_by_cohort = {}
  students.each { |student|
    cohort = student[:cohort]
    if sorted_by_cohort[cohort] == nil
      sorted_by_cohort[cohort] = []
    end
    sorted_by_cohort[cohort].push(student[:name])
  }
  sorted_by_cohort.each do |cohort, names|
    puts cohort.capitalize
    puts "----------------"
    puts names
    puts "----------------"
  end
  
end

def print_all_students(students)
  n = 0
  while n < students.count() do
  puts "#{n + 1}. #{students[n][:name]} (#{students[n][:cohort]} cohort)".center(50)
  n += 1
  end
end

def print_footer(students)
  if students.count != 1
    puts "Overall, we have #{students.count} great students"
  else
    puts "We have 1 great student"
  end
end

# this is helpful for switching to user input
# current_students = input_students(students)

 input_students(students)
# print_header
# print_specific_inital(current_students)
# print_short_names(current_students)
# print_students_colour(current_students)
# print_all_students(current_students)
# fix_typo(current_students)
# print_all_students(current_students)
# print_footer(current_students)
#print_by_cohort(students_array)