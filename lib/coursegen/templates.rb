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
      directory("templates/#{from}", "#{to}")
    end

    def copy_file from, to
      binding.pry
      template("templates/#{from}", "#{to}")
    end
  end
end
