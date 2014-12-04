module NavigationHelpers

  def link_to_lecture item_symbol
    link_to_section :lectures, item_symbol
  end

  def link_to_next_lecture
    the_item = Toc.instance.find_next_forn(@item)
    link_to(the_item.title, the_item.identifier)
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

  def link_to_section section_symbol, item_symbol
  	the_item = lookup_nitem(section_symbol.to_s, item_symbol.to_s)
		link_to_unless_current(the_item[:title], the_item.identifier)
	end

	def link_to_next toc, item
		nav_markup "", toc.find_next_forn(item).nitem.path, "glyphicon glyphicon-chevron-right", "next page"
	end

	def link_to_prev toc, item
		nav_markup "", toc.find_previous_forn(item).nitem.path, "glyphicon glyphicon-chevron-left", "previous page"
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
		"<a class=\"btn btn-mini\" href=\"#{path}\"><i class=\"#{icon}\" rel=\"tooltip\" title=\"#{tooltip}\"></i>#{text}</a>"
	end

end
