# lets put all students into an array
students = [
  { name: 'Dr. Hannibal Lecter', cohort: :november },
  { name: 'Darth Vader', cohort: :november },
  { name: 'Nurse Ratched', cohort: :november },
  { name: 'Michael Corleone', cohort: :november },
  { name: 'Alex DeLarge', cohort: :november },
  { name: 'The Wicked Witch of the West', cohort: :november },
  { name: 'Terminator', cohort: :november },
  { name: 'Freddy Krueger', cohort: :november },
  { name: 'The Joker', cohort: :november },
  { name: 'Joffrey Baratheon', cohort: :november },
  { name: 'Norman Bates', cohort: :november }
]
def print_header
  puts 'The students of Villains Academy'
  puts '-------------'
end

def print(students)
  students.each_with_index do |student, i|
    puts " #{i + 1}) #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def input_students
  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'
  #  create an empty array
  students = []
  # gets the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  until name.empty?
    # add the student hash to the array
    students << { name: name, cohort: :november }
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def filter_students_name(students)
  puts 'Please enter the letter you want to filter the name by'
  filter_letter = gets.chomp
  puts

  students.select do |student|
    if student[:name].start_with?(filter_letter.upcase) || student[:name].start_with?(filter_letter.downcase)
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def filter_by_length(students)
  students.select do |student|
    if student[:name].length <= 12
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def each(students)
  i = 0
  while i < students.length
    puts students[i]
    i += 1
  end
end
# nothing happens until we call the methods
students = input_students
print_header
filter_by_length(students)
# filter_students_name(students)
# print(students)
print_footer(students)
