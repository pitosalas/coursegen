# Sidebar configuration

class SectionDef
	attr_accessor :title, :selector, :options
	def initialize(title, selector, options = {})
		@title = title
		@selector = selector
		@options = options
	end
end
