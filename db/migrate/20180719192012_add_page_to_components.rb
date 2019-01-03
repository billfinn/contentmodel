class AddPageToComponents < ActiveRecord::Migration[5.1]
  def change
    add_column :components, :page, :string
  end
end
