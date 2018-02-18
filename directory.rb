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
  puts 'To finish, just hit return x5'

  puts 'Please enter the names of the students'
  #  create an empty array
  # students = []
  # gets the first name
  name = STDIN.gets.chomp

  puts "Is '#{name}' correct? Y/N"
  response = STDIN.gets.chomp

  while response == 'N' || response == 'n' || response == ''
    puts 'Please enter the name of the students'
    name = STDIN.gets.chomp
    puts "Is '#{name}' correct? Y/N"
    response = gets.chomp
  end
  puts 'Now enter the cohort'
  cohort = STDIN.gets.chomp.to_s
  cohort = 'January'.to_s if name != '' && cohort == ''
  puts "Enter height of #{name} in cm"
  height = STDIN.gets.chomp
  puts "Enter weight of #{name} in kg"
  weight = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  until name.empty? && cohort.empty?
    # || height.empty? || weight.empty?
    # add the student hash to the array
    add_to_students(name, cohort, height, weight)
    if @students.count > 1
      puts "Now we have #{@students.count} students"
    elsif @students.count == 1
      puts "Now we have #{@students.count} student"
    end
    puts 'Enter another student name'
    # get another name from the user
    name = STDIN.gets.chomp
    puts 'Now enter the cohort'
    cohort = STDIN.gets.chomp.to_s
    puts "Enter height of #{name}"
    height = STDIN.gets.chomp
    puts "Enter weight of #{name}"
    weight = STDIN.gets.chomp
  end
  # return the array of students
  @students
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
  load_students
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts '1. Input the students'
  puts '2. Show the students'
  puts '3. Save the list to students.csv'
  puts '4. Load the list from students.csv'
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
  when '3'
    save_students
  when '4'
    load_students
  when '9'
    exit
  else
    puts 'I dont know what you mean, try again'
  end
end

def save_students
  # open the file for writing
  file = File.open('students.csv', 'w')
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:height], student[:weight]]
    csv_line = student_data.join(',')
    file.puts csv_line
  end
  file.close
end

def load_students(_filename = 'students.csv')
  puts 'What is the filename called'
  response = STDIN.gets.chomp
  file = File.open(response.to_s, 'r')
  file.readlines.each do |line|
    name, cohort, height, weight = line.chomp.split(',')
    add_to_students(name, cohort, height, weight)
  end
  file.close
  puts 'File was succesfully loaded'
end

def try_load_students
  _filename = ARGV.first # 1st argument from command line
  return if _filename.nil? # if it exists
  if File.exist?(_filename)
    load_students(_filename)
    puts "Loaded #{@students.count} from #{_filename}"
  else # if it doesnt exist
    puts "Sorry, #{_filename} doesn't exist."
    exit # quit the program
  end
end

def add_to_students(name, cohort, height, weight)
  @students << { name: name, cohort: cohort.to_s, height: height, weight: weight }
end

try_load_students
interactive_menu
