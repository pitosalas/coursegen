require 'coursegen'

# Copyright string
COPYRIGHT_STRING = "Copyright (2013-#{Time.now.year}) R. Pito Salas, pitosalas@gmail.com".freeze

# Course name
COURSE_SHORT_NAME = 'Sample Course'.freeze
COURSE_LONG_NAME = 'Sample Coursegen Course'.freeze
COURSE_ABBREV = 'SC'.freeze

LECTURES_SCHEDULE_CONFIG = ScheduleDef.new(
  first_day: 'jan-17-2017',
  weekdays: %i[tuesday wednesday thursday],
  start_times: %w[15:30 14:00 15:30],
  end_times: %w[16:50 16:00 16:50],
  number: 39,
  start_time: '15:30',
  end_time: '16:50',
  skips: %w[feb-9-2017 feb-21-2017 feb-22-2017 feb-23-2017 apr-11-2017 apr-12-2017 apr-13-2017 apr-18-2017 apr-19-2017]
)

# Sections in the right hand margin of the page
SECTION_CONFIG = [
  SectionDef.new('Intro', 'intro', type: :section),
  SectionDef.new('Lectures', 'lectures', type: :lecture, schedule: LECTURES_SCHEDULE_CONFIG),
  SectionDef.new('Extras', 'extras', hidden: true, type: :section)
].freeze

# Options are
# bullet_style: css style for each bullet
STYLING_CONFIG = {
  bullet_style: '"font-size: 60%; width: 10px; color: grey"'
}.freeze
HELPFUL_BOX = false
HOME_PAGE = '/content/index.md.erb'.freeze
MENULINKS = [%w[TOC /content/intro/course_toc.md/],
             %w[Welcome /content/intro/welcome.md/],
             %w[Extra /content/extras/extra_content.md/]].freeze

# Search
SEARCH_CONFIG = {
  api_key: '',
  index_name: '',
  # App_ID is only used when running crawler locally.
  app_id: '',
  debug: false
}.freeze
