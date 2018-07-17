class SmartListingController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  def index
    @sitecrawls = smart_listing_create(:sitecrawls, SiteCrawl.all, partial: "site_crawl/listing")
  end

end
