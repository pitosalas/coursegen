class LectureTable

  # source: string name of the section
  # rows: :weekly or :all
  # cols: [:number, :date, :title, :homework, ...]

  def initialize(markup_adaptor, data_adaptor, rows, cols)
    @mark = markup_adaptor
    @rows = rows
    @cols = cols
    @data = data_adaptor
  end

  def render
    @mark.table_begin
    generate_headers
    generate_rows
    @mark.table_end
    @mark.render
  end

  private

  def generate_headers
    @mark.headers_begin

    @cols.each do |col|
      @mark.header_begin
      @mark.header_content(@data.column_name(col))
      @mark.header_end
    end

    @mark.headers_end
  end

  def generate_rows
    @data.rows do |row_id|
      @mark.row_begin
      @cols.each do |col_selector|
        @mark.cell_begin
        @mark.cell_content(@data.cell_value_string(row_id, col_selector))
        @mark.cell_end
      end
      @mark.row_end
    end
  end
end