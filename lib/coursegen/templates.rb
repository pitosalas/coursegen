require 'pry'

module CourseGen
  class Templates < Thor::Group
    include Thor::Actions

    def generate_all
      copy_template_dir("layouts", "layouts")
      copy_template_dir("content/bootstrap", "content/bootstrap")
      copy_template_dir("content/content", "content/content")
      copy_template_dir("content/chalkmark", "content/chalkmark")
      delete_target_file("lib/default.rb")
      copy_template_dir("lib", "lib")
      delete_target_file("Rules")
      copy_template_file("Rules", "Rules")
      copy_template_file("cg_config.rb", "cg_config.rb")
      copy_template_file("cg_config.rb_sample", "cg_config.rb_sample")
      delete_target_file("content/stylesheet.css")
      delete_target_file("content/index.html")
      delete_target_file("layouts/default.html")
      create_empty_dir("content/images")
    end

    def valid_cg_directory?
      valid = true
      list = ["Rules", "nanoc.yaml", "content", "lib", "cg_config.rb"]
      list.each do |filename|
        if !File.exists?(filename)
          valid = false
          say("Required file not found: #{filename}")
        end
      end
      valid
    end

    def self.source_root
      Pathname.new(File.dirname(__FILE__)).parent.parent.to_s
    end

# invoke methods from Thor::Actions
    def initialize
      super
      destination_root = Dir.getwd
    end

    def create_empty_dir to
      empty_directory(to)
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
