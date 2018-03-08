class Api::V1::TagController < Api::V1::BaseController



  def index
  end

  # def show
  #   @tag = Tag.find(params[:id])
  #   render json: @tag.subtree.to_json(only: [:name, :id])
  # end



# This one below works like a champ and uses Ancestry contained in the Tag model
  # def index
  #   @tags = Tag.arrange
  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.xml  { render :xml => @tags }
  #     format.json { render :json =>  Tag.json_tree(@tags)}
  #   end
  # end

  def data
    @tags = Tag.arrange
    respond_to do |format|
      format.json {
        render :json =>  Tag.json_tree(@tags)
      }
    end
  end

end
