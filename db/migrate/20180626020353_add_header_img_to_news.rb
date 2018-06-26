class AddHeaderImgToNews < ActiveRecord::Migration[5.1]
  def change
    add_column :news, :header_img, :string
  end
end
