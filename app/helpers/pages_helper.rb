require 'net/http'
require 'json'

module PagesHelper

  def get_recent_posts 
    url = "https://hn.algolia.com/api/v1/search_by_date?query=is%20dead&tags=story"
    parse_response Net::HTTP.get_response(URI.parse(url)) 
  end

  def get_top_posts 
    url = "https://hn.algolia.com/api/v1/search?query=is%20dead&tags=story"
    parse_response Net::HTTP.get_response(URI.parse(url)) 
  end

  def parse_response(resp)
    JSON.parse(resp.body)
  end

  def extract_obituaries(json)
    json["hits"].keep_if { |story| is_obituary(story) }  
  end

  def is_obituary(story)
    !story["title"].match(/is not dead/) && story["title"].match(/\bdead\b/)
  end

end
