WEEKDAYS = {  sunday: 0,    monday: 1,    tuesday: 2,
              wednesday: 3, thursday: 4,  friday: 5,  saturday: 6 }

# Calculate days on which each event occurs, based on the configuration info
class Scheduler
  def self.add_weeks(the_date, number)
    the_date.to_date + Integer(number) * 7
  end

  def setup_from_args(start: nil, weekdays: nil, number: nil, skips: [])
    if start.nil?
      @start = nil
      return
    end
    convert_and_verify_arguments(start, weekdays, number, skips)
    @weekdays.sort!
    recalc_event_map
  end

  def setup_from_schedule_def(sdef)
    if sdef.nil?
      @start = nil
      return
    end
    setup_from_args(start: sdef.first_day, weekdays: sdef.weekdays,
                    number: sdef.number, skips: sdef.skips)
  end

  def event_date_by_index(ind)
    null? ? nil : @event_dates[ind]
  end

  def null?
    @start_date.nil?
  end

  private

  def recalc_event_map
    return if self.null?
    @event_dates = []
    wkdy_of_start = @start_date.cwday
    wkday_index = @weekdays.find_index(wkdy_of_start)
    curr_event_date = @start_date
    @number.times do
      |i|
      @event_dates << curr_event_date unless @skips.include? curr_event_date
      if @weekdays.length == 1
        curr_event_date += 7
      elsif wkday_index < @weekdays.length-1
        wkday_index += 1
        curr_event_date += @weekdays[wkday_index] - @weekdays[wkday_index-1]
      elsif wkday_index == @weekdays.length-1
        wkday_index = 0 # wrap
        curr_event_date += 7 + @weekdays.first - @weekdays.last
      end
    end
  end

  def convert_and_verify_arguments(start, weekdays, number, skips)
    @number = number + skips.length
    @start_date = string_to_date(start)
    @skips = skips.map { |d| string_to_date(d) } rescue raise(ArgumentError, "Scheduler: Invalid skip date")

    raise ArgumentError, "Scheduler: invalid weekdays" unless weekdays.all? { |wd| WEEKDAYS.include? wd } 

    @weekdays = weekdays.map { |wd| WEEKDAYS[wd]}
    raise ArgumentError, "Scheduler: Start date is not on one of the weekdays" unless @weekdays.include? @start_date.cwday
    raise ArgumentError, "Scheduler: Skip date is not on a valid weekday" if !@skips.reduce(true) { |accum, skip| accum && @weekdays.include?(skip.cwday) }
  end

private

  def string_to_date(string_date)
    Date.strptime(string_date, "%b-%d-%Y") rescue  fail "string to date in scheduler.rb"

  end
end
