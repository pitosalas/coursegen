# Class TableHelper provides methods for creating a table.
class TableHelper
  def initialize(css_styles)
    @css_styles = css_styles
    @bm = BootstrapMarkup.new
  end

  def headers(*labels)
    @bm.table_begin(@css_styles)
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

  def render
    @bm.table_end
    @bm.render
  end
end
