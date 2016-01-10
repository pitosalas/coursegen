module ContentHelpers

  def include_topic item_symbol
      incorporated_topic = lookup_nitem("topics", item_symbol.to_s)
#      Toc.instance.record_inclusion @item, incorporated_topic
      items[incorporated_topic.identifier.to_s].compiled_content
  end

  def include_from_section sect_symbol, item_symbol
    incorporated_item = lookup_nitem(sect_symbol.to_s, item_symbol.to_s)
    Toc.instance.record_inclusion @item, incorporated_item
    items[incorporated_item.identifier.to_s].compiled_content
  end

  def lookup_nitem the_sect, short_name
    citem = Toc.instance.lookup_citem(the_sect, short_name).nitem
  end

  def link_to_doc label, file_name
      "<a href=\"/docs/#{file_name}\">#{label}</a>"
  end

  def toc_link_to item
      link_to_unless_current item[:title], item
  end

  def bold_red string
      "<span style=\"color: red; font-style: italic;\">#{string}</span>"
  end

  def italic_red string
      " *#{string}*{: style=\"color: red\"} "
  end

  def ir string; italic_red(string); end

  def callout title, body, format=nil
    template_string = <<-HTMLSTRING
<div class="well well-sm">
<span class="label label-primary">#{title}</span>#{body}
</div>
HTMLSTRING
  end

  def include_image_old string, extra_class: nil
    css_class = "img-responsive"
    css_class += " img-"+extra_class unless extra_class.nil?

    "<img src=\"/content/images/#{string}\" class=\"%s\" />"  % css_class
  end

  def include_image filename_string, width: 8
  template_string = <<-HTMLSTRING
<div class="row">
  <div class="col-md-offset-2 col-md-#{width}">
    <img src="#{filename_string}" class="img-responsive img-thumbnail" />
  </div>
</div>
  HTMLSTRING
  end

  def important string=":"
      "**Important#{string}**{: style=\"color: red\"}"
  end

  def nb string=""
      "*NB: #{string}*{: style=\"color: green\"}"
  end

  def tbd string=""
      "*[TO BE DETERMINED#{string}]*{: style=\"color: red\"}"
  end

  def deliverable string
      "*Deliverable:*{: style=\"color: red\"} *#{string}*"
  end

  def team_deliverable string
      "*Team Deliverable:*{: style=\"color: red\"} *#{string}*"
  end

  def discussion string
      "*Discussion:*{: style=\"color: blue\"} *#{string}*"
  end

  def homework_hdr
    "#### Homework due for today"
  end

  def carousel(filenames)
    body = %~<div id="myCarousel" class="carousel slide" style="width: 500px; margin: 0 auto;">
            <div class="carousel-inner" style="margin: 20px; ">~
    counter = 0
  filenames.each do
    |nam|
    if counter == 0
        body << %~<div class="item active">~
    else
        body << %~<div class="item">~
    end
    body << %~<img src="~
    body << "/content/images/#{nam}"
    body << %~" class="img-polaroid" alt=""></div>~
    counter += 1
  end
    body << %~</div> <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a>
            </div>~
    body
  end

  def carousel_new(filenames)
    carousel_work(filenames.map {|filename| "/content/topics/images/"+filename })
  end

 def carousel_work(filenames)
  body = %~<div id="myCarousel" class="carousel slide" style="width: 500px; margin: 0 auto;">
            <div class="carousel-inner" style="margin: 20px; ">~
  counter = 0
  filenames.each do
    |nam|
    if counter == 0
        body << %~<div class="item active">~
    else
        body << %~<div class="item">~
    end
    body << %~<img src="~
    body << nam
    body << %~" class="img-polaroid" alt=""></div>~
    counter += 1
  end
    body << %~</div> <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a>
            </div>~
    body
  end


  def ruby_begin
      "\n~~~~~~"
  end

  def ruby_end
      "~~~~~~\n {: .language-ruby}"
  end

  def ruby_string (str)
      ruby_begin + "\n" +  str + "\n" + ruby_end
  end

  def include_ruby name
    filename = Dir.pwd+"/content/content/topics/scripts/"+name.to_s+".rb"
    filecontents = File.new(filename).read
    ruby_string filecontents
  end

  def code_begin
      "\n~~~~~~"
  end

  def code_end
      "~~~~~~\n"
  end

  def code_string (str)
    code_begin + "\n" + str + code_end
  end

  def include_code name
    filename = Dir.pwd+"/content/content/topics/scripts/"+name
    filecontents = File.new(filename).read
    code_string filecontents
  end



end
