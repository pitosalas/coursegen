include VisualHelpers

Nanoc::Filter.define(:handle_shortcodes) do |content, _params = {}|
  prefix = /:/
  content
    .gsub(Regexp.new(prefix.source + /callout :(\w+), "(.+)", "(.+)"/.source)) do
    callout(Regexp.last_match(2),
            Regexp.last_match(3), Regexp.last_match(1))
  end
    .gsub(Regexp.new(prefix.source + /deliverable (.+)$/.source)) { deliverable(Regexp.last_match(1)) }
    .gsub(Regexp.new(prefix.source + /discussion "(.+)"/.source)) { discussion_box(Regexp.last_match(1)) }
    .gsub(Regexp.new(prefix.source + /h1 (.+)$/.source), "# \\1 ")
    .gsub(Regexp.new(prefix.source + /h2 (.+)$/.source), "## \\1 ")
    .gsub(Regexp.new(prefix.source + /h3 (.+)$/.source), "### \\1 ")
    .gsub(Regexp.new(prefix.source + /h4 (.+)$/.source), "#### \\1 ")
    .gsub(Regexp.new(prefix.source + /h5 (.+)$/.source)) { "<h5>#{Regexp.last_match(1)}</h5>" }
    .gsub(Regexp.new(prefix.source + /image :(\w+)$/.source)) { "<img src=\"/content/topics/images/#{Regexp.last_match(1)}.jpg\" class=\"img-thumbnail d-block mx-auto\" style=\"height:300px;\"/>" }
    .gsub(Regexp.new(prefix.source + /image :(\w+), :(\w+)$/.source)) { "<img src=\"/content/topics/images/#{Regexp.last_match(2)}.jpg\" class=\"img-thumbnail d-block mx-auto\" style=\"height:#{Regexp.last_match(1)}px;\"/>" }
    .gsub(Regexp.new(prefix.source + /image :(\w+), \{(.*?)\}$/.source)) { "<img src=\"/content/topics/images/#{Regexp.last_match(1)}.jpg\" class=\"img-thumbnail d-block mx-auto\" #{Regexp.last_match(2)}/>" }
    .gsub(Regexp.new(prefix.source + /quote (.+)$/.source), "<blockquote class=\"pretty\">\\1</blockquote>")
    .gsub(Regexp.new(prefix.source + /lecture_end/.source), end_of_lecture)
    .gsub(Regexp.new(prefix.source + /li (.+)$/.source)) { "<li>#{Regexp.last_match(1)}</li>" }
    .gsub(Regexp.new(prefix.source + /partbadge/.source), partbadge)
    .gsub(Regexp.new(prefix.source + /pdfbadge/.source), pdfbadge)
    .gsub(Regexp.new(prefix.source + /image_random "(\w+)", "(\w+)"/.source)) { "<img src=\"https://picsum.photos/#{Regexp.last_match(1)}/#{Regexp.last_match(2)}.jpg\" /> "}
    .gsub(Regexp.new(prefix.source + /image_rnd :(\w+), "(.+)", "(.+)"/.source)) do
    random_image(Regexp.last_match(1),
                 Regexp.last_match(2), Regexp.last_match(3))
  end
    .gsub(Regexp.new(prefix.source + /section_link :(\w+), :(\w+)/.source)) do
    link_to_section(Regexp.last_match(1),
                    Regexp.last_match(2))
  end
    .gsub(Regexp.new(prefix.source + /section_include :(\w+), :(\w+)/.source)) do
    include_from_section(Regexp.last_match(1),
                         Regexp.last_match(2))
  end
    .gsub(Regexp.new(prefix.source + /slide_bigtitle (.+)$/.source), "<slide_break></slide_break>\n\n## \\1")
    .gsub(Regexp.new(prefix.source + /slide_break/.source), "<slide_break></slide_break>")
    .gsub(Regexp.new(prefix.source + /slide_subtitle (.+)$/.source), "<slide_break></slide_break>\n\n#### \\1")
    .gsub(Regexp.new(prefix.source + /slide_title (.+)$/.source), "<slide_break></slide_break>\n\n### \\1")
    .gsub(Regexp.new(prefix.source + /source_begin :(.+)$/.source)) { source_begin("language-" + Regexp.last_match(1)) }
    .gsub(Regexp.new(prefix.source + /source_end/.source), source_end)
    .gsub(Regexp.new(prefix.source + /team_deliverable (.+)$/.source)) { team_deliverable(Regexp.last_match(1)) }
    .gsub(Regexp.new(prefix.source + /teambadge/.source), teambadge)
    .gsub(Regexp.new(prefix.source + /topic_include :(\w+)$/.source)) { include_topic(Regexp.last_match(1)) }
    .gsub(Regexp.new(prefix.source + /topic_link :(\w+)/.source)) { link_to_topic(Regexp.last_match(1)) }
    .gsub(Regexp.new(prefix.source + /ul_begin :(\w+)/.source)) { "<ul class=\"#{Regexp.last_match(1)}\">" }
    .gsub(Regexp.new(prefix.source + /ul_begin$/.source)) { "<ul>" }
    .gsub(Regexp.new(prefix.source + /ul_end$/.source)) { "</ul>" }
    .gsub(Regexp.new(prefix.source + /youtube "(.+)"$/.source)) { %(<iframe width="560" height="315" src="#{Regexp.last_match(1)}"></iframe>) }
    .gsub(Regexp.new(prefix.source + /zipbadge/.source), zipbadge)
    .gsub(Regexp.new(prefix.source + /tbegin "(.+)"$/.source)) { TableMarkupHelper.begin(Regexp.last_match(1));}
    .gsub(Regexp.new(prefix.source + /thead "(.+)"$/.source)) {TableMarkupHelper.headers(Regexp.last_match(1));}
    .gsub(Regexp.new(prefix.source + /trow "(.+)"$/.source)) {TableMarkupHelper.row(Regexp.last_match(1));}
    .gsub(Regexp.new(prefix.source + /tend/.source)) { TableMarkupHelper.end ;}
end
