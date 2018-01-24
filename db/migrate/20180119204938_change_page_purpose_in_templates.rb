class ChangePagePurposeInTemplates < ActiveRecord::Migration[5.1]
  def change
    change_column :templates, :page_purpose, :string
  end
end
