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

    def copy_template_dir from, to
      directory("templates/#{from}", "#{to}")
    end

    def copy_template_file from, to
      template("templates/#{from}", "#{to}")
    end

    def delete_target_file(to)
      remove_file(to)
    end
  end
end
