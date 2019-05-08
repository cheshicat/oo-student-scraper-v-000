require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
    students = {}
    index = Nokogiri::HTML(open(index_url))

    index.css("div.student-card").each do |student|
      name = student.css("div.card-text-container h4.student-name").text
      students[name] = []
    end
    students
  end

  def self.scrape_profile_page(profile_url)

  end

end
