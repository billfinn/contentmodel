class SiteCrawlController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  def index
    # Create your list consisting of all active users
    # smart_listing_create :users, User.active, partial: "users/list"
    # @sitecrawls = smart_listing_create(:sitecrawls, SiteCrawl.all, partial: "site_crawl/listing")
    @filterrific = initialize_filterrific(
      SiteCrawl,
      params[:filterrific],
      select_options: {
        sorted_by: SiteCrawl.options_for_sorted_by
      }
    ) or return
    @sitecrawls = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

end
