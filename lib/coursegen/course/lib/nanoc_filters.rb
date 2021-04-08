include VisualHelpers

Nanoc::Filter.define(:handle_shortcodes) do |content, _params = {}|
  prefix = /:/
  content
    .gsub(Regexp.new(prefix.source + /h1 (.+)$/.source), "# \\1 ")
    .gsub(Regexp.new(prefix.source + /h2 (.+)$/.source), "## \\1 ")
    .gsub(Regexp.new(prefix.source + /h3 (.+)$/.source), "### \\1 ")
    .gsub(Regexp.new(prefix.source + /h4 (.+)$/.source), "#### \\1 ")
    .gsub(Regexp.new(prefix.source + /topic_include :(\w+)$/.source)) { |match| include_topic($1) }
    .gsub(Regexp.new(prefix.source + /topic_link :(\w+)/.source)) { |match| link_to_topic($1) }
    .gsub(Regexp.new(prefix.source + /section_link :(\w+) :(\w+)/.source)) { |match| link_to_section($1, $2) }
    .gsub(Regexp.new(prefix.source + /slide_title (.+)$/.source), "<slide_break></slide_break>\n\n### \\1")
    .gsub(Regexp.new(prefix.source + /slide_bigtitle (.+)$/.source), "<slide_break></slide_break>\n\n## \\1")
    .gsub(Regexp.new(prefix.source + /lecture_end/.source), end_of_lecture)
    .gsub(Regexp.new(prefix.source + /deliverable (.+)$/.source), "<%= deliverable( \"\\1\") %>")
    .gsub(Regexp.new(prefix.source + /pdfbadge/.source), pdfbadge)
    .gsub(Regexp.new(prefix.source + /partbadge/.source), partbadge)
    .gsub(Regexp.new(prefix.source + /teambadge/.source), teambadge)
    .gsub(Regexp.new(prefix.source + /zipbadge/.source), zipbadge)
    .gsub(Regexp.new(prefix.source + /slide_break/.source),  "<slide_break></slide_break>")
    .gsub(Regexp.new(prefix.source + /youtube \"(.+)\"$/.source)) { |match| %Q!<iframe width="560" height="315" src="#{$1}"></iframe>! }
    # .gsub(Regexp.new(prefix.source + /youtube \"(.+)\"$/.source)) { |match| $1 }
    .gsub(Regexp.new(prefix.source + /source_begin :(.+)$/.source)) { |match| source_begin ( ":language-"+$1) }
    .gsub(Regexp.new(prefix.source + /source_end/.source), source_end)
    .gsub(Regexp.new(prefix.source + /team_deliverable (.+)$/.source), "<%= team_deliverable( \"\\1\") %>")
    .gsub(Regexp.new(prefix.source + /discussion_box (.+)$/.source), "<%= discussion_box( \"\\1\") %>")
    .gsub(Regexp.new(prefix.source + /image :(\w+)/.source), "<img src=\"/content/topics/images/\\1.jpg\" class=\"img-thumbnail\" style=\"height:300px;\"/>")

  end
