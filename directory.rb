=begin
# Let's put all students into an array
students = [
	{name:"Dr. Hannibal Lecter", cohort: :november},
	{name: "Darth Vader", cohort: :november},
	{name: "Nurse Ratched", cohort: :november},
	{name: "Michael Corleone", cohort: :november},
	{name: "Alex DeLarge", cohort: :november},
	{name: "The Wicked Witch of the West", cohort: :november},
	{name: "Terminator", cohort: :november},
	{name: "Freddy Krueger", cohort: :november},
	{name: "The Joker", cohort: :november},
	{name: "Jofferey Bratheon", cohort: :november},
	{name: "Normn Bates", cohort: :november}
]
=end

@students = [] # an empty array acessible to all methods

def interactive_menu
	loop do 
		print_menu
		process(STDIN.gets.chomp)
	end
end

def print_menu
		puts "1. Input the students"
		puts "2. Show the students"
		puts "3. Save the list to students.csv"
		puts "4. Load the list from student.csv"
		puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
			print_header
			print_student_list
			print_footer
end

def process(selection)
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
			puts "I don't know what you meant, try again"
		end
end


def print_header
	puts "The students of Villains Academy"
	puts "-------------"
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
	puts "Please enter the name of the students"
	puts "To finish, just hit return twice"
	name = STDIN.gets.chomp
	while !name.empty? do
		# add the student hash to the array
		@students << {name: name, cohort: :november}
		puts "Now we have #{@students.count} students"
		# get another name from the user
		name = STDIN.gets.chomp
	end
end

def save_students
	# open the file for writing
	file = File.open("students.csv", "w")
	# iterate over the array of students
	@students.each do |student|
		student_data = [student[:name], student[:cohort]]
		csv_line = student_data.join(",")
		file.puts csv_line
	end
	file.close
end

def load_students(fliename= "students.csv")
	file = File.open("students.csv", "r")
	file.readlines.each do |line|
		name, cohort = line.chomp.split(',')
		@students << {name: name, cohort: cohort.to_sym}
	end
	file.close
end

def try_load_students
	filename = ARGV.first # first argument from the command line
	return if filename.nil? # get out of the method if it isn't given
	if File.exits?(filename) # if it exists
		load_students(filename)
		puts "Loaded #{@students.count} from #{filename}"
	else # if it doesn't exist
		puts "Sorry, #{filenmae} doesn't exist."
		exit # quit the program
	end
end

try_load_students
interactive_menu