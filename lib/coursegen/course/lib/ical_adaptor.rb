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

  def feed_event(title, dt_start, dt_end, desc, url)
    event = Icalendar::Event.new
    event.dtstart = dt_start
    event.dtend = dt_end
    event.summary = title
    event.description = desc
    event.url = url
    @cal.add_event(event)
  end

  def feed_render
    @cal.to_ical
  end
end
