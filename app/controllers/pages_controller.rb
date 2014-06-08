class PagesController < ApplicationController
  include PagesHelper

  def index
    @dead_stories = get_deaths(get_recent_posts(30))
  end

  def top
    @dead_stories = get_deaths(get_top_posts(30))  
  end
end
