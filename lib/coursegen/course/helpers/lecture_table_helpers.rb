module LectureTableHelpers
  def lecture_table(source:, rows: :lectures, cols: [:number, :date, :title])
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
