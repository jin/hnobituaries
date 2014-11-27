class PagesController < ApplicationController

  include PagesHelper

  def recent 
    @dead_stories = extract_obituaries(get_recent_posts)
  end

  def top
    @dead_stories = extract_obituaries(get_top_posts)  
  end

end
