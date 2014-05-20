require 'thor'
module CourseGen
  class CLI < Thor

    desc "Help name", " Simply display name and prove that a command works at all"
    def help(name)
      puts "Hello #{name}!!"
    end
  end
end
