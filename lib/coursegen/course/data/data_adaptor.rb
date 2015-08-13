class DataAdaptor
  def initialize(source)
    @section = Toc.instance.section(source)
  end

  # column_selector is one of: :number, :date, :title, :homework
  COL_NAMES = { number: "#", date: "lecture date", title: "title", homework: "homework", desc: "description"}

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
      "this is a lot of work! Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    else
      "error!"
    end
  end
end
