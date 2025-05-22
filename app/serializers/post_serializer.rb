class PostSerializer < ActiveModel::Serializer
  attributes :id, :caption, :post_img, :likes, :like_status

  belongs_to :profile
  has_many :comments

  def like_status
    object.liked?(Profile.first.id) # hard coded for now
  end
end
