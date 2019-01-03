class SearchController < ApplicationController
  def index
    if params[:query].present?
      sitecrawl = SiteCrawl.search(params[:query])
    else
      @sitecrawl = SiteCrawl.all
    end
  end
  
end
