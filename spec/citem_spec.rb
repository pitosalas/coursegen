require_relative "./spec_helper.rb"

class NIMock
  attr_reader :identifier
  def initialize nm, order, section
    @identifier = nm
    @order = order
    @section = section
  end

  def [](arg)
    case arg
    when :order
      @order
    when :section
      @section
    else
      nil
    end
  end
end

describe "null Case" do
  before(:each) do
    @ni = NIMock.new('/content/lectures/iter4/db_design/', 7, "lectures")
    @ci = CItem.new(@ni)
  end
  it "works as expected" do
    expect(@ci.title).to eq("db_design")
    expect(@ci.section).to eq("lectures")
    expect(@ci.short_name).to eq("db_design")
    expect(@ci.subsection).to eq("/content/lectures/iter4/")
    expect(@ci.order).to eq(7)
  end
end

describe "more complicated cases" do

  CASES = [
    ['/content/intro/term_overview/', 7, "intro", "term_overview", "intro", 7, "/content/intro/"],
    ['/content/intro/001_term_overview/', nil, "intro", "term_overview", "intro", 1, "/content/intro/"],
    ['/content/lectures/iter2/02_db_design/', 7, "lectures", "db_design", "lectures", 7, "/content/lectures/iter2/"],
    ['/content/', 7, "lectures", "content", "lectures", 7, "//"],
  ]

  context "table driven cases" do
    CASES.each do |c|
      ni = NIMock.new(c[0], c[1], c[2])
      ci = CItem.new(ni)

      it { expect(ci.title).to eq c[3]}
      it { expect(ci.section).to eq c[4]}
      it { expect(ci.order).to eq c[5]}
      it { expect(ci.subsection).to eq c[6]}
    end
  end
end
