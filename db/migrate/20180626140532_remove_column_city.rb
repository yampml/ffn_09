class RemoveColumnCity < ActiveRecord::Migration[5.1]
  def change
    remove_column :matches, :city
  end
end
