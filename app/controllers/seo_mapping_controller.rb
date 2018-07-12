class SeoMappingController < ApplicationController
  respond_to :html
  respond_to :js


  def index

  end

  def show
       # render js: "alert('The number is: #{params[:id]}')"
  end

    def create
      @seo_mapping = SeoMapping.create!(allowed_params)

      # redirect_to text_item_url
      # redirect_to "/text_item/"
      respond_to do |f|
        f.html { redirect_to page_path }
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
     @seo_mapping = SeoMapping.find(params[:id])
     @seo_mapping.update_attributes!(allowed_params)

     respond_to do |f|
       # f.html { redirect_to "/text_item/" }
       f.html {redirect_to page_path}
       f.js
     end
  end

  def destroy
    @seo_mapping = SeoMapping.destroy(params[:id])

    # redirect_to text_item_index_path
    respond_to do |f|
      f.html { redirect_to page_path(:id => params[:component], :instance => params[:instance], :template => params[:template], :page => params[:page], :site => params[:site]) }
      f.js
    end
  end

  private

  def allowed_params
    params.require(:seo_mapping).permit(:seo_term_id, :page_id)
  end


end
