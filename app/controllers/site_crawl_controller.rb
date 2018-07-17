class SiteCrawlController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  def index
    # Create your list consisting of all active users
    # smart_listing_create :users, User.active, partial: "users/list"
    @sitecrawls = smart_listing_create(:sitecrawls, SiteCrawl.all, partial: "site_crawl/listing")
  end

end
