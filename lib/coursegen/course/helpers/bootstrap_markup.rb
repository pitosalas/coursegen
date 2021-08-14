# Class BootstrapMarkup provides methods for using Bootstrap specific HTML
# markups.
class BootstrapMarkup
  def initialize
    @str = ''
  end

  def table_begin(css_class = 'table-sm')
    @str << "<table class=\"table #{css_class}\">"
  end

  def table_end
    @str << '</table>'
  end

  def headers_begin
    @str << '<thead><tr>'
  end

  def headers_end
    @str << '</tr></thead>'
  end

  def header_begin
    @str << '<th>'
  end

  def header_end
    @str << '</th>'
  end

  def header_content(str)
    @str << str unless str.nil?
  end

  def row_begin
    @str << '<tr>'
  end

  def row_end
    @str << '</tr>'
  end

  def cell_begin
    @str << '<td>'
  end

  def cell_end
    @str << '</td>'
  end

  def bigcell_begin
    @str << '<td colspan="3"><h5>'
  end

  def bigcell_end
    @str << '</h5></td>'
  end

  def cell_content(str)
    @str << str
  end

  def render
    @str
  end
end
