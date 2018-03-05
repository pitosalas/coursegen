# Helpers to be used to format content
module FormattingHelpers

  def list_begin
    "<dl class=\"dl-horizontal\" style=\"font-size: 125%;\">"
  end

  def list_end
    "</dd></dl>"
  end

  def le (name, first_entry=false)
    str = ""
    if !first_entry
      str += "</dd><br/>"
    end
    str += "<dt>#{name}</dt><dd>"
    str
  end

end
