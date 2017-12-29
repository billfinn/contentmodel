class Page < ApplicationRecord
  has_ancestry
  has_many :text_items

  validates :name, :presence => true

  def show
    @page = Page.find(params[:id])
  end

end
