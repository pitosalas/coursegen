class SearchIndex
  attr_reader :index
  def initialize all_items
    all_citems = all_items.map { |itm| Toc.instance.n2c(itm) }
    skiplist = Regexp.union([/\/search_index\/.*/, /\/bootstrap\/.*/, /\/config\/.*/, /\/tipuesearch\/.*/])
    @index = all_citems.select { |citem| citem.type == "page" && !citem.nitem.binary? && !citem.identifier.match(skiplist)}.map do
      |item|
#        puts "indexing: #{item.title}, match: #{item.identifier.match(skiplist) ? "true" : "false"}"
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
end