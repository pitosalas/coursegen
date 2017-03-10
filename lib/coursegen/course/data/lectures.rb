require 'byebug'
require 'tree'

class Lectures < Section
  def initialize(sect, citems, schedule=nil, collapsed=false)
    super sect, citems, collapsed
    @schedule = schedule || ::Scheduler.new
    @citems = sort_items
    build_tree
  end

  def has_subsections?
    true
  end

  def has_lecture_numbers?
    true
  end

  def schedule
    @schedule
  end

  def build_tree
    byebug
    lecture_num = 1
    @root = Tree::TreeNode.new("root", "root")
    @citems.each do |i|
      i.lecture_number = lecture_num
      i.lecture_date = @schedule.event_date_by_index(lecture_num - 1) # Lecture numbers are base 1
      i.start_time = get_time(@schedule.start_times, lecture_num)
      i.end_time = get_time(@schedule.end_times, lecture_num)
      if i.type == "subsection"
        @root.add(Tree::TreeNode.new(i.subsection, i))
      elsif i.type == "page"
        parent_tree_node = parent_node_of(i)
        parent_tree_node.add(Tree::TreeNode.new(i.identifier, i))
        lecture_num += 1
      else
        raise ArgumentError, "invalid lecture page type of #{i.type}for #{i.title}"
      end
    end
  end

  def parent_node_of citem
    parent_node = @root[citem.subsection]
    raise  RuntimeError, "Cant find section for item: #{citem.identifier}" if parent_node.nil?
    parent_node
  end

  def treenode_of citem
    @root.find do |tree_node|
      if citem.type == "subsection"
        citem.subsection == tree_node.name
      else
        citem.identifier == tree_node.name
      end
    end
  end

  def subsections
    @root.children
  end

  def next_for(citem)
    next_node = treenode_of(citem).next_sibling
    if !next_node.nil?
      next_node.content
    else
      citem
    end
  end

  def previous_for(citem)
    prev_node = treenode_of(citem).previous_sibling
    if !prev_node.nil?
      prev_node.content
    else
      citem
    end
  end

  protected

# @TODO: once there are skips, this calcluation doesn't work anymore!
  def get_time(times, lect_num)
    byebug
    if times.nil?
      "0"
    else
      times[(lect_num % 3) - 1]
    end
  end

#
# Sort all the items in this section: First by the ordering of the subseciton
# that the item belongs to, and second by the item's own indicated order.
#
  def sort_items
    new_citems = @citems.sort_by do |i|
      [lookup_citem_by_identifier(i.subsection + "index.html").order,
       ((i.type == "page" ? 100 : 1) * i.order)]
    end
    @items = new_citems
  end
end
