# lets put all students into an array
students = [
  { name: 'Dr. Hannibal Lecter', cohort: :november, height: '183cm', weight: '91kg' },
  { name: 'Darth Vader', cohort: :november, height: '181cm', weight: '94kg' },
  { name: 'Nurse Ratched', cohort: :november, height: '163cm', weight: '71kg' },
  { name: 'Michael Corleone', cohort: :november, height: '173cm', weight: '101kg' },
  { name: 'Alex DeLarge', cohort: :november, height: '153cm', weight: '81kg' },
  { name: 'The Wicked Witch of the West', cohort: :november, height: '197cm', weight: '98kg' },
  { name: 'Terminator', cohort: :november, height: '189cm', weight: '85kg' },
  { name: 'Freddy Krueger', cohort: :november, height: '190cm', weight: '95kg' },
  { name: 'The Joker', cohort: :november, height: '195cm', weight: '97kg' },
  { name: 'Joffrey Baratheon', cohort: :november, height: '190cm', weight: '98kg' },
  { name: 'Norman Bates', cohort: :november, height: '189cm', weight: '98kg' }
]
def print_header
  puts 'The students of Villains Academy'
  puts '-------------'
end

def print(students)
  students.each_with_index do |student, i|
    puts " #{i + 1}) #{student[:name]} (#{student[:cohort]} cohort)
    (#{student[:height]}) (#{student[:weight]})"
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
      puts "#{student[:name]} (#{student[:cohort]} cohort) (#{student[:height]}) (#{student[:weight]})"
    end
  end
end

def filter_by_length(students)
  students.select do |student|
    if student[:name].length <= 12
      puts "#{student[:name]} (#{student[:cohort]} cohort) (#{student[:height]}) (#{student[:weight]})"
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
