require 'thor'
require "coursegen/templates"

module CourseGen
  class CLI < Thor
    include Thor::Actions

    desc "new COURSE", "Create a new course by calling nanoc. Argument is name of the COURSE"
    def new(course)
      run("nanoc create-site #{course}")
    end

    desc "Prepare the course directory.", "Update with the latest coursegen code and templates."
    def copy_templates
      tplt = CourseGen::Templates.new
      tplt.copy_dir("layouts", "layouts")
      tplt.copy_dir("content/bootstrap", "content/bootstrap")
    end

    def compile
      run("nanoc compile")
    end

    def serve
      run("nanoc serve")
    end

    def reset
    end

  end
end
