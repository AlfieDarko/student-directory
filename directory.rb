# lets put all students into an array
@students = []

def print_header
  puts 'The students of Villains Academy'
  puts '-------------'
end

def print_students_list
  @students.each_with_index do |student, i|
    puts " #{i + 1}) #{student[:name]} (#{student[:cohort]} cohort)
    (#{student[:height]}cm) (#{student[:weight]}kg)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
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

  while response == 'N' || response == 'n' || response == ''
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
    @students << { name: name, cohort: cohort.to_s, height: height, weight: weight }
    if @students.count > 1
      puts "Now we have #{students.count} students"
    elsif students.count == 1
      puts "Now we have #{students.count} student"
    end
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

def filter_students_name
  puts 'Please enter the letter you want to filter the name by'
  filter_letter = gets.chomp
  puts

  @students.select do |student|
    if student[:name].start_with?(filter_letter.upcase) || student[:name].start_with?(filter_letter.downcase)
      puts "#{student[:name]} (#{student[:cohort]} cohort) (#{student[:height]}cm) (#{student[:weight]}kg)"
    end
  end
end

def filter_by_length(_students)
  puts 'List of student names under 12 characters'.center(15, ' ')
  puts
  @students.select do |student|
    if student[:name].length <= 12
      puts "#{student[:name]} (#{student[:cohort]} cohort) (#{student[:height]}cm) (#{student[:weight]}kg)"
    end
  end
end

def print_by_cohort
  puts 'Please enter cohort to list'
  cohort_answer = gets.chomp

  @students.select do |student|
    if student[:cohort].to_s == cohort_answer
      puts "#{student[:name]} (#{student[:cohort]} cohort) (#{student[:height]}cm) (#{student[:weight]}kg)"
    end
  end
end

def each
  i = 0
  while i < @students.length
    puts @students[i]
    i += 1
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts '1. Input the students'
  puts '2. Show the students'
  puts '9. Exit' # 9 because we'll be adding more items
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when '1'
    input_students
  when '2'
    show_students
  when '9'
    exit
  else
    puts 'I dont know what you mean, try again'
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
