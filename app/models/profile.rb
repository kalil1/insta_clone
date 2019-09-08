class Profile < ApplicationRecord
  mount_uploader :profile_pic, ProfilePicUploader
  belongs_to :user
  has_many :posts

  def username
    self.user.username
  end

  def post
    self.posts.count
  end

  def followers
  end

  def following
  end
end
