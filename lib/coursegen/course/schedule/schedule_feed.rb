# Used in generating iCal feed. Given a data_adapter (who knows how to get data out and iterate across things) and a feed_builder (who knows how to turn that data into some kind of feed), produce the feed. This same class could also generate, for example, an RSs feed.

class ScheduleFeed
  def initialize feed_builder, data_adapter
    @feed_builder = feed_builder
    @data = data_adapter
  end

  def render
    @feed_builder.feed_begin
    render_all_events
    @feed_builder.feed_end
    @feed_builder.feed_render
  end

  def render_all_events
    @data.rows do |row_id|
      render_event(row_id) unless row_id.type == "subsection"
    end
  end

  def render_event row_id
    title = @data.cell_value(row_id, :title)
    dt_start = @data.cell_value(row_id, :start_date_time)
    dt_end = @data.cell_value(row_id, :end_date_time)
    desc = @data.cell_value(row_id, :full_desc)
    @feed_builder.feed_event(title, dt_start, dt_end, desc)
  end
end
