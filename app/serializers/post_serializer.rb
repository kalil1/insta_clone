class PostSerializer < ActiveModel::Serializer
  attributes :id,
             :caption,
             :profile_id,
             :post_img,
             :likess

  belongs_to :profile
  has_many :comments
def likess
  object.likes
end
end
