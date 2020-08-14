require_relative 'near_earth_objects'
require_relative 'table'
require 'date'

puts "________________________________________________________________________________________________________________________________"
puts "Welcome to NEO. Here you will find information about how many meteors, astroids, comets pass by the earth every day. \nEnter a date below to get a list of the objects that have passed by the earth on that day."
puts "Please enter a date in the following format YYYY-MM-DD."
print ">>"

date = gets.chomp
table = Table.new(date)

formated_date = DateTime.parse(date).strftime("%A %b %d, %Y")
puts "______________________________________________________________________________"
puts "On #{formated_date}, there were #{table.total_number_of_astroids} objects that almost collided with the earth."
puts "The largest of these was #{table.largest_astroid} ft. in diameter."
puts "\nHere is a list of objects with details:"
table.create_rows(table.astroid_list, table.column_data)
