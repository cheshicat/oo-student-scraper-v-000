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
        :name => name,
        :location => location,
        :profile_url => profile_url
      }
      students << student_info
    end
    students
  end

  def self.scrape_profile_page(profile_url)
    student_details = {}
    profile = Nokogiri::HTML(open(profile_url))

    container = profile.css(".social-icon-container a").collect{|icon| icon.attribute("href").value}
    container.each do |link|
      if link.include?("twitter")
          student_details[:twitter] = link
      end
      student_details
    end
  end

end
