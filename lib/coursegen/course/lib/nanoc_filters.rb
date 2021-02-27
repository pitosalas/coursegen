include VisualHelpers

Nanoc::Filter.define(:handle_shortcodes) do |content, _params = {}|
  content
    .gsub(/^\$\$INCLUDE_TOPIC :(\w+)$/) { "<%= include_topic( :#{$1}) %>" }
    .gsub(/^\$\$SLIDE_TITLE (.+)$/) { "<slide_break></slide_break>\n\n### #{$1}" }
    .gsub(/^\$\$SLIDE_BREAK$/) { "<slide_break></slide_break>" }
    .gsub(/^\$\$END_OF_LECTURE$/) { end_of_lecture }
end
