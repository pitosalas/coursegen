require_relative "./spec_helper.rb"
describe Lectures do
	before do
		mocks1_templates = 
			[["/lectures/intro/wonders/", "subsection", 0],
			 	["/lectures/intro/wonders/page2/", "page", 1],
			 	["/lectures/intro/wonders/page3/", "page", 2],
			 ["/lectures/intro/wonder2/", "subsection", 1],
			 	["/lectures/intro/wonder2/page22/", "page", 1],
			 	["/lectures/intro/wonder2/page32/", "page",2 ]
			]
		@citems1 = mocks1_templates.map { |i, t, o| CItem.new(nil, i, t, o) }
		@sect = Lectures.new "intro", @citems1
	end

	it "correctly counts subsections" do
		expect(@sect.subsections.length).to eq 2
	end

	it "correctly handles next from page to page " do
		expect(@sect.next_for(@citems1[1])).to eq @citems1[2]
	end

	it "correctly handles prev from page to page " do
		expect(@sect.previous_for(@citems1[2])).to eq @citems1[1]
	end

	it "correctly handles prev from first page in section " do
		expect(@sect.previous_for(@citems1[1])).to eq @citems1[1]
	end

	it "correctly handles next from last page in section " do
		expect(@sect.next_for(@citems1[5])).to eq @citems1[5]
	end


	it "correctly handles next from subsection to subseciton" do
		expect(@sect.next_for(@citems1[0])).to eq @citems1[3]
	end

	it "correctly handles next from last subsection" do
		expect(@sect.next_for(@citems1[3])).to eq @citems1[3]
	end

	it { expect(@citems1[0].lecture_number).to eq 1 }
	it { expect(@citems1[1].lecture_number).to eq 1 }
	it { expect(@citems1[2].lecture_number).to eq 2 }
	it { expect(@citems1[3].lecture_number).to eq 3 }
	it { expect(@citems1[4].lecture_number).to eq 3 }
	it { expect(@citems1[5].lecture_number).to eq 4 }

end
