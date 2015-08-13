# Define schedule scheme for a lecture series

class ScheduleDef
		attr_reader :first_day, :weekdays, :number, :skips, :start_time, :end_time

		def initialize(first_day: nil, weekdays: nil, number: nil,
									 skips: [], start_time: "12:15", end_time: "13:15")
			@first_day = first_day
			@weekdays = weekdays
			@number = number
			@skips = skips
			@start_time = start_time
			@end_time = end_time
		end

end
