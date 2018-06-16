class CreateBets < ActiveRecord::Migration[5.1]
  def change
    create_table :bets do |t|
      t.decimal :coin, null: false, precision: 10, scale: 2

      t.timestamps
    end
  end
end
