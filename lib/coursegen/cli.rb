require 'thor'
require "coursegen/boilerplate"
require "coursegen/templates"


module CourseGen
  class CLI < Thor
    include Thor::Actions

    desc "greet NAME", " Simply say hello to NAME and prove that a command works at all"
    def greet(name)
      puts "Hello #{name}!!"
    end

    desc "new COURSE", "Create a new course by calling nanoc. Argument is name of the COURSE"
    def new(course)
      run("nanoc create-site #{course}")
    end

    desc "test command", "Handy testing command"
    def test
      tplt = CourseGen::Templates.new
      tplt.copy_dir("content", "content")
      #CourseGen::BoilerPlate.new.copy_test_files
      #CourseGen::BoilerPlate.new.copy_directory("boilerplate/content")
    end
  end
end
