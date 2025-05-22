class Post < ApplicationRecord
  belongs_to :profile
  has_many :comments, dependent: :destroy

  def unions
    Union.where(postid: self.id, union_type: "like")
  end

  def likes
    unions.count
  end

  def liked?(user_id)
    Union.exists?(postid: id, user1: user_id, union_type: "like")
  end
end
