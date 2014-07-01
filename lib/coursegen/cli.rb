require 'thor'
require 'coursegen/templates'

module CourseGen
  class CLI < Thor
    include Thor::Actions

    desc "new COURSE", "Create a new course by calling nanoc. Argument is name of the COURSE"
    def new(course)
      run("nanoc create-site #{course}")
    end

    desc "prepare", "Update with the latest coursegen code and templates."
    def prepare
      check_valid_directory
      tplt = CourseGen::Templates.new
      tplt.generate_all
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
      run "rm -frd tmp"
      run "rm -frd output"
    end

    desc "view", "view course site locally in browser"
    def view
      run "open http://0.0.0.0:3000"
    end

    desc "deploy", "Deploy course to S3"
    def deploy
      run "s3cmd sync --delete-removed output/ s3://#{AWS_BUCKET}/"
    end

    no_commands do
      def check_valid_directory
        CourseGen::Templates.new.valid_cg_directory? ? 
          say("Valid cg directory") :
          error("Invalid cg directory")
      end
    end
  end
end
