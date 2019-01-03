class CreateGoalsCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :goals_customers do |t|
      t.string :goal

      t.timestamps
    end
  end
end
