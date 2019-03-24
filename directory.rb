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

def print_header
	puts "The students of Villains Academy"
	puts "-------------"
end
def print(students)
	students.each do |student|
		puts "#{student[:name]} (#{student[:cohort]} cohort)"
	end
end
def print_footer(names)
	puts "Overall, we have #{names.count} great students"
end

def input_students
	puts "Please enter the name of the students"
	puts "To finish, just hit return twice"
	# creat an empty array
	students = []
	name = gets.chomp
	while !name.empty? do
		# add the student hash to the array
		students << {name: name, cohort: :november}
		puts "Now we have #{students.count} students"
		# get another name from the user
		name = gets.chomp
	end
	# return the array of students
	students
end

students = input_students
print_header
print(students)
print_footer(students)