class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :address
      t.integer :role, null: false, default: 0
      t.decimal :coin, default: 1000, precision: 10, scale: 2

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
