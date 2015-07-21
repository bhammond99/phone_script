# require 'rubygems'
# require 'sqlite3'

# db = SQLite3::Database.new('phonebook.sqlite')
# db.results_as_hash = true
# results = db.execute("SELECT * FROM Phonebook")

# puts results[3].class

# puts "#{results[3]['person_fname']} #{results[3]['person_lname']}'s phone number is #{results[3]['person_phnumber']}"
# puts
# puts

# puts "What is #{results[3]['person_fname']}'s last name?"
# print ">> "
# name = gets.chomp
# if name == "#{results[3]['person_lname']}"
# 	puts "Correct!" 
# 	puts "#{results[3]['person_fname']}'s full name is #{results[3]['person_fname']} #{results[3]['person_lname']}"
# else
# puts "incorrect!"
# end	


def name_game(num)
	require 'timeout'
	require 'rubygems'
	require 'sqlite3'
	begin	
	status = Timeout::timeout(60) {
		db = SQLite3::Database.new('phonebook.sqlite')
		db.results_as_hash = true
		results = db.execute("SELECT * FROM Phonebook")

		puts "#{results[num]['person_fname']} #{results[num]['person_lname']}'s phone number is #{results[num]['person_phnumber']}"
		puts
		puts "What is #{results[num]['person_fname']}'s last name?"
		print ">> "
		name = gets.chomp
		if name == "#{results[num]['person_lname']}"
			puts "Correct!"
			puts 
			puts "#{results[num]['person_fname']}'s full name is #{results[num]['person_fname']} #{results[num]['person_lname']}"
			puts "=" * 50	
		else
		puts "incorrect!"
		puts "=" * 50
		end	
			} 
			rescue Timeout::Error
				puts "Your time is up!"
				puts "=" * 50		
	end
end	


def name_roll
[0,1,2,3,4,5,6,7,8,9].shuffle.each do |num|
	name_game(num)
	end
end

def new_table
	require 'sqlite3'

	begin
		db = SQLite3::Database.open "phonebook.sqlite"
		db.execute "CREATE TABLE IF NOT EXISTS Emails(Id INTEGER PRIMARY KEY, Firstname TEXT, Lastname TEXT, Email TEXT)"
		db.execute "INSERT INTO Emails VALUES(10,'Richard', 'Smith', 'richierich34@gmail.com')"
	rescue SQLite3::Exception => e 
		puts "Exeption occurred"
		puts e 

	ensure db.close if db	
	end	
end	


def atlanta
	require 'rubygems'
	require 'sqlite3'
		db = SQLite3::Database.new('phonebook.sqlite')
		results = db.execute("SELECT * FROM Phonebook where person_state LIKE 'A%'")

		results.each { |row| puts row.join(', ')}
end	

def chicago
	require 'rubygems'
	require 'sqlite3'
		db = SQLite3::Database.new('phonebook.sqlite')
		results = db.execute("SELECT * FROM Phonebook where person_state LIKE 'C%'")

		results.each { |row| puts row.join(', ')}
end	

def seven
	require 'rubygems'
	require 'sqlite3'
		db = SQLite3::Database.new('phonebook.sqlite')
		results = db.execute("SELECT * FROM Phonebook where person_phnumber LIKE '7%'")

		results.each { |row| puts row.join(', ')}
end	

chicago
puts "=" * 50
atlanta
puts "=" * 50
seven
puts "=" * 50



