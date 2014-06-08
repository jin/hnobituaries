class PagesController < ApplicationController
  include PagesHelper

  def index
    json = get_recent_posts(30)
    @dead_stories = get_deaths(json)
  end

  def top
    @dead_stories = get_deaths(get_top_posts(30))  
  end
end
