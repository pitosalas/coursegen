class TableHelper
  def initialize(property)
    @prop = property
    @bm = BootstrapMarkup.new
  end

  def headers(*labels)
    css_style = @prop == :normal ? "table-condensed" : ""
    @bm.table_begin(css_style)
    @bm.headers_begin
    labels.each do |h|
      @bm.header_begin
      @bm.header_content(h)
      @bm.header_end
    end
    @bm.headers_end
  end

  def row(*cells)
    @bm.row_begin
    cells.each do |c|
      @bm.cell_begin
      @bm.cell_content(c)
      @bm.cell_end
    end
    @bm.row_end
  end

  def render()
    @bm.table_end
    @bm.render
  end
end
