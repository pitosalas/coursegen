# frozen_string_literal: true

# Coursegen configuration file.
#
# Note that in order to read the configuration file, this file must be at the
# root of the course directory.
require 'coursegen'

# AUTHOR
AUTHOR_NAME = 'R. Pito Salas'
AUTHOR_EMAIL = 'pitosalas@gmail.com'
COPYRIGHT_STRING = "Copyright (2013-#{Time.now.year}) #{AUTHOR_NAME}, #{AUTHOR_EMAIL}"

# COURSE
COURSE_SHORT_NAME = 'Sample Course'
COURSE_LONG_NAME = 'Sample Coursegen Course'
COURSE_ABBREV = 'SC'

# Lectures_schedule defines the schedule of lectures.
#
# This is primarily used to 1) figure out the time and date of each class,
# and 2) figure out the ordering of classes on the sidebar.
LECTURES_SCHEDULE_CONFIG = ScheduleDef.new(
  first_day: 'jan-17-2017',
  weekdays: %i[tuesday wednesday thursday],
  start_times: %w[15:30 14:00 15:30],
  end_times: %w[16:50 16:00 16:50],
  number: 39,
  start_time: '15:30',
  end_time: '16:50',
  skips: %w[feb-9-2017 feb-21-2017 feb-22-2017
            feb-23-2017 apr-11-2017 apr-12-2017
            apr-13-2017 apr-18-2017 apr-19-2017]
)

# Section_config defines the structure of the course.
#
# Each section is defined by
#   title     name of the section
#   selector  directory of the section (under /content)
#   type      type of the section (:section or :lecture)
#   schedule  schedule of the lecture (only needed for :lecture)
#
# Additionally, you can choose to hide the section on the sidebar by setting
# hidden: true.
SECTION_CONFIG = [
  SectionDef.new('Intro', 'intro', type: :section),
  SectionDef.new('Lectures', 'lectures', type: :lecture, schedule: LECTURES_SCHEDULE_CONFIG),
  SectionDef.new('Extras', 'extras', hidden: true, type: :section)
].freeze

# SITE
#
# The URL of the deployed site.
# Please include any http or https prefix.
SITE_URL = 'http://localhost:3000/'

# Home_page sets the home page of the site.
# This is usually /content/index.md.erb.
#
# Note: the .erb suffix is required when setting the HOME_PAGE path.
HOME_PAGE = '/content/index.md.erb'

# Menulinks defines the links on the navigation bar.
# They are formatted as "Name" - "URL" pair.
#
# Examples:
#   %w[HOME /content/index.md]
#   %w[TOC /content/course_toc.md]
MENULINKS = [%w[TOC /content/intro/course_toc.md/],
             %w[Welcome /content/intro/welcome.md/],
             %w[Extra /content/extras/extra_content.md/]].freeze

# Helpful_box provides a feedback box on the sidebar.
#
# DO NOT USE. This is currently not functional.
HELPFUL_BOX = false

# STYLING
#
# Options:
#   bullet_style: css style for each bullet
STYLING_CONFIG = {
  bullet_style: '"font-size: 60%; width: 10px; color: grey"'
}.freeze

# SEARCH
#
# Coursegen uses DocSearch by Algolia (https://docsearch.algolia.com/) to
# provide site-wide full-text search functionality.
#
# In order for search to function, you need to replace with your own
# search API key, and name of your index from Algolia.
# For details, please refer to https://github.com/pitosalas/coursegen/blob/master/README.md.
SEARCH_CONFIG = {
  api_key: '25626fae796133dc1e734c6bcaaeac3c',
  index_name: 'docsearch',
  # APP_ID is only used if you are running DocSearch on your own.
  app_id: '',
  debug: false
}.freeze
