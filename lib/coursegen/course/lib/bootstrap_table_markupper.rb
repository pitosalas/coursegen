class BootstrapTableMarkupper
  def table_begin
    "<table class=\"table table-condensed\">"
  end

  def table_end
    "</table>"
  end

  def headers_begin
    ""
  end

  def headers_end
    ""
  end

  def row_begin
    "<tr>"
  end

  def row_end
    "</tr>"
  end

  def cell_begin
    "<td>"
  end

  def cell_end
    "</td>"
  end
end