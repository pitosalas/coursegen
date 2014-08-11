require 'singleton'
class Toc

  include Enumerable
  include Singleton

  def prepare items, config
    raise "Toc.prepare called twice!" unless @sections.nil?
    @section_config = config
    build_mapping_table items
    build_citem_table
    build_sections @citems
    @info = {}
  end

  def build_sections items
    @sections = {}
    @section_config.each do 
      |sect|
      selector = sect.selector.to_s
      if sect.options[:type] == :lecture
        schedule = Scheduler.new
        schedule.setup_from_schedule_def(sect.options[:schedule])
        @sections[selector] = Lectures.new(selector, items, schedule, sect.options[:collapsed])
      elsif sect.options[:type] == :section
        @sections[selector] = Section.new(selector, items, sect.options[:collapsed])
      else
        raise ArgumentError.new("Invalid section option")
      end
    end
  end

  def build_mapping_table items
    @map_n2c = {}
    items.each do
      |nitem|
      citem = CItem.new(nitem)
      @map_n2c[nitem] = citem
    end
  end

  def build_citem_table
    @citems = @map_n2c.map { |k, v| v}
  end

  def n2c nitem
    @map_n2c[nitem]
  end

  def lookup_citem the_sect, item_short_name
    section(the_sect).find_by_short_name(item_short_name)
  end

  def reset
    @sections = nil
  end

  def section selector
    section = @sections[selector]
    raise RuntimeError, "Invalid Section: #{selector}" if section.nil?
    section
  end


  def find_next_forn(nitem)
    p = find_next_for(n2c(nitem)) 
    fail "find_next_forn" if p.nil?
    p
  end

  def find_previous_forn(nitem)
    p = find_previous_for(n2c(nitem))
    fail "find_previous_forn" if p.nil?
    p
  end

  def find_next_for(citem)
    section(citem.section).next_for(citem)
  end

  def find_previous_for(citem)
    section(citem.section).previous_for(citem)
  end

  def citem_section citem
    @sections[citem.section]
  end

   def record_inclusion host_item, included_item
    @info[included_item.identifier] = host_item
  end

  private

  def subsections(section, &block)
    items = sort_section_by_subsection_name section
    item_iterator = items.chunk do |item|
      subsection_name section.to_s, item.identifier
    end
    item_iterator.each do |subsection_item|
      block.call(subsection_item)
    end
  end



  def index_in_section item
    section_for(item).find_index(item)
  end

  def each_by(section_selector, &block)
    sub_toc = @sections[section_selector]
    sub_toc.sort! { |a,b| a[:order] <=> b[:order] }.each do |member|
      block.call(member)
    end
  end

  def sort_section_by_order sect
      @sections[sect].sort! { |a,b| a[:order] <=> b[:order] }
  end

  def sort_section_by_subsection_name(sect)
    items = @sections[sect]
    items.sort! do
      |item1, item2|
      subsection_name(sect.to_s, item1.identifier) <=> subsection_name(sect.to_s, item2.identifier)
    end
    items
  end

  def subsection_name section_name, item_name
    item_matcher = item_name.match('\A/'+section_name+'/([^/]*)/([^/]*)/\z')
    if !item_matcher.nil?
      item_matcher[1]
    else
      ""
    end
  end

  def lookup_inclusion included_item
    @info[included_item.identifier]
  end

  def lookup_by_index section, index
    sect = section.section
    if index >= @sections[sect].count
      index = @sections[sect].count-1
    elsif index < 0
      index = 0
    end
    @sections[sect][index]
  end

end
