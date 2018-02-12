require 'nokogiri'
require 'open-uri'

url = 'https://cookpad.com/search/%E8%B1%9A%E8%82%89%20%E3%83%94%E3%83%BC%E3%83%9E%E3%83%B3%20%E7%8E%89%E3%81%AD%E3%81%8E%E3%80%80%E4%BA%BA%E5%8F%82'
#url = 'http://qiita.com/search?q=ruby'

charset = nil

html = open(url) do |f|
  charset = f.charset
  f.read
end

doc = Nokogiri::HTML.parse(html, nil, charset)
doc.xpath('//div[@class="recipe-preview"]').each do |node|
  p node.css('a')[0].attributes['href'].value,
    node.css('a')[1].inner_text
end
