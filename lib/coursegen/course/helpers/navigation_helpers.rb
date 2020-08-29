# NavigationHelpers provides methods for navigating the course.
# This is used in the nav bar along the top of the page.
# Called by main_navbar.html.erb
module NavigationHelpers
  def link_to_lecture(item_symbol)
    link_to_section :lectures, item_symbol
  end

  def link_to_next_lecture
    the_citem = Toc.instance.find_next_forn(@item)
    the_item = @items[the_citem.identifier]
    link_to(the_citem.title, the_item)
  end

  def link_to_topic(item_symbol)
    link_to_section :topics, item_symbol
  end

  def link_to_background(item_symbol)
    link_to_section :background, item_symbol
  end

  def link_to_cribsheet(item_symbol)
    link_to_section :cribsheets, item_symbol
  end

  def link_to_intro(item_symbol)
    link_to_section :intro, item_symbol
  end

  def link_to_incubator(item_symbol)
    link_to_section :incubator, item_symbol
  end

  def link_to_lab(item_symbol)
    link_to_section :lab, item_symbol
  end

  def link_to_pa(item_symbol)
    link_to_section :pa, item_symbol
  end

  def link_to_page(item_symbol)
    link_to_section :pages, item_symbol
  end

  def link_to_project(item_symbol)
    link_to_section :projects, item_symbol
  end

  def link_to_section(section_symbol, item_symbol)
    the_item = @items[lookup_nitem(section_symbol.to_s, item_symbol.to_s).identifier]
    link_to(the_item[:title], the_item)
  end

  def link_to_next(toc, item, attrs = {})
    next_nitem = toc.find_next_forn(item).identifier
    link_to 'next', @items[next_nitem].path, attrs
  end

  def link_to_prev(toc, item, attrs = {})
    prev_nitem = toc.find_previous_forn(item).identifier
    link_to 'previous', @items[prev_nitem].path, attrs
  end

  def link_to_inclusion(item)
    inclusion = Toc.instance.lookup_inclusion(item)
    if inclusion.nil?
      '(never included)'
    else
      " (#{inclusion.identifier})"
    end
  end

  # def link_to_slides_2
  #   '<a
  #     class="btn btn-sm btn-primary"
  #     href="./slides.html"
  #     title="slides">
  #     <i class="fas fa-chalkboard-teacher"></i> Slides
  #   </a>'
  # end

  def link_to_slides(attrs = {})
    link_to("slides", "./slides.html", attrs)
  end

  # def link_to_homework_2(citem)
  #   unless citem.hwref.nil?
  #     "<div class=\"btn btn-sm btn-primary\">" +
  #     "<i class=\"fad fa-backpack\"></i>" +
  #     link_to_section(:homework, citem.hwref.to_sym) +
  #     "</div>"
  #   end
  # end

  def link_to_homework(citem, attrs = {})
    return "" if citem.hwref.nil?

    the_item = @items[lookup_nitem("homework", citem.hwref).identifier]
    # link_to(the_item[:title], the_item, attrs)
    link_to("homework", the_item, attrs)
  end

  private

  # def nav_markup2(text, path, icon, tooltip = '')
  #   "<a class=\"nav-btn btn btn-mini\" href=\"#{path}\">
  #   <i class=\"#{icon}\" rel=\"tooltip\" title=\"#{tooltip}\"></i>#{text}</a>"
  # end

  def nav_markup(path, text)
    "<a class=\"btn btn-sm btn-primary\" href=\"#{path}\">#{text}</a>"
  end

  # def nav_markup_3(path, text, fontawesome, tooltip = '')
  #   "<a class=\"btn btn-sm btn-primary\" href=\"#{path}\">" + 
  #   "<i class=\"#{fontawesome}\"></i>" + 
  #   "#{text}</a>"
  # end
end
