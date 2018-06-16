class CreateContinents < ActiveRecord::Migration[5.1]
  def change
    create_table :continents do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :continents, :name
  end
end
