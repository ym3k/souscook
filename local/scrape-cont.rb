require 'nokogiri'
require 'open-uri'
require 'uri'

cpsite = 'https://cookpad.com/recipe/4978671'
url = URI.escape(cpsite)

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

# recipes = doc.xpath('//div[@id="recipe"]').map { |node|
#   {
#     :extlink  => cpsite + node.css('a')[0].attributes['href'].value,
#     :img   => node.css('img')[0].attributes['src'].value,
#     :title => node.css('a')[1].inner_text,
#     :description => node.search('div[@class="recipe_description"]').text,
#     :ingredients => node.search('div[@class="material ingredients"]').text
#   }
# }

# p recipes

#recipe = doc.xpath('//div[@id="recipe"]')
recipe = doc.xpath('//div[@id="recipe-title"]').text.gsub(/\n/, '')
p recipe

descr = doc.xpath('//div[@class="description_text"]').text.gsub(/\n/, '')
p descr

imgsrc = doc.xpath('//div[@id="main-photo"]').search('img')[0].attributes['src'].value
p imgsrc

ingredients_list = doc.xpath('//div[@id="ingredients_list"]')
ing_art = ingredients_list.search('div[@class="ingredient_name"]').map { |art|
  art.text.gsub(/\n/, '')
}
ing_qty = ingredients_list.search('div[@class="ingredient_quantity amount"]').map { |qty|
  qty.text.gsub(/\n/, '')
}
p ing_art.zip(ing_qty).map {|ing_set| 
  {
    :article => ing_set[0],
    :quantity => ing_set[1]
  }
}

