class TableHelper
  def initialize(*headers)
    @bm = BootstrapMarkup.new
    @bm.table_begin
    @bm.headers_begin
    headers.each do |h|
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

  def generate()
    @bm.table_end
    @bm.generate
  end
end
