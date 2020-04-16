# FormattingHelpers is used to format content.
module FormattingHelpers
  def list_begin
    '<dl class="dl-horizontal" style="font-size: 125%;">'
  end

  def list_end
    '</dd></dl>'
  end

  def le(name, first_entry = false)
    str = ''
    str += '</dd><br/>' unless first_entry
    str += "<dt>#{name}</dt><dd>"
    str
  end
end
