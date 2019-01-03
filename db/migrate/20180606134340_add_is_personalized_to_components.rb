class AddIsPersonalizedToComponents < ActiveRecord::Migration[5.1]
  def change
    add_column :components, :ispersonalized, :integer
    add_column :components, :personalization_rules, :text
  end
end
