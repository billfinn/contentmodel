class CreatePageWorkflows < ActiveRecord::Migration[5.1]
  def change
    create_table :page_workflows do |t|
      t.integer :workflow_id
      t.integer :page_id

      t.timestamps
    end
  end
end
