class CreateTransfers < ActiveRecord::Migration[5.1]
  def change
    create_table :transfers do |t|
      t.date :transfer_day, null: false
      t.integer :from_team_id, null: false
      t.integer :to_team_id, null: false

      t.timestamps
    end
  end
end
