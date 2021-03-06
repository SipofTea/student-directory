require 'csv'

@students = []

# The following methods deal with printing the student list.
def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

def print_student_list
  @students.each do |student|
  puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def show_students
  print_header
  print_student_list
  print_footer
end

# The following methods deal with adding new students to the student list.
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  input_student_loop
  puts "Now we have #{@students.count} students"
end

def input_student_loop
  name = STDIN.gets.chomp
  if name.empty?
    return
  end
  add_student(name, :november)
  puts "Student #{name} was added"
  input_student_loop
end

def add_student(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}  
end

# The following methods deal with file creation.
def ask_for_file
  puts "Please enter a filename"
  filename = gets.chomp
  if File.exist?(filename)
    return filename
  else
    puts "This file could not be found"
    create_file
    ask_for_file
  end
end

def create_file
  puts "Create file to save student list (students.csv)? (Y/N)"
    user_input = gets.chomp.capitalize
    if user_input == "Y"
      File.new("students.csv", "w+")
    elsif user_input == "N"
      puts "This program requires a save file to save the student list permanently."
    end
end

# The following methods deal with saving and loading students to and from a file.
def save_students
  filename = ask_for_file
  CSV.open(filename, "w") do |file|
    @students.each do |student|
      file << [student[:name], student[:cohort]]
    end
  end
  puts "#{@students.count} students have been saved to #{filename}"
end

def load_students(filename)
  CSV.foreach(filename) do |row|
    name, cohort = row[0], row[1]
    add_student(name, cohort)
  end
  puts "Loaded #{@students.count} students from #{filename}"
end

def load_students_startup
  filename = ARGV.first
  if filename.nil?
    if File.exist?("students.csv")
      load_students("students.csv")
    else
      create_file
    end
  elsif File.exist?(filename)
    load_students(filename)
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def load_while_running
  filename = ask_for_file
  load_students(filename)
end

# The following methods deal with the main selection menu.
def print_menu
  puts "Please enter a number"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list of students to an existing file"
  puts "4. Load the list from an existing file"
  puts "9. Exit"
end

def excecute_choice_process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_while_running
    when "9"
      exit
    else
      puts "Please choose a number from the menu"
  end
end

def interactive_menu
  loop do
    print_menu
    excecute_choice_process(STDIN.gets.chomp)
  end  
end

# These methods are executed on startup.
load_students_startup
interactive_menu