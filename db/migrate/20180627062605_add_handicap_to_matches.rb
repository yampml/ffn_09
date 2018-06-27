class AddHandicapToMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :handicap, :float, default: 0
  end
end
