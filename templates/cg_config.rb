require 'coursegen'

# Copyright string
COPYRIGHT_STRING = "Copyright (2013-2014) R. Pito Salas, pitosalas@gmail.com"

# Course short name
COURSE_SHORT_NAME = "Sample Course"
COURSE_LONG_NAME = "Sample Coursegen Course"
COURSE_ABBREV = "SC"

LECTURES_SCHEDULE_CONFIG = ScheduleDef.new(
  first_day: "jan-17-2017",
  weekdays: [:tuesday, :wednesday, :thursday],
  start_times: ["15:30", "14:00", "15:30"],
  end_times: ["16:50", "16:00", "16:50"],
  number: 39,
  start_time: "15:30",
  end_time: "16:50",
  skips: ["feb-9-2017", "feb-21-2017", "feb-22-2017", "feb-23-2017", "apr-11-2017", "apr-12-2017", "apr-13-2017", "apr-18-2017", "apr-19-2017"])

# Sections in the right hand margin of the page
SECTION_CONFIG = [
  SectionDef.new("Intro", "intro", type: :section),
  SectionDef.new("Lectures", "lectures", type: :lecture, schedule: LECTURES_SCHEDULE_CONFIG),
  SectionDef.new("Extras", "extras", hidden: true, type: :section)
]
# Options are:
# bullet_style: css style for each bullet
STYLING_CONFIG = {bullet_style: "\"font-size: 60%; width: 10px; color: grey\""}
