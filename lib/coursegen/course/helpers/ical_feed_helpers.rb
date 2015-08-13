module IcalFeedHelpers
  def generate_ical source
    data_adaptor = DataAdaptor.new(source)
    ical_adaptor = ICalAdaptor.new()
    lecture_feed = LectureFeed.new(ical_adaptor, data_adaptor)
    lecture_feed.render
  end
end
