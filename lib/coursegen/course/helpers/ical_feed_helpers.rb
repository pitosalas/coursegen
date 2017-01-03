module ICalFeedHelpers
  def generate_ical source
    data_adaptor = DataAdaptor.new(source)
    ical_adaptor = ICalAdaptor.new
    schedule_feed = ScheduleFeed.new(ical_adaptor, data_adaptor)
    schedule_feed.render
  end
end
