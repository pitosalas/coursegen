module LectureTableHelpers
  def lecture_table(source:, rows: :lectures, cols: [:number, :date, :title])
  end

  def lecture_table_builder(ncol, nrow)
    markup_generator = ::BootstrapTableMarkupper.new
    table_builder = TableBuilder.new(markup_generator, ncol, nrow)
    table_builder.generate
  end
end
