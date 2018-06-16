class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.string :city
      t.string :stadium
      t.string :president
      t.string :coach

      t.timestamps
    end
  end
end
