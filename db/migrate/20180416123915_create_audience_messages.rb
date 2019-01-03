class CreateAudienceMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :audience_messages do |t|
      t.integer :audience_id
      t.integer :level_id
      t.text :message

      t.timestamps
    end
  end
end
