module LectureTableHelpers

  # source: name of a section as a string
  # rows: array with one or more of:
  #     "pages"
  #     "subsections"
  # cols: array with one or more of:
  #     :date
  #     :number
  #     :title
  #     :homeworks

  def lecture_table(source:, rows:, cols:)
    markup_adaptor = BootstrapMarkup.new
    data_adaptor = DataAdaptor.new(source)
    lecture_table_builder = LectureTable.new(markup_adaptor, data_adaptor, rows, cols)
    lecture_table_builder.render
  end

  def lecture_table_builder(ncol, nrow)
    markup_generator = BootstrapMarkup.new
    table_builder = TableBuilder.new(markup_generator, ncol, nrow)
    table_builder.render
  end
end
