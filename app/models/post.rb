class Post < ApplicationRecord
  mount_uploader :post_img, PostImgUploader
  belongs_to :profile
  has_one :user, through: :profile
  has_many :comments

  def likes
    Union.where(postid: self.id, union_type: "like")
  end

  def liked(user1)
    if Union.where(postid: self.id, union_type: "like", user1: user1.id)[0]
      return true
    else
      return false
    end
  end
end
