class PostSerializer < ActiveModel::Serializer
  attributes :id, :caption, :post_img, :likes

  belongs_to :profile
  has_many :comments
end
