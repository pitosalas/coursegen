# Coursegen

Generates course curriculum web sites with support for sections, lectures, code examples, homeworks, course calendar and lots more.

# Work in progress

This gem is still under development. In the current form it can already be used but I will be adding more convenience features in the near future.

# Steps to building a new course

### Install 
* install the gem, `gem install coursegen`

### Generate Blank Course
* generate a blank course site `gem new MYCOURSE`. This will create a local directory called MYCOURSE containing the skeleton
* `cd MYCOURSE`
* Load up the template and basics into the newly created directory `cg prepare`
* Modify the configuration of the course by editing the file `cg_config.rb`. You can look at a complicated example to see some of the things that are possible: `cg_config.rb_sample`

### Add it to github (optional)
* Create a new github repo with the course name
* `cd MYCOURSE; git init`
* Follow Github instructions to push the first commit up to github

### Steps to develop the course 
* Add your course content as new files into the content/ directory
* Rebuild the course static html: `cg compile`
* Start a local server for testing: `cg serve`
* Open your web browser to look at the course: `cg view`
* Rinse, dry and repeat

### Steps for deploying the course
* The /output directory is a complete self-contained static html site. You can deploy it anywhere.
* I recommend Amazon S3 for a free site

### Create an S3 instance to host the site (optional)
* Log into aws.amazon.com and look for the management console for S3
* Create a new bucket. Call it whatever you want.
* Look in the properties and choose "Static Website Hosting". Enable it and set index.html as your index document
* Make a note of the "endpoint url"
* Click on permissions/add more permissions
* Choose Grantee: Everyone; And "list" and no others
* Click "Edit Bucket Policy". Paste this into your bucket policy and save. Notice you have to edit "yourbucketname" to be your bucket name

    {
      "Version": "2008-10-17",
      "Id": "Policy1",
      "Statement": [
        {
          "Sid": "Stmt1",
          "Effect": "Allow",
          "Principal": {
            "AWS": "*"
          },
          "Action": "s3:GetObject",
          "Resource": "arn:aws:s3:::yourbucketname/*"
        }
      ]
    }

### Deploy to S3 (optional)
* I've used `s3cmd` with great success. You can find it at s3tools.org. Follow their instructions to install it.
* Configure your course to point to the bucket you just created. Notice, we are using the bucket name not the url: `AWS_BUCKET = "cosi165-2014"`

### Examples
* A simple example: https://github.com/pitosalas/jbscosi2014
* A complex example (but based on a previous version): https://github.com/pitosalas/cosi236b
* The resultant web site: bit.ly/cosi236b

## Open Source Catalog of Topics
CourseGen comes with a large, shared catalog of topics. Depending on what you teach you may or may not find useful content there. Over time we hope to broaden this catalog. You can review the current set of topics here: https://github.com/pitosalas/coursegen-topics

### Step by step
* First clone the topic directory to your local drive: `git clone git@github.com:pitosalas/coursegen-topics.git`
* Add a symbolic link between your course and the newly cloned directory. For example you might do this:
    cd MYCOURSE/content
    ln -s TOPICDIR .
   

