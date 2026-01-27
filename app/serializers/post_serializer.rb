class PostSerializer < ActiveModel::Serializer
  include ImageFallbackable
  attributes :id, :caption, :post_img, :likes

  belongs_to :profile
  has_many :comments

  def s3_healthy?
    instance_options[:s3_healthy] != false
  end

  def post_img
    image_with_fallback(object.post_img)
  end
end
