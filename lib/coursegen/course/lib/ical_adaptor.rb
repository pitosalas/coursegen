require 'icalendar'

#file ical_adaptor.rb
class ICalAdaptor
  def initialize
    @cal = Icalendar::Calendar.new
  end

  def feed_begin
  end

  def feed_end
  end

  def feed_event(title, dt_start, dt_end, desc)
    event = Icalendar::Event.new
    event.dtstart = date_start
    event.summary = title
    @cal.add_event(event)
  end

  def feed_render
    @cal.to_ical
  end
end
