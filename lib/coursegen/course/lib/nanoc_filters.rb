include VisualHelpers

Nanoc::Filter.define(:handle_shortcodes) do |content, _params = {}|
  prefix = /:/
  content
    .gsub(/^\$\$TOPIC_INCLUDE :(\w+)$/) { "<%= include_topic( :#{Regexp.last_match(1)}) %>" }
    .gsub(/\$\$TOPIC_LINK :(\w+)$/) { "<%= link_to_topic( :#{Regexp.last_match(1)}) %>" }
    .gsub(/\$\$SLIDE_TITLE (.+)$/) { "<slide_break></slide_break>\n\n### #{Regexp.last_match(1)}" }
    .gsub(/\$\$SLIDE_BREAK$/) { "<slide_break></slide_break>" }
    .gsub(/\$\$LECTURE_END$/) { end_of_lecture }
    .gsub(/\$\$LECTURE_BEGIN (.+)$/) { "## #{Regexp.last_match(1)} "}
    .gsub(Regexp.new(prefix.source + /h1 (.+)$/.source), "# \\1 ")
    .gsub(Regexp.new(prefix.source + /h2 (.+)$/.source), "## \\1 ")
    .gsub(Regexp.new(prefix.source + /h3 (.+)$/.source), "### \\1 ")
    .gsub(Regexp.new(prefix.source + /topic_include :(\w+)$/.source), "<%= include_topic( :\\1) %>")
    .gsub(Regexp.new(prefix.source + /topic_link :(\w+)$/.source), "<%= link_to_topic( :\\1) %>")
    .gsub(Regexp.new(prefix.source + /slide_title (.+)$/.source), "<slide_break></slide_break>\n\n### \\1")
    .gsub(Regexp.new(prefix.source + /lecture_end/.source), end_of_lecture)
    .gsub(Regexp.new(prefix.source + /deliverable (.+)$/.source), "<%= deliverable( \"\\1\") %>")
    .gsub(Regexp.new(prefix.source + /pdfbadge/.source), pdfbadge)
    .gsub(Regexp.new(prefix.source + /partbadge/.source), partbadge)
    .gsub(Regexp.new(prefix.source + /teambadge/.source), teambadge)
    .gsub(Regexp.new(prefix.source + /slide_break/.source),  "<slide_break></slide_break>")



  end
