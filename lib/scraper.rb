require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper
  def get_page 
    Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end
  
  def get_courses 
   get_page.css("article.post")
  end
  
  def make_courses
    course_offerings = get_courses
    # course = Course.new
    course_offerings.each do |course|
      new_course = Course.new
      new_course.title = course.css("h2").text.strip
      new_course.schedule = course.css(".date").text.strip
      new_course.description = course.css("p").text.strip
    end
  end
  
  
  def get_page 
    Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end
  
  def get_courses 
    doc = get_page
    doc.css(".posts-holder")
  end
  
  def make_courses
    courses_xml_array = get_courses
    
    courses_xml_array.each do |course|
      course = Course.new
      course.title = course.css("h2").text.strip
      course.schedule = couse.css(".date").text.strip
      course.description = course.css("p").text.strip
      course
    end
  end
  
  
    def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end
  
end



