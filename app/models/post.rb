class Post < ApplicationRecord
  mount_uploader :post_img, PostImgUploader
  belongs_to :profile
  has_many :comments, dependent: :destroy

  def unions
    Union.where(postid: self.id, union_type: "like")
  end

  def likes
    unions.count
  end

  def liked(user1)
    unions.find(user1.id) ? true : false;
  end
end
