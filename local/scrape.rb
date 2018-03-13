require 'nokogiri'
require 'open-uri'
require 'uri'

cpsite = 'https://cookpad.com'
items = ARGV.join(' ')
url = URI.escape(cpsite + '/search/' + items)

#url = URI.escape('https://cookpad.com/search/豚肉 じゃがいも')

charset = nil

html = open(url) do |f|
  charset = f.charset
  f.read
end

doc = Nokogiri::HTML.parse(html, nil, charset)
# doc.xpath('//div[@class="recipe-preview"]').each do |node|
#   p cpsite + node.css('a')[0].attributes['href'].value,
#     node.css('img')[0].attributes['src'].value,
#     node.css('a')[1].inner_text,
#     node.xpath('//div[@class="recipe_description"]').inner_text,
#     node.xpath('//div[@class="material ingredients"]').inner_text
# end

recipes = doc.xpath('//div[@class="recipe-preview"]').map { |node|
  {
    :extlink  => cpsite + node.css('a')[0].attributes['href'].value,
    :img   => node.css('img')[0].attributes['src'].value,
    :title => node.css('a')[1].inner_text,
    :description => node.search('div[@class="recipe_description"]').text,
    :ingredients => node.search('div[@class="material ingredients"]').text
  }
}

p recipes

# nodeset = doc.xpath('//div[@class="recipe-preview"]')
# p nodeset[0].search('div[@class="recipe_description"]').text
