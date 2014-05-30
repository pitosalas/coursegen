require_relative "./spec_helper.rb"

class MockItem
	attr_accessor :identifier, :attributes
	def initialize name, att = {}
		@attributes = { :section => "lectures" }.merge(att)
		@identifier = name
	end

	def [](index)
		@attributes[index]
	end

	def self.gen (names)
		items = []
		order = [5,2,12,4,8,3,1,6]
		names.each { |nm| items << MockItem.new(nm, {order: order.pop}) }
		items
	end
end

describe Toc do
	context "simple sections" do
		let(:items) {
				MockItem.gen(
				 		%w(/content/lectures/hypotheses/ 
				 			/content/lectures/ideation/
				 			/content/lectures/lean_immersion/welcome/
				 			/content/lectures/lean_startup/) ) }

		it "initializes" do
			toc = Toc.instance
			toc.reset
			toc.prepare items, [SectionDef.new("Lectures", "lectures", type: :section)]
		end
	end

	context "a little more complicated" do

		describe "next and previous methods" do
			let(:items) {
				MockItem.gen(%w(/content/lectures/a/ 
												/content/lectures/b/ 
												/content/lectures/c/
												/content/lectures/d/) )
			}

			before (:each) do 
				@toc = Toc.instance
				@toc.reset
				@toc.prepare items, [SectionDef.new("Lectures", "lectures", type: :section)]
			end

			it "next" do
				sect = @toc.section("lectures")
				cprev = sect[1]
				c_plus_one = @toc.find_next_for(cprev)
				expect(c_plus_one.title).to eq sect[2].title
			end

			it "prev"  do
				sect = @toc.section("lectures")
				cprev = sect[2]
				c_plus_one = @toc.find_previous_for(cprev)
				expect(c_plus_one.title).to eq sect[1].title
			end
		end
	end

	context "lookup and access methods" do
		let(:items) {
			MockItem.gen(%w(/content/lectures/a/
											/content/lectures/b/ 
											/content/lectures/c/
											/content/lectures/d/) )
		}

		before (:each) do 
			@toc = Toc.instance
			@toc.reset
			@toc.prepare items, [SectionDef.new("Lectures", "lectures", type: :section)]
		end


	end
end