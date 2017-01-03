class ListOf
  # source: name of a section as a string
  # rows: array with one or more of:
  #     "pages"
  #     "subsections"
  # subsections: array with one or more strings corresponding to subsection string in an item
  #     .e.g. "/content/topics/arch/"
  # cols: array with one or more of:
  #     :date
  #     :number
  #     :title
  #     :homeworks
  # items: refers to nanoc's @items (temp hack!)

  def initialize(markup_adaptor, data_adaptor, rows, cols, subsections, items)
    @mark = markup_adaptor
    @rows = rows
    @cols = cols
    @data = data_adaptor
    @subsections = subsections
    @items = items
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
      nitem = @items[row_id.identifier]
      link_to_unless_current(nitem[:title], nitem)
    elsif (col_selector == :date)
      @data.cell_value(row_id, col_selector).strftime("%b %-d")
    else
      @data.cell_value(row_id, col_selector).to_s
    end
  end

  def include_row?(row_id)
    include_by_row_type?(row_id) && include_by_subsection_path?(row_id)
  end

  def include_by_row_type?(row_id)
    @rows.include?(row_id.type)
  end

  def include_by_subsection_path?(row_id)
    @subsections.length == 0 || @subsections.include?(row_id.subsection)
  end

  def subsection_hdr?(row_id)
    row_id.type == "subsection"
  end
end
