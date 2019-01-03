class CreateUserStories < ActiveRecord::Migration[5.1]
  def change
    create_table :user_stories do |t|
      t.text :user_story

      t.timestamps
    end
  end
end
