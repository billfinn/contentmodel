class CreateTemplateUserStoryMappings < ActiveRecord::Migration[5.1]
  def change
    create_table :template_user_story_mappings do |t|
      t.integer :userstory_id
      t.integer :template_id

      t.timestamps
    end
  end
end
