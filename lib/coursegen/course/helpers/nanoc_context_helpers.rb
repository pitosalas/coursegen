
# include this module in order to access Nanoc instance variables
puts "defining module"
module NanocContext
  def ident2nitem(identifier)
    @items[identifier]
  end
end
