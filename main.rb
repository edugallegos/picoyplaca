require "./plate.rb"
require 'date'

puts "Enter your plate license number e.g., PBA-1405" 

validator = false
until validator do
	plate_aux = gets.chomp
	myPlate = Plate.new(plate_aux)
	if myPlate.valid
		validator = true
	else
		puts "Bad Plate License Number!! Try again !! e.g. XBA-0985"
	end
end


puts "Enter the date e.g., 14/05/2016"
validator = false
until validator do
	date = gets.chomp
	if date.match(/^\d{2}\/\d{2}\/\d{4}$/)
		date_aux = date.split("/")
		if Date.valid_date?(date_aux[2].to_i,date_aux[1].to_i,date_aux[0].to_i)
			validator = true
		else
			puts "Invalid Date!! Try again !! e.g. 15/09/2015"
		end
	else
		puts "Bad Format!! Try again !! e.g. 15/09/2015"
	end
end

puts "Enter a time e.g. 17:50"
validator = false
until validator do
	time = gets.chomp
	if time.match(/^([01]?[0-9]|2[0-3])\:[0-5][0-9]$/)
		validator = true
	else
		puts "Bad Time!! Try again !! e.g. 14:59"
	end
end
time_aux = time.split(":")
date_object = DateTime.new(date_aux[2].to_i,date_aux[1].to_i,date_aux[0].to_i,time_aux[0].to_i,time_aux[1].to_i)

if myPlate.canRoad(date_object)
	puts "Yeahh!! The car with the plate license number #{plate_aux} can be on the road at #{date} #{time}"
else
	puts "Nooo!! The car with the plate license number #{plate_aux} can't be on the road at #{date} #{time}"
end