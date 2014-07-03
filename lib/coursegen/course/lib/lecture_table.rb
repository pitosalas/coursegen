class LectureTable

  # source: name of a section as a string
  # rows: array with one or more of:
  #     "pages"
  #     "subsections"
  # cols: array with one or more of:
  #     :date
  #     :number
  #     :title
  #     :homeworks

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
      next unless include_row?(row_id)
      if subsection_hdr?(row_id)
        generate_summary_row(row_id)
      else
        generate_detail_row(row_id)
      end
    end
  end

  def generate_detail_row(row_id)
      @mark.row_begin
      @cols.each do |col_selector|
        @mark.cell_begin
        @mark.cell_content(cell_content_string(row_id, col_selector, detail: true))
        @mark.cell_end
      end
      @mark.row_end
  end

  def generate_summary_row(row_id)
    @mark.row_begin
    @mark.bigcell_begin
    @mark.cell_content(cell_content_string(row_id, :title, detail: false))
    @mark.bigcell_end
    @mark.row_end
  end

  def cell_content_string(row_id, col_selector, detail:)
    if (col_selector == :title && detail)
      link_to_unless_current(row_id.nitem[:title], row_id.identifier)
    elsif (col_selector == :date)
      @data.cell_value(row_id, col_selector).strftime("%a %b %-d")
    else
      @data.cell_value(row_id, col_selector).to_s
    end
  end

  def include_row?(row_id)
    @rows.include?(row_id.type)
  end

  def subsection_hdr?(row_id)
    row_id.type == "subsection"
  end

end