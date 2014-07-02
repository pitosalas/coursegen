class TableBuilder
  def initialize markupper, rows, columns
    @mark = markupper
    @rows = rows
    @cols = columns
  end

  def generate
    str = @mark.table_begin
    str << @mark.headers_begin
    str << @mark.headers_end
    @rows.times do |row|
      str << @mark.row_begin
      @cols.times do |col|
        str << @mark.cell_begin
        "foobar"
        str << @mark.cell_end
      end
      str << @mark.row_end
    end
    str << @mark.table_end
    str
  end

end
