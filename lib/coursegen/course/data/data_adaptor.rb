class DataAdaptor
  def initialize(source)
    @section = Toc.instance.section(source)
  end

  # column_selector is one of: :number, :date, :title, :homework
  COL_NAMES = { number: "#", date: "lecture date", title: "title",
                homework: "homework", desc: "description", cat: "category" }

  def column_name(column_selector)
    COL_NAMES[column_selector]
  end

  def rows
    @section.each do |citem|
      yield citem
    end
  end

  def cell_value(citem, col_selector)
    case col_selector
    when :number
      citem.lecture_number
    when :date
      citem.lecture_date
    when :title
      citem.title
    when :url
      citem.identifier
    when :desc
      citem.desc
    when :homework
      citem.homework
    when :start_date_time
      citem.schedule_start_date_time
    when :end_date_time
      citem.schedule_end_date_time
    when :full_desc
      desc = citem.desc || ""
      hw = citem.homework || ""
      desc + ". HW: " + hw
    when :cat
      citem.cat
    else
      "error!"
    end
  end
end
