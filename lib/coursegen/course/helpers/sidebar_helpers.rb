module SidebarHelpers
  def section_helper title:nil, selector:nil
    sect = Toc.instance.section(selector)
    binding.pry
    str = "<li>
            <label class=\"tree-toggler level1\">
              #{collapsed_indicator(sect[0].collapsed)}
              #{title}
            </label>"
    if sect.has_subsections?
      str += nested_section(sect)
    else
      str += flat_section(sect)
    end
    str += "</li>"
  end

  def nested_section sect
    sect.subsections.reduce("") {|acc, subs| acc + subsection_body(subs)}
  end

  def subsection_body sect
    "<ul class=\"tree\">
      <li>
        <label class=\"tree-toggler level2\">
          #{collapsed_indicator(sect.content.collapsed)} 
          #{sect.content.title}
        </label>
        #{subsection(sect, sect.content.collapsed)}
      </li>
    </ul>"
  end

  def collapsed_indicator(coll)
    icon_markup(coll ? :plus : :minus)
  end

  def subsection subsect, collapsed
    disp_clause = collapsed ? "display: none" : "display: block"
    str = "<ul class=\"tree\" style=\"#{disp_clause}\">"
    str = subsect.children.reduce(str) { |acc, item| acc + subsection_item_link(item) }
    str += "</ul>"
  end

  def subsection_item_link tree_node
   "<li class=\"#{tree_node.content.css_class}\"><a href=\"#{tree_node.content.path}\">#{tree_node.content.title}</a></li>"
  end

  def flat_section sect
    disp_clause = sect[0].collapsed ? "display: none" : "display: block"
    str = "<ul class=\"tree\" style=\"#{disp_clause}\">"
    str = sect.reduce(str) { |acc, item| acc + flat_section_item_link(item) }
    str += "</ul>" 
  end

  def flat_section_item_link citem
    "<li class=\"#{citem.css_class}\"><a href=\"#{citem.path}\">#{citem.title}</a></li>"
  end

  def icon_markup icon_type
    css_class = {star: "glyphicon-star", plus: "glyphicon-plus-sign", minus: "glyphicon-minus-sign"}.fetch(icon_type)
    "<span class=\"glyphicon #{css_class} glyphicon-small \"></span>"
  end
end
