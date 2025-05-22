class Profile < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  delegate :username, to: :user

  def post_count
    posts.size
  end

  def followers
    Union.where(user2: self.id, union_type: "follow")
  end

  def followings
    Union.where(user1: self.id, union_type: "follow")
  end

  def following_status(current_user)
    return "me" if self.id == current_user.id
    Union.exists?(user2: self.id, user1: current_user.id, union_type: "follow") ? "following" : "not_following"
  end
end

