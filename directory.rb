
# array of all students
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates",  
  ]
# prints a list of all students
puts "The students of Villains Academy"
puts "--------------------------------"
students.each do |student|
  puts student
end

# prints the number of students
puts "Overall, we have #{students.count} great students"