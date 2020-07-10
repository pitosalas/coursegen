# ListOfHelpers is used to create a lecture table.
module ListOfHelpers
  # List_of creates and renders a lecture table based on the given info.
  #
  # source:       name of a section as a string
  # rows:         array with one or more of:
  #               "pages"
  #               "subsections"
  # cols:         array with one or more of:
  #               :date
  #               :number
  #               :title
  #               :homeworks
  #               :assigned
  #               :lectref
  # subsections:  array with one or more strings corresponding to subsection
  #               string in an item
  #               e.g. "/content/topics/arch/"
  # items:        refers to nanoc's @items (temp hack!)
  def list_of(source:, rows:, cols:, headers: {}, subsections: [], items:)
    markup_adaptor = BootstrapMarkup.new
    data_adaptor = DataAdaptor.new(source)
    lecture_table_builder = ListOf.new(markup_adaptor, data_adaptor, rows, cols, subsections, items, headers)
    lecture_table_builder.render
  end
end
