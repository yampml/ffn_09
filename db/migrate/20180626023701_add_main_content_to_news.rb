class AddMainContentToNews < ActiveRecord::Migration[5.1]
  def change
    add_column :news, :main_content, :string
  end
end
