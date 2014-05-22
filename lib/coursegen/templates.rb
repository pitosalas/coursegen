require 'pry'

module CourseGen
  class Templates < Thor::Group
    include Thor::Actions

    def generate_all
      copy_template_dir("layouts", "layouts")
      copy_template_dir("content/bootstrap", "content/bootstrap")
      copy_template_dir("content/content", "content/content")
      copy_template_dir("lib", "lib")
      copy_template_file("rules", "rules")
      copy_template_file("cg_config.rb", "cg_config.rb")
      copy_template_file("cg_config.rb_sample", "cg_config.rb_sample")
      delete_target_file("content/stylesheet.css")
      delete_target_file("content/index.html")
    end

    def valid_cg_directory?
      valid = true
      list = ["Rules", "cg_config.rb", "nanoc.yaml", "content", "lib"]
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
