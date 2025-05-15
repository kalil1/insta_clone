class PostSerializer < ActiveModel::Serializer
  attributes :id, :caption, :post_img_url, :likes

  belongs_to :profile
  has_many :comments
end
