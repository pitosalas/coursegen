class SearchIndex
  attr_reader :index
  def initialize all_items
    all_citems = all_items.map { |itm| Toc.instance.n2c(itm) }
    @index = all_citems.select { |citem| include_in_index? (citem)}.map do
      |item|
        nok_parse = Nokogiri::HTML(item.nitem.compiled_content).at('body')
        nok_parse_inner_text = nok_parse.nil? ? "" : nok_parse.inner_text
        { title:  clean_string(item.title),
          text:   clean_string(nok_parse_inner_text),
          tags:   "",
          loc:  item.nitem.rep_named(:default).path }
    end
  end

  def clean_string str
    str.nil? ? "" : str.gsub(/(\s+|\"|\“|\”)/, " ")
  end

  def include_in_index?(citem)
    skiplist = Regexp.union([/\/tipuesearch_logic\/.*/, /\/bootstrap\/.*/, /\/config\/.*/, /\/tipuesearch\/.*/])
    citem.type == "page" && 
      !citem.nitem.binary? &&
      !citem.identifier.match(skiplist)  
  end

end