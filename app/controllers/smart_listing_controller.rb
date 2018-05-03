class SmartListingController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  # def index
  #   @sitepages = smart_listing_create(:sitepages, SiteCrawl.all, partial: "smart_listing/listing")
  # end
  def index
    smart_listing_create :sitepages, SiteCrawl.all, partial: "smart_listing/listing"
  end

end
