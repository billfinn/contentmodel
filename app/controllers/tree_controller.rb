class TreeController < ApplicationController
  def index
  end

  def jcitags
    @tags = Tag.for_jci.arrange
    respond_to do |format|
      format.json {
        render :json =>  Tag.json_tree(@tags)
      }
    end
  end

  def jcimap
    @pages = Page.for_jci.arrange
    respond_to do |format|
      format.json {
        render :json =>  Page.json_tree(@pages)
      }
    end
  end

  def tycotags
    @tags = Tag.for_tyco.arrange
    respond_to do |format|
      format.json {
        render :json =>  Tag.json_tree(@tags)
      }
    end
  end

  def tycomap
    @pages = Page.for_tyco.arrange
    respond_to do |format|
      format.json {
        render :json =>  Page.json_tree(@pages)
      }
    end
  end
  

  def data
    @tags = Tag.joins( :site_tag_mappings ).where( site_tag_mappings: { site_id: 1 }).arrange
    respond_to do |format|
      format.json {
        render :json =>  Tag.json_tree(@tags)
      }
    end
  end

end
