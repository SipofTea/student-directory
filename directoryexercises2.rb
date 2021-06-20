@students = []

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

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  input_student_loop
end

def input_student_loop
  name = STDIN.gets.chomp
  if name.empty?
    return
  end
  add_student(name, :november)
  puts "Now we have #{@students.count} students"
  input_student_loop
end

def add_student(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}  
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list of students to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_entry = student_data.join(",")
    file.puts csv_entry
  end
  file.close
end

def load_students(filename)
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    add_student(name, cohort)
  end
  puts "Loaded #{@students.count} from #{filename}" 
  file.close
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    load_students("students.csv")
  elsif File.exist?(filename)
    load_students(filename)
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
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
      load_students
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

try_load_students
interactive_menu