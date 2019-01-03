class AddImageToAudiences < ActiveRecord::Migration[5.1]
  def change
    add_column :audiences, :image, :string
  end
end
