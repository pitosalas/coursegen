# Helpers to be used to format content
module FormattingHelpers

  def list_begin
    "<dl \"dl-horizontal\" style=\"font-size: 125%;\">"
  end

  def list_end
    "</dl>"
  end

  def le name
    str = ""
    if !first.nil?
      str += "<br/></dd>"
      first = true
    end
    str += "<dt>#{name}</dt><dd>"
    str
  end

end
