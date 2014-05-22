require 'thor'
require "coursegen/templates"

module CourseGen
  class CLI < Thor
    include Thor::Actions

    desc "new COURSE", "Create a new course by calling nanoc. Argument is name of the COURSE"
    def new(course)
      run("nanoc create-site #{course}")
    end

    desc "prepare", "Update with the latest coursegen code and templates."
    def prepare
      tplt = CourseGen::Templates.new
      tplt.copy_template_dir("layouts", "layouts")
      tplt.copy_template_dir("content/bootstrap", "content/bootstrap")
      tplt.copy_template_file("rules", "rules")
      tplt.copy_template_file("cg_config.rb", "cg_config.rb")
      tplt.copy_template_file("cg_config.rb_sample", "cg_config.rb_sample")
    end

    desc "compile", "build the course and put resultant site into output directory"
    def compile
      run("nanoc compile")
    end

    desc "serve", "start local web server to test the course web site"
    def serve
      run("nanoc view")
    end

    desc "reset", "reset all generated content to bring the course back to a base state."
    def reset
    end
    
    desc "view", "view course site locally in browser"
    def view
      run "open http://0.0.0.0:3000"
    end

  end
end
