class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.date :dob
      t.string :position
      t.integer :p_number

      t.timestamps
    end
  end
end
