require 'net/http'
require 'JSON'

module PagesHelper
  def get_recent_posts(limit) 
    url = "https://hn.algolia.com/api/v1/search_by_date?query=dead&tags=story"
    resp = Net::HTTP.get_response(URI.parse(url)) 
    data = resp.body 
    JSON.parse(data)
  end

  def get_top_posts(limit) 
    url = "https://hn.algolia.com/api/v1/search?query=dead&tags=story"
    resp = Net::HTTP.get_response(URI.parse(url)) 
    data = resp.body 
    JSON.parse(data)
  end

  def get_deaths(json)
    dead_stories = Array.new
    stories = json["hits"]
    stories.each do |story|
      if is_dead(story)
        dead_stories << story
      end
    end
    dead_stories
  end

  def is_dead(story)
    story["title"].match(/is dead/)
  end

end
