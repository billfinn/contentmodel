class TextItemController < ApplicationController
  respond_to :html
  respond_to :js


  def index
    @textitems = TextItem.all
    @textitem = TextItem.new
    @textitemstemplate = TextItem.where page_id: nil
    @textitemspage = TextItem.where page_id: params[:page]

  end

  def show
       # render js: "alert('The number is: #{params[:id]}')"
  end

    def create
      @textitem = TextItem.create!(allowed_params)

      # redirect_to text_item_url
      # redirect_to "/text_item/"
      respond_to do |f|
        f.html { redirect_to text_item_index_path }
        f.js
      end      # @textitem = TextItem.new(params[:textitem])
      #
      # respond_to do |format|
      #   if @textitem.save
      #     format.html { redirect_to @textitem, notice: 'Item was successfully created.' }
      #     format.js
      #     format.json { render json: @textitem, status: :created, location: @textitem_url
  end

  def update
     @textitem = TextItem.find(params[:id])
     @textitem.update_attributes!(allowed_params)

     respond_to do |f|
       # f.html { redirect_to "/text_item/" }
       f.html {redirect_to text_item_index_path}
       f.js
     end
  end

  def destroy
    @textitem = TextItem.destroy(params[:id])

    # redirect_to text_item_index_path
    respond_to do |f|
      f.html { redirect_to text_item_index_path(:id => params[:component], :template => params[:template], :page => params[:page], :site => params[:site]) }
      f.js
    end
  end

  private

  def allowed_params
    params.require(:text_item).permit(:name, :itemtext, :text_id, :page_id, :order, :component_id)
  end


end
