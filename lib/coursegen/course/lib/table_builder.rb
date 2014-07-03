class TableBuilder
  def initialize markupper, rows, columns
    @mark = markupper
    @rows = rows
    @cols = columns
  end

  def render
    @mark.table_begin
    @mark.headers_begin
    @mark.headers_end
    @rows.times do |row|
      @mark.row_begin
      @cols.times do |col|
        @mark.cell_begin
        @mark.cell_content("foobar")
        @mark.cell_end
      end
      @mark.row_end
    end
    @mark.table_end
    @mark.render
  end

end
