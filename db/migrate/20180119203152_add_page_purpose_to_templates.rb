class AddPagePurposeToTemplates < ActiveRecord::Migration[5.1]
  def change
    add_column :templates, :page_purpose, :text
  end
end
