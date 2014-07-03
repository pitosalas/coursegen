require 'forwardable'
require 'pry'

class Section
	extend Forwardable
	attr_reader :section
	def_delegators :@citems, :[], :count, :each, :sort!, :reduce

	def initialize (sect, citems, collapsed)
		@section = sect
		@collapsed = collapsed
		@citems = section_filter(citems)
		sort_pages
	end

	def find_index(citem)
		@citems.find_index(citem)
	end

	def find_by_short_name(sname)
		matches = @citems.select { |c| sname == c.short_name}
		binding.pry	if matches.length != 1
	  raise RuntimeError,"#{sname}: invalid reference in section \"#{@section}\"" if matches.length == 0
    raise RunimeError, "#{sname}: duplicate referenced in section \"#{@section}\"" if matches.length != 1
		matches[0]
	end

	def [](ind)
		@citems[ind]
	end

	def next_for(citem)
		index = @citems.find_index(citem)
		raise ArgumentError, "invalid citem in next_for" if index.nil?
		new_index = [index, @citems.length-2].min
		@citems[new_index+1]
	end

	def previous_for(citem)
		index = @citems.find_index(citem)
		raise ArgumentError, "invalid citem in next_for" if index.nil?
		new_index = [index, 1].max
		@citems[new_index-1]
	end

	def has_subsections?
		false
	end

	def has_lecture_numbers?
		false
	end

	def collapsed?
		@collapsed
	end

	protected

  def lookup_citem_by_identifier identifier
    res = @citems.select { |i| i.identifier == identifier }
    binding.pry if res.length != 1
    raise RuntimeError, "lookup by identifier failed #{identifier}" if res.length != 1
    res[0]
  end

  # Remove citems that don't belong in this section, or are hidden
	def section_filter citems
		filtered_citems = citems.map do 
			|citem|
  		citem.section == @section && !citem.hidden? ? citem : nil
  	end
  	filtered_citems.compact
  end

	def sort_pages
		@citems.sort! { |a,b| a.order <=> b.order } rescue binding.pry
	end
end
