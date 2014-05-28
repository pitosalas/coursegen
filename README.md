# Coursegen

Generates course curriculum web sites with support for sections, lectures, code examples, homeworks, course calendar and lots more.

# Work in progress

This gem is still under development. In the current form it can already be used but I will be adding more convenience features in the near future.

# Steps to building a new course

* install the gem, `gem install coursegen`
* generate a blank course site `gem new MYCOURSE`. This will create a local directory called MYCOURSE containing the skeleton
* `cd MYCOURSE`
* Load up the template and basics into the newly created directory `cg prepare`
* Modify the configuration of the course by editing the file `cg_config.rb`. You can look at a complicated example to see some of the things that are possible: `cg_config.rb_sample`

# Steps to develop the course 
* Add your course content as new files into the content/ directory
* Rebuild the course static html: `cg compile`
* Start a local server for testing: `cg serve`
* Open your web browser to look at the course: `cg view`
* Rinse, dry and repeat

# Steps for deploying the course
* The /output directory is a complete self-contained static html site. You can deploy it anywhere.
* I recommend Amazon S3 for a free site

# Examples
* A simple example: https://github.com/pitosalas/jbscosi2014
* A complex example (but based on a previous version): https://github.com/pitosalas/cosi236b
* The resultant web site: bit.ly/cosi236b
