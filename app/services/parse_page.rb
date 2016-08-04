require 'nokogiri'
require 'open-uri'

class ParsePage

  attr_reader :doc, :search_tags

  def initialize page
    @page = page
    @doc = Nokogiri::HTML(open(page.url))
    @search_tags = Tag.kinds.keys
  end

  def parse!
    @search_tags.each do |tag_type|
      @doc.css(tag_type).each do |tag|
        value = tag_type == 'a' ? tag['href'] : tag.content
        if value.present?
          Tag.create(
            kind: tag_type,
            value: value.strip,
            page: @page
          )
        end
      end
    end
  end

end
