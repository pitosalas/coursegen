require_relative "./spec_helper.rb"
describe "Does it work?" do
  before do
    @abc = 1
    mocks1_templates =
      [["/lectures/intro/wonders/", "subsection", 0],
      ["/lectures/intro/wonders/page2/", "page", 1],
      ["/lectures/intro/wonders/page3/", "page", 2],
      ["/lectures/intro/wonder2/", "subsection", 1],
      ["/lectures/intro/wonder2/page22/", "page", 1],
      ["/lectures/intro/wonder2/page32/", "page", 2]]
    @citems1 = mocks1_templates.map { |i, t, o| CItem.new(nil, i, t, o) }
    @sect = Lectures.new "intro", @citems1
  end

  it "correctly counts subsections" do
    expect (@abc).to eq 1
  end
end
