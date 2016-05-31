require 'date'

class Plate
	DAY_RULES = [[1,2],[3,4],[5,6],[7,8],[9,0]]
	TIME_RULES = [["07:00","09:30"],["16:00","19:30"]]
	def initialize(value)
		@value = value
	end

	attr_reader :value

	def valid
		return @value.match(/^[A-Z]{3}(-)\d{4}$/)
	end

	def canRoad(date)
		day = date.wday
		if day < 5
			last_digit = @value.split('').last.to_i
			if DAY_RULES[day-1].index(last_digit) != nil
				for item in TIME_RULES
					time1 = item[0].split(":")
					time2 = item[1].split(":")
					date_ref1 = DateTime.new(date.year,date.mon,date.mday,time1[0].to_i,time1[1].to_i)
					date_ref2 = DateTime.new(date.year,date.mon,date.mday,time2[0].to_i,time2[1].to_i)
					if(date > date_ref1 && date < date_ref2)
						return false
					end
				end
				return true
			else
				return true
			end
		else
			return true
		end
		
	end

end