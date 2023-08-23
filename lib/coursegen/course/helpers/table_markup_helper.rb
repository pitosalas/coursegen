class TableMarkupHelper
  def self.begin properties
    @th = TableHelper.new(properties)
    ""
  end

  def self.headers(labels)
    @th.headers(*labels.split("\;"))
    ""
  end

  def self.row(cells)
    @th.row(*cells.split("\;"))
    ""
  end

  def self.end
    @th.render
  end
end

