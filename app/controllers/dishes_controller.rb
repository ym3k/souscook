class DishesController < ApplicationController
  require 'nokogiri'
  require 'open-uri'
  require 'uri'
  
  @@cpsite = 'https://cookpad.com'
  
  def create
    @ingredients_key = params[:ingredients]
    @dishes = search_cookpad(@ingredients_key)
    respond_to do |format|
      format.js   {}
      format.json {
        render json: @dishes, status: 200
      }
    end
  end

  private
    def search_cookpad(key)
      search_url = URI.escape(@@cpsite + '/search/' + key)
      charset = nil
  
      html = open(search_url) do |f|
        charset = f.charset
        f.read
      end

      doc = Nokogiri::HTML.parse(html, nil, charset)
      recipes = doc.xpath('//div[@class="recipe-preview"]').map { |node|
        {
          :extlink  => @@cpsite + node.css('a')[0].attributes['href'].value,
          :img   => node.css('img')[0].attributes['src'].value,
          :title => node.css('a')[1].inner_text,
          :description => node.xpath('//div[@class="recipe_description"]').inner_text,
          :ingredients => node.xpath('//div[@class="material ingredients"]').inner_text
        }
      }
      return recipes
    end
end
