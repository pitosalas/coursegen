require 'icalendar'
require 'icalendar/tzinfo'
require 'icalendar/value'

class ICalAdaptor
  def initialize
    @cal = Icalendar::Calendar.new
    tzid = "America/New_York"
    tz = TZInfo::Timezone.get tzid
    @cal.add_timezone tz.ical_timezone(Time.now)
  end

  def feed_begin
  end

  def feed_end
  end

  def feed_event(title, dt_start, dt_end, desc, url)
    event = Icalendar::Event.new
    event.dtstart = dt_start
#    event.dtstart = Icalendar::Values::DateOrDateTime.new(dt_start, tzid: 'UTC').call
    event.dtend = dt_end
#    event.dtend = Icalendar::Values::DateOrDateTime.new(dt_end, tzid: 'UTC').call
    event.summary = title
    event.description = desc
#    event.url = url
    @cal.add_event(event)
  end

  def feed_render
    @cal.to_ical
  end
end
