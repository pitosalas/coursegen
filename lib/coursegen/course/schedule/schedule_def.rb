# Define schedule scheme for a lecture series

class ScheduleDef
  attr_reader :first_day, :weekdays, :number, :skips, :start_time, :end_time, :start_times, :end_times

  def initialize(first_day: nil, weekdays: nil, number: nil,
                skips: [], start_time: nil, end_time: nil, start_times: [], end_times: [])
    @first_day = first_day
    @weekdays = weekdays
    @number = number
    @skips = skips
    @start_time = start_time
    @end_time = end_time
    @start_times = start_times
    @end_times = end_times
  end
end
