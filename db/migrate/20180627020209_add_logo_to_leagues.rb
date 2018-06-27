class AddLogoToLeagues < ActiveRecord::Migration[5.1]
  def change
    add_column :leagues, :logo, :string
  end
end
