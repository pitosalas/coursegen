require 'pry'

module CourseGen
  class Templates < Thor::Group
    include Thor::Actions

    def self.source_root
      Pathname.new(File.dirname(__FILE__)).parent.parent.to_s
    end

    def initialize
      super
      destination_root = Dir.getwd
    end

    def copy_dir from, to
      puts "[Copying templates from #{from} to #{to}]"
      directory("boilerplate/#{from}", "content/#{to}")
    end


    def copy_test_files
      puts "[copying test boilerplate!]"
      template "boilerplate/test/readme.tt"
    end

    def copy_directory source_directory
      puts "[copying directory #{source_directory}]", @dest
      directory(source_directory, "content/", wow: 1000)
    end
  end
end
