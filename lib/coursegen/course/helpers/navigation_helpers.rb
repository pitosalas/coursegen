# Used in the nav bar along the top of the page. Called by main_navbar.html.erb
module NavigationHelpers
  def link_to_lecture item_symbol
    link_to_section :lectures, item_symbol
  end

  def link_to_next_lecture
    the_citem = Toc.instance.find_next_forn(@item)
    the_item = @items[the_citem.identifier]
    link_to(the_citem.title, the_item)
  end

  def link_to_topic item_symbol
    link_to_section :topics, item_symbol
  end

  def link_to_background item_symbol
    link_to_section :background, item_symbol
  end

  def link_to_cribsheet item_symbol
    link_to_section :cribsheets, item_symbol
  end

  def link_to_intro item_symbol
    link_to_section :intro, item_symbol
  end

  def link_to_incubator item_symbol
    link_to_section :incubator, item_symbol
  end

  def link_to_lab item_symbol
    link_to_section :lab, item_symbol
  end

  def link_to_pa item_symbol
    link_to_section :pa, item_symbol
  end

  def link_to_page item_symbol
    link_to_section :pages, item_symbol
  end

  def link_to_project item_symbol
    link_to_section :projects, item_symbol
  end

  def link_to_section section_symbol, item_symbol
    the_item = @items[lookup_nitem(section_symbol.to_s, item_symbol.to_s).identifier]
    link_to(the_item[:title], the_item)
  end

  def link_to_next toc, item
    next_nitem = toc.find_next_forn(item).identifier
    # nav_markup "", @items[next_nitem].path, "glyphicon glyphicon-arrow-right", "next page"
     nav_markup2 @items[next_nitem].path, "next page"
  end

  def link_to_prev toc, item
    prev_nitem = toc.find_previous_forn(item).identifier
    # nav_markup "", @items[prev_nitem].path, "glyphicon glyphicon-arrow-left", "previous page"
    nav_markup2 @items[prev_nitem].path, "previous page"
  end

  def link_to_inclusion item
    inclusion = Toc.instance.lookup_inclusion(item)
    if inclusion.nil?
      "(never included)"
    else
      " (#{inclusion.identifier})"
    end
  end

  private

  def nav_markup text, path, icon, tooltip=""
    "<a class=\"nav-btn btn btn-mini\" href=\"#{path}\"><i class=\"#{icon}\" rel=\"tooltip\" title=\"#{tooltip}\"></i>#{text}</a>"
  end

  def nav_markup2 path, text
    "<a class=\"nav-link\" href=\"#{path}\">#{text}</a>"
  end
end
