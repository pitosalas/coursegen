require 'thor'
module CourseGen
  class CLI < Thor
    include Thor::Actions

    desc "Greet NAME", " Simply display name and prove that a command works at all"
    def help(name)
      puts "Hello #{name}!!"
    end

    desc "new COURSE", "Create a new course by calling nanoc. Argument is name of the COURSE"
    def new(course)
    end
  end
end
