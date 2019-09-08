class Post < ApplicationRecord
  mount_uploader :post_img, PostImgUploader
  belongs_to :profile
end
