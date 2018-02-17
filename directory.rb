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
  puts 'To finish, just hit return x5'
  #  create an empty array
  students = []
  # gets the first name
  name = gets.chomp

  puts "Is '#{name}' correct? Y/N"
  response = gets.chomp

  while response == 'N' || response == 'n'
    puts 'Please enter the name of the students'
    name = gets.chomp
    puts "Is '#{name}' correct? Y/N"
    response = gets.chomp
  end
  puts 'Now enter the cohort'
  cohort = gets.chomp.to_s
  cohort = 'January'.to_s if name != '' && cohort == ''
  puts "Enter height of #{name} in cm"
  height = gets.chomp
  puts "Enter weight of #{name} in kg"
  weight = gets.chomp
  # while the name is not empty, repeat this code
  until name.empty? && cohort.empty?
    # || height.empty? || weight.empty?
    # add the student hash to the array
    students << { name: name, cohort: cohort.to_s, height: height, weight: weight }
    if student.count > 1
      puts "Now we have #{students.count} students"
    elsif student.count == 1
      puts  "Now we have #{students.count} student"

    puts 'Enter another student name'
    # get another name from the user
    name = gets.chomp
    puts 'Now enter the cohort'
    cohort = gets.chomp.to_s
    puts "Enter height of #{name}"
    height = gets.chomp
    puts "Enter weight of #{name}"
    weight = gets.chomp
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
      puts "#{student[:name]} (#{student[:cohort]} cohort) (#{student[:height]}cm) (#{student[:weight]}kg)"
    end
  end
end

def filter_by_length(students)
  puts 'List of student names under 12 characters'.center(15, ' ')
  puts
  students.select do |student|
    if student[:name].length <= 12
      puts "#{student[:name]} (#{student[:cohort]} cohort) (#{student[:height]}cm) (#{student[:weight]}kg)"
    end
  end
end

def print_by_cohort(students)
  puts 'Please enter cohort to list'
  cohort_answer = gets.chomp

  students.select do |student|
    if student[:cohort].to_s == cohort_answer
      puts "#{student[:name]} (#{student[:cohort]} cohort) (#{student[:height]}cm) (#{student[:weight]}kg)"
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

def interactive_menu
  students = []
  loop do
    # 1. Print te menu and ask the user what to do
    puts '1. Input the students'
    puts '2. Show the students'
    puts '9. Exit'
    # 9 because we'll be adding more items
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when '1'
      student = input_students
    when '2'
      print_header
      print(students)
      print_footer(students)
    when '9'
      exit
    else
      puts 'I dont know what you meant, try again'
    end
  end
end



# nothing happens until we call the methods
interactive_menu
# students = input_students
# print_header
# filter_by_length(students)
# filter_students_name(students)
# print(students)
# print_by_cohort(students)
# print_footer(students)
