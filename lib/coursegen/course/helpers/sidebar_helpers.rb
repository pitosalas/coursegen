# SidebarHelpers is a set of helpers to display the navigation sidebar.
module SidebarHelpers
  def section_helper(title: nil, selector: nil)
    sect = Toc.instance.section(selector)
    @sect_def = Toc.instance.section_def(selector)
    str = "<li>
            <label class=\"tree-toggler level1\">
              #{collapsed_indicator(sect.collapsed?)}
              #{title}
            </label>
            #{sect.has_subsections? ? nested_section(sect) : flat_section(sect)}
          </li>"
  end

  def nested_section(sect)
    sect.subsections.reduce('') { |acc, subs| acc + subsection_body(subs) }
  end

  def subsection_body(sect)
    "<ul class=\"tree\">
      <li>
        <label class=\"tree-toggler level2\">
          #{collapsed_indicator(sect.content.collapsed?)}
          #{sect.content.title}
        </label>
        #{subsection(sect, sect.content.collapsed?)}
      </li>
    </ul>"
  end

  def collapsed_indicator(coll)
    icon_markup(coll ? :plus : :minus)
  end

  def subsection(subsect, collapsed)
    disp_clause = collapsed ? 'display: none' : 'display: block'
    str = "<ul class=\"tree\" style=\"#{disp_clause}\">"
    str = subsect.children.reduce(str) { |acc, item| acc + subsection_item_link(item) }
    str + '</ul>'
  end

  def subsection_item_link(tree_node)
    bullet = @sect_def.options[:bullet]
    link_path = @items[tree_node.content.identifier].path
    "<li class=\"#{tree_node.content.css_class}\">#{icon_markup(bullet)}<a href=\"#{link_path}\">#{tree_node.content.title}</a></li>"
  end

  def flat_section(sect)
    disp_clause = sect.collapsed? ? 'display: none' : 'display: block'
    str = "<ul class=\"tree\" style=\"#{disp_clause}\">"
    str = sect.reduce(str) { |acc, item| acc + flat_section_item_link(item) }
    str + '</ul>'
  end

  def flat_section_item_link(citem)
    bullet = @sect_def.options[:bullet]
    path = @items[citem.identifier].path
    "<li class=\"#{citem.css_class}\">#{icon_markup(bullet)}<a href=\"#{path}\">#{citem.title}</a></li>"
  end

  def icon_markup(icon_type)
    return '' if icon_type.nil?

    css_class = { dash: 'glyphicon-minus', star: 'glyphicon-star', plus: 'glyphicon-plus-sign', minus: 'glyphicon-minus-sign' }.fetch(icon_type)
    "<span class=\"glyphicon #{css_class}\" style=#{STYLING_CONFIG[:bullet_style]}></span>"
  end
end
