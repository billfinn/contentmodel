class AddVstsIdToComponents < ActiveRecord::Migration[5.1]
  def change
    add_column :components, :vsts_id, :string
  end
end
