# frozen_string_literal: true

require 'thor'
require 'coursegen/templates'
require 'nanoc'
require './cg_config.rb' if File.exist? 'cg_config.rb'

module CourseGen
  # Class CLI provides a command line utility for creating, building, and
  # deploying a Coursegen site.
  class CLI < Thor
    include Thor::Actions

    # New creates a new nanoc site.
    #
    # By default, the new site does not contain any course template.
    # To generate a course template within the newly created nanoc site,
    # run: `cg prepare`.
    #
    # See: https://nanoc.ws/doc/reference/commands/#create-site
    desc 'new COURSE',
         'Create a new course by calling nanoc. Argument is name of the COURSE'
    def new(course)
      run("nanoc create-site #{course}")
    end

    # Prepare generates a new course template within a nanoc site.
    desc 'prepare',
         'Update with the latest coursegen code and templates.'
    def prepare
      check_valid_directory
      tplt = CourseGen::Templates.new
      tplt.generate_all
    end

    # Compile builds the course site and outputs it to a local directory.
    #
    # By default, it outputs the course site to ./output.
    #
    # See: https://nanoc.ws/doc/reference/commands/#compile
    desc 'compile',
         'build the course and put resultant site into output directory'
    def compile
      run 'nanoc compile'
    end

    # Serve starts a static web server that serves the course site.
    #
    # By default, the web server serves from ./output.
    #
    # See: https://nanoc.ws/doc/reference/commands/#view
    desc 'serve',
         'start local web server to test the course web site'
    def serve
      run 'nanoc view'
    end

    # Reset removes all generated contents.
    desc 'reset',
         'reset all generated content to bring the course back to a base state.'
    def reset
      run 'rm -frd tmp'
      run 'rm -frd output'
    end

    # View opens an browser to the running course site.
    desc 'view',
         'view course site locally in browser'
    def view
      run 'open http://0.0.0.0:3000'
    end

    # Deploy deploys the course site to AWS S3.
    #
    # Note: `s3cmd` needs to be properly setup before this can work. Refer
    # to README.md for detailed instructions.
    desc 'deploy',
         'Deploy course to S3'
    def deploy
      run "s3cmd sync --delete-removed output/ s3://#{AWS_BUCKET}/"
    end

    no_commands do
      def check_valid_directory
        if CourseGen::Templates.new.valid_cg_directory?
          say 'Valid cg directory'
        else
          error 'Invalid cg directory'
        end
      end
    end
  end
end
