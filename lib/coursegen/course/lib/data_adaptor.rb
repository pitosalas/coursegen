class DataAdaptor
  def initialize(source)
    @section = Toc.instance.section(source)
  end

  # column_selector is one of: :number, :date, :title, :homework
  COL_NAMES = { number: "number", date: "date", title: "title", homework: "homework"}

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
      citem.order
    when :date
      "date" #citem.date
    when :title
      citem.title
    else
      "error!"
    end
  end

  def cell_value_string(citem, column_selector)
    cell_value(citem, column_selector).to_s
  end
end