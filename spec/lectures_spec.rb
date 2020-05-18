require_relative './spec_helper.rb'

describe Lectures do
  before do
    mocks1_templates =
      [['/lectures/intro/wonders/index.html', 'subsection', 0],
       ['/lectures/intro/wonders/page2.md.erb', 'page', 1],
       ['/lectures/intro/wonders/page3.md.erb', 'page', 2],
       ['/lectures/intro/wonder2/index.html', 'subsection', 1],
       ['/lectures/intro/wonder2/page22.md.erb', 'page', 1],
       ['/lectures/intro/wonder2/page32.md.erb/', 'page', 2]]
    @citems1 = mocks1_templates.map { |i, t, o| CItem.new(nil, i, t, o) }
    @schd = Scheduler.new
    @schd.setup_from_args(
      start: 'jan-17-2017',
      weekdays: %i[tuesday wednesday thursday],
      start_times: %w[15:30 14:00 15:30],
      end_times: %w[16:50 16:00 16:50],
      number: 39,
      start_time: '15:30',
      end_time: '16:50',
      skips: %w[feb-9-2017 feb-21-2017 feb-22-2017 feb-23-2017 apr-11-2017
                apr-12-2017 apr-13-2017 apr-18-2017 apr-19-2017]
    )
    @sect = Lectures.new('intro', @citems1, @schd)
  end

  it 'correctly counts subsections' do
    expect(@sect.subsections.length).to eq 2
  end

  it 'correctly handles next from page to page' do
    expect(@sect.next_for(@citems1[1])).to eq @citems1[2]
  end

  it 'correctly handles prev from page to page' do
    expect(@sect.previous_for(@citems1[2])).to eq @citems1[1]
  end

  it 'correctly handles prev from first page in section' do
    expect(@sect.previous_for(@citems1[1])).to eq @citems1[1]
  end

  it 'correctly handles next from last page in section' do
    expect(@sect.next_for(@citems1[5])).to eq @citems1[5]
  end

  it 'correctly handles next from subsection to subsecton' do
    expect(@sect.next_for(@citems1[0])).to eq @citems1[3]
  end

  it 'correctly handles next from last subsection' do
    expect(@sect.next_for(@citems1[3])).to eq @citems1[3]
  end

  it { expect(@citems1[0].lecture_number).to eq 1 }
  it { expect(@citems1[1].lecture_number).to eq 1 }
  it { expect(@citems1[2].lecture_number).to eq 2 }
  it { expect(@citems1[3].lecture_number).to eq 3 }
  it { expect(@citems1[4].lecture_number).to eq 3 }
  it { expect(@citems1[5].lecture_number).to eq 4 }
end
