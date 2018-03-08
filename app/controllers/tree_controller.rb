class TreeController < ApplicationController
  def index
  end

  def data
    @tags = Tag.arrange
    respond_to do |format|
      format.json {
        render :json =>  Tag.json_tree(@tags)
      }
    end
  end

end
