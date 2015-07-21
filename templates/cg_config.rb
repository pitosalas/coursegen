require 'coursegen'

# Copyright string
COPYRIGHT_STRING = "Copyright (2013-2014) R. Pito Salas, pitosalas@gmail.com"

# Course short name
COURSE_SHORT_NAME = "Cosi 000"
COURSE_LONG_NAME = "Not a course"

# Sections in the right hand margin of the page
SECTION_CONFIG = [
  SectionDef.new("Background", "background", type: :section),
  SectionDef.new("Hidden", "hidden", hidden: true, type: :section)
]
# Options are:
# bullet_style: css style for each bullet
STYLING_CONFIG = {bullet_style: "\"font-size: 60%; width: 10px; color: grey\""}
