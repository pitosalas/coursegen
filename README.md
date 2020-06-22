# Coursegen

Coursegen is a course curriculum site generator based on [nanoc](https://github.com/nanoc/nanoc), with support for sections, lectures, code examples, homeworks, course calendar and lots more.

## Work in progress

This gem is still under development. In the current form it can already be used but I will be adding more convenience features in the near future.

# Table of Contents

- [Install](#install)
  - [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
  - [Generating a blank course](#generating-a-blank-course)
  - [Adding course to Github (Optional)](#adding-course-to-github-optional)
  - [Adding a lecture](#adding-a-lecture)
  - [Developing locally](#developing-locally)
  - [Deploying to S3](#deploying-to-s3)
  - [Search](#search)
- [Configuration](#configuration)
- [Examples](#examples)
  - [Lectures](#lectures)
  - [Course Sites](#course-sites)
- [Features](#features)
  - [Slides](#slides)
- [Open Source Catalog of Topics](#open-source-catalog-of-topics)
- [Using course contents from another folder](#using-course-contents-from-another-folder)
- [License](#license)

## Install

### Prerequisites

Before installing Coursegen, make sure the following tools are installed.

- [Ruby >= 2.6](https://www.ruby-lang.org/en/documentation/installation/)
- [s3cmd](https://github.com/s3tools/s3cmd) (for deploying to AWS S3)

Using Coursegen is easy. Install the gem using rubygem.

```bash
gem install coursegen
```

## Getting Started

While you are welcome to provide your own organization, typically a Coursegen-based application will follow the following organizational structure:

```bash
├── Guardfile
├── Rules
├── cg_config.rb
├── cg_config.rb_sample
├── content
│   ├── bootstrap
│   ├── content
│   └── images
├── layouts
│   ├── banner.html.erb
│   ├── body_footer.html
│   ├── body_header.html.erb
│   └── ...
├── lib
│   └── default.rb
├── nanoc.yaml
└── output
```

### Generating a blank course

First, use `cg new` to create a new course named "MYCOURSE" locally containing the course skeleton.

```bash
cg new MYCOURSE
```

Next, go into the newly created directory and use `cg prepare` to load up the template and basics.

```bash
cd MYCOURSE; cg prepare
```

### Adding course to Github (Optional)

Follow [Github's instructions](https://help.github.com/en/github/importing-your-projects-to-github/adding-an-existing-project-to-github-using-the-command-line) to create a Github repo for the site.

### Adding a lecture

All the course's materials are located under `content/content`.

```bash
content
└── content
    ├── extras
    ├── index.md.erb
    ├── intro
    └── lectures
```

And inside of `lectures` you can find files named like this: `01_first_lecture.md.erb`. These are the lecture files. Each lecture is a erb file with a markdown syntax, here's a lecture example.

```erb
---
title: Second Lecture - Here we go
---
### Continuing
This page is the second one in the first part. It is the second lecture of the Sample Course.
```

See [Examples](#examples) for more details.

### Developing locally

Coursegen gives you the ability to see your changes on the fly using a combination of `cg compile`, `cg serve`, and `cg view`.

First, `cg compile` rebuilds the course static html, and save to `/output` based on the newest changes:

```bash
cg compile
```

Then, `cg serve` starts a local webserver running the compiled course site:

```bash
cg serve
```

Lastly, `cg view` opens up your web browser to see the latest change:

```bash
cg view
```

### Deploying to S3

Coursegen natively supports deploying the course site to AWS S3 service. Before proceeding, makes sure `s3cmd` is installed and correctly configured ([Instructions for setting up](https://github.com/s3tools/s3cmd#simple-s3cmd-howto)).

To host the course site on S3, you need to create a S3 bucket. Follow [this guide](https://docs.aws.amazon.com/AmazonS3/latest/user-guide/static-website-hosting.html) for creating a S3 bucket.

After the S3 bucket is created, you can deploy the course site using `cg deploy`. `AWS_BUCKET` is the name of the S3 bucket.

```bash
AWS_BUCKET="cosi165-2014" cg deploy
```

### Search

Coursegen uses [DocSearch by Algolia](https://docsearch.algolia.com/) to power its search. DocSearch is an external service that indexes the site, and provides search functionality through their API.

1. Create an application on Algolia (Community Plan is enough for our use case), note the `Application ID`.
2. Create an index named "search", `Indices -> Create Index`.
3. Note the Search-Only API Key `API Keys -> Your API Keys`.

Update the following block in `cg_config.rb`,

```ruby
SEARCH_CONFIG = {
  api_key: '<API_KEY>',
  index_name: 'search',
  app_id: '<APP_ID>',
  debug: false
}
```

## Configuration

The list of configuration directives, and their meaning and intended usage is available in the self documented `cg_config.rb`.

## Examples

### Lectures

```erb
---
title: Plan of Attack
---
<%= homework_hdr %>
* How does a browser process a URL? When I type http://www.salas.com:8080/toplevel?p=1 what happens inside the browser, what actions does it take, what messages does it send out, what messages does it receive? <%= deliverable "Research this on the web or in books and come up with a numbered list of actions, with each step in the list being a link to a source on the web that you used to figure that out." %>
* <%= deliverable "Programming Assignment 2" %> (Look at <%= link_to_pa :PA2 %> for details) <%= nb ": Extension! Post wherever you are so far, indicate whether you are done or not (to let us know to look at it) but you have until Monday Feb 3 to hand this in." %>

#### Discussion
* Ruby Homework tips
	* Narrate your screencasts
	* Run from the command line, not irb or pry
	* Try to make the output legible not just a screen full of numbers!
	* 1 or 2 Ruby Questions
	* How 'require' works, and require_relative

#### Products: Plan of Attack

##### Iter2 - "Hello World"
* Prepare "dossier" for reviewer as a Google Drive
	* Paper prototype
	* Screen Flows
	* Schema in detail
	* Pivotal tracker with lots of stories, prioritized
	* Identify and research 'difficult tech issues'
* Complete Model
* Initial set of controller and views
* authentication
* Initial build

##### Iter 3 -  "Pre-Alpha"
* Update "dossier", meet with reviewer
* Cloud deployment
* Unit testing
* Feature work
* Prettier html, css, javascript
* Integration testing
* Continuous integration

##### Iter 4 - "MVP"
* Update "dossier", meet with reviewer
* Initial beta users, get feedback
* Complete MVP feature set
* Beautiful user interface

##### Iter 4 - "Unveiling"
* Update "dossier", meet with reviewer
* Final touches
* Presentations

#### Iter2: In more detail
* Each team tee up a discussion about your product
* <%= discussion "What are \"difficult technical issues?\"" %>
* <%= discussion "Reviewers" %> (<%= link_to_incubator :reviewer %>)

#### Look at next class
* Review Paper Prototyping homework for: <%= link_to_lecture :dossier %>
```

For more complex example of lectures see [here](https://github.com/pitosalas/cosi236b/tree/master/lectures).

### Course sites

- An simple example: <https://github.com/pitosalas/jbscosi2014>
- A complex example (but based on a previous version): <https://github.com/pitosalas/cosi236b>
- The resultant web site: <https://bit.ly/cosi236b>

## Features

### Slides

*!!! Slides generation is currently in preview stage !!!*

To enable slides generation in a specific lecture, add `slides: true` to the header of the markdown file.

```markdown
---
title: Some Lecture
slides: true
---
...
```

Coursegen uses the tag `<%= slide %>` to properly separate each slide.

```erb
# Slide 1
* some lines
* some lines

<%= slide %>

# Slide 2
* some lines
```

To disregard some content from rendering into the slides, add the html element into `cg_config.rb`.

```ruby
SLIDES_CONFIG = {
  # This ignores any element that is <h4>
  ignore_selector: ['h4']
}
```

## Open Source Catalog of Topics

Coursegen comes with a large, shared catalog of topics. Depending on what you teach you may or may not find useful content there. Over time we hope to broaden this catalog. You can review the current set of topics here: <https://github.com/pitosalas/coursegen-topics>

## Using course contents from another folder

Coursegen allows course contents to be located outside of the site folder. This is the preferred pattern, used by most coursegen courses.

To connect them together, simply add a symbolic link between the course and the contents:

```bash
cd MYCOURSE/content
ln -s TOPICDIR .
```

## License

Coursegen is released under the MIT license. See [LICENSE.txt](LICENSE.txt)
