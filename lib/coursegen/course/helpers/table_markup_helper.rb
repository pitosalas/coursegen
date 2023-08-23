class TableMarkupHelper
  def self.begin properties
    @th = TableHelper.new(properties)
  end

  def self.end
    @th.render
  end
end

