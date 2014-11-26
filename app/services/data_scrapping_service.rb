require 'nokogiri'
require 'open-uri'

class DataScrappingService

  def self.get_data
    base_url = 'http://www.zagat.com/paris'

    index_page = Nokogiri::HTML(open(base_url))

    logging_infos("Launching scrapper to #{base_url}....")
    index_page.css('div.case.js-case').each do |div|
      #####################################
      thumbnail_url = 'http://www.zagat.com'
      image = div.at_css('.image img')
      thumbnail_url += image['src']
      #####################################
      raw_data_content = div.at_css('script').content
      data_content = raw_data_content.match(/\{([^}]*)\}/)[1]
      data_content = data_content.split("\n")
      data_content.delete_at(6)
      data_content = data_content.map{|item| item.split(' : ')}.flatten.map do |item|
        item.gsub(',','')
      end.map do |item|
        item.strip
      end
      data_content.pop
      hash = Hash[*data_content]
      # logging_result(hash['lat'])
      build_restaurant(hash, thumbnail_url)
    end
  end



  def self.logging_infos(message)
    puts "*"*20
    puts message
    puts "*"*20
  end

  def self.logging_result(message)
    puts '*'*5 + 'SCRAPPED BEGIN' + '*'*5
    puts message
    puts '*'*5 + 'SCRAPPED END' + '*'*5
  end

  private
    def self.build_restaurant(data, thumbnail_url)
      r = Restaurant.create(user_id: 1, name: data['title'], address: data['neighborhood'], lat: data['lat'].to_f, lon: data['lng'].to_f, type_id: 1, thumbnail_img_url: thumbnail_url)
      logging_result(r.errors.messages)
    end

end