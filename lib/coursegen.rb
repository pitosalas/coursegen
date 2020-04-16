# frozen_string_literal: true

require 'nokogiri'

require 'coursegen/version'
require 'coursegen/course/helpers/sidebar_helpers'
require 'coursegen/course/helpers/lecture_helpers'
require 'coursegen/course/helpers/content_helpers'
require 'coursegen/course/helpers/logging_helpers'
require 'coursegen/course/helpers/list_of_helpers'
require 'coursegen/course/helpers/formatting_helpers'
require 'coursegen/course/helpers/bootstrap_markup'
require 'coursegen/course/helpers/table_helpers'
require 'coursegen/course/helpers/navigation_helpers'
require 'coursegen/course/data/section'
require 'coursegen/course/data/toc'
require 'coursegen/course/data/citem'
require 'coursegen/course/schedule/schedule_def'
require 'coursegen/course/data/section_def'
require 'coursegen/course/schedule/scheduler'
require 'coursegen/course/schedule/schedule_feed'
require 'coursegen/course/data/lectures'
require 'coursegen/course/lib/search_data_generator'
require 'coursegen/course/data/data_adaptor'
require 'coursegen/course/lib/ical_adaptor'
require 'coursegen/course/helpers/list_of'
require 'coursegen/course/helpers/ical_feed_helpers'
require 'coursegen/course/lib/helpers_'

# Coursegen is a course curriculum site generator based on nanoc, with
# support for sections, lectures, code examples, homeworks, course
# calendar and lots more.
module Coursegen
end
