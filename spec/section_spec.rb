require_relative "./spec_helper.rb"

describe Section do
	before do
		@mock_citems = 
			[["welcome", :intro, false, 1],
			 ["Day 1", :intro, false, 2],
			 ["Day 1a", :intro, true,3 ]
			].map {|t, s, h, o| double("CItem", title: t,  section: s, hidden?: h, order: o) }
		@sect = Section.new :intro, @mock_citems, false
	end

	it "can find the index" do
		expect( @sect.find_index(@mock_citems[1] )).to eq 1
	end

	it "can look up by index" do
		expect(@sect[1]).to eq @mock_citems[1]
	end

	it "can find next entry" do
		expect( @sect.next_for(@mock_citems[0])).to eq @mock_citems[1]
	end

	it "can find prev entry" do
		expect( @sect.previous_for(@mock_citems[1])).to eq @mock_citems[0]
	end

	it "can deal with first" do
		expect( @sect.previous_for(@mock_citems[0])).to eq @mock_citems[0]
	end

	it "can deal with last" do
		expect( @sect.next_for(@mock_citems[1])).to eq @mock_citems[1]
	end


end


