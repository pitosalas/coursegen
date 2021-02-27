include VisualHelpers

Nanoc::Filter.define(:handle_shortcodes) do |content, _params = {}|
  content
    .gsub(/^\$\$TOPIC_INCLUDE :(\w+)$/) { "<%= include_topic( :#{Regexp.last_match(1)}) %>" }
    .gsub(/^\$\$SLIDE_TITLE (.+)$/) { "<slide_break></slide_break>\n\n### #{Regexp.last_match(1)}" }
    .gsub(/^\$\$SLIDE_BREAK$/) { "<slide_break></slide_break>" }
    .gsub(/^\$\$LECTURE_END$/) { end_of_lecture }
    .gsub(/^\$\$LECTURE_BEGIN (.+)$/) { "## #{Regexp.last_match(1)} "}

  end
