require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
    students = {}
    index = Nokogiri::HTML(open(index_url))

    index.css("div.student-card").each do |student|
      students[student] = {
        :name
        :location
        :profile-url
      }


    kickstarter.css("li.project.grid_4").each do |project|
   title = project.css("h2.bbcard_name strong a").text
   projects[title.to_sym] = {
     :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
     :description => project.css("p.bbcard_blurb").text,
     :location => project.css("ul.project-meta span.location-name").text,
     :percent_funded => project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i

    students = {
      :name => index.css('.student-card.card-text')
      :location =>
      :profile_url =>

  end

  def self.scrape_profile_page(profile_url)

  end

end
