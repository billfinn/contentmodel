class CreateGoalsBusinesses < ActiveRecord::Migration[5.1]
  def change
    create_table :goals_businesses do |t|
      t.string :goal

      t.timestamps
    end
  end
end
