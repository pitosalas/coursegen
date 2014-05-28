# Define schedule scheme for a lecture series

class ScheduleDef
		attr_reader :first_day, :weekdays, :number, :skips

		def initialize first_day: nil, weekdays: nil, number: nil, skips: []
			@first_day = first_day
			@weekdays = weekdays
			@number = number
			@skips = skips
		end

end
