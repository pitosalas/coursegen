include VisualHelpers

Nanoc::Filter.define(:handle_shortcodes) do |content, _params = {}|
  prefix = /:/
    content
      .gsub(Regexp.new(prefix.source + /callout :(\w+), "(.+)", "(.+)"/.source)) { callout($2, $3, $1) }
      .gsub(Regexp.new(prefix.source + /deliverable (.+)$/.source)) { deliverable($1) }
      .gsub(Regexp.new(prefix.source + /discussion_box "(.+)"/.source)) { discussion_box($1) }
      .gsub(Regexp.new(prefix.source + /h1 (.+)$/.source), "# \\1 ")
      .gsub(Regexp.new(prefix.source + /h2 (.+)$/.source), "## \\1 ")
      .gsub(Regexp.new(prefix.source + /h3 (.+)$/.source), "### \\1 ")
      .gsub(Regexp.new(prefix.source + /h4 (.+)$/.source), "#### \\1 ")
      .gsub(Regexp.new(prefix.source + /h5 (.+)$/.source)) { "<h5>#{$1}</h5>" }
      .gsub(Regexp.new(prefix.source + /image :(\w+)$/.source)) { "<img src=\"/content/topics/images/#{$1}.jpg\" class=\"img-thumbnail d-block mx-auto\" style=\"height:300px;\"/>" }
      .gsub(Regexp.new(prefix.source + /image :(\w+), :(\w+)$/.source)) { "<img src=\"/content/topics/images/#{$2}.jpg\" class=\"img-thumbnail d-block mx-auto\" style=\"height:#{$1}px;\"/>" }
      .gsub(Regexp.new(prefix.source + /lecture_end/.source), end_of_lecture)
      .gsub(Regexp.new(prefix.source + /li (.+)$/.source)) { "<li>#{$1}</li>" }
      .gsub(Regexp.new(prefix.source + /partbadge/.source), partbadge)
      .gsub(Regexp.new(prefix.source + /pdfbadge/.source), pdfbadge)
      .gsub(Regexp.new(prefix.source + /section_link :(\w+), :(\w+)/.source)) { link_to_section($1, $2) }
      .gsub(Regexp.new(prefix.source + /section_include :(\w+), :(\w+)/.source)) { include_from_section($1, $2) }
      .gsub(Regexp.new(prefix.source + /slide_bigtitle (.+)$/.source), "<slide_break></slide_break>\n\n## \\1")
      .gsub(Regexp.new(prefix.source + /slide_break/.source),  "<slide_break></slide_break>")
      .gsub(Regexp.new(prefix.source + /slide_subtitle (.+)$/.source), "<slide_break></slide_break>\n\n#### \\1")
      .gsub(Regexp.new(prefix.source + /slide_title (.+)$/.source), "<slide_break></slide_break>\n\n### \\1")
      .gsub(Regexp.new(prefix.source + /source_begin :(.+)$/.source)) { source_begin( ":language-"+$1) }
      .gsub(Regexp.new(prefix.source + /source_end/.source), source_end)
      .gsub(Regexp.new(prefix.source + /team_deliverable (.+)$/.source)) { team_deliverable($1) }
      .gsub(Regexp.new(prefix.source + /teambadge/.source), teambadge)
      .gsub(Regexp.new(prefix.source + /topic_include :(\w+)$/.source)) { include_topic($1) }
      .gsub(Regexp.new(prefix.source + /topic_link :(\w+)/.source)) { link_to_topic($1) }
      .gsub(Regexp.new(prefix.source + /ul_begin :(\w+)/.source)) { "<ul class=\"#{$1}\">" }
      .gsub(Regexp.new(prefix.source + /ul_begin$/.source)) { "<ul>" }
      .gsub(Regexp.new(prefix.source + /ul_end$/.source)) { "</ul>" }
      .gsub(Regexp.new(prefix.source + /youtube \"(.+)\"$/.source)) {  %Q!<iframe width="560" height="315" src="#{$1}"></iframe>! }
      .gsub(Regexp.new(prefix.source + /zipbadge/.source), zipbadge)
end
