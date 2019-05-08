require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
    students = {}
    index = Nokogiri::HTML(open(index_url))

    index.css("div.student-card").each do |student|
      students[student] = {}
    end
    students
  end

  def self.scrape_profile_page(profile_url)

  end

end
