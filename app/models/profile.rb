class Profile < ApplicationRecord
  mount_uploader :profile_pic, ProfilePicUploader
  belongs_to :user
  has_many :posts
  has_many :comments

  def username
    self.user.username
  end

  def post
    self.posts.count
  end

  def followers
    Union.where(user2: self.id, union_type: "follow")
  end

  def followings
    Union.where(user1: self.id, union_type: "follow")
  end

  def following(user1)
    if Union.where(user2: self.id, union_type: "follow", user1: user1.id)[0]
      return "following"
    else if self.id == user1.id
      return "me"
    else
      return "not_following"
    end
  end
end
end
