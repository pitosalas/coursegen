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
    else
      "error!"
    end
  end
end