require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
    students = []
    index = Nokogiri::HTML(open(index_url))

    index.css("div.student-card").each do |student|
      name = student.css(".student-name").text
      location = student.css(".student-location").text
      profile_url = student.css("a").attribute("href").value
      student_info = {
        :name=>name,
        :location=>location,
        :profile_url=>profile_url
      }
      students << student_info
    end
    students
  end

  def self.scrape_profile_page(profile_url)
    profile = {}
    page = Nokogiri::HTML(open(profile_url))


    container = page.css(".social-icon-container a").collect{|icon| icon.attribute("href").value}

    profile[:profile_quote] = page.css(".profile_quote").text
    profile[:bio] = page.css(".description_holder p").text
    profile
  end

end
