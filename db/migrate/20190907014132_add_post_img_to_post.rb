class AddPostImgToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :post_img, :string
  end
end
