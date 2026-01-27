class ProfileSerializer < ActiveModel::Serializer
  include ImageFallbackable

  attributes :id, :name, :bio, :profile_pic

  def s3_healthy?
    instance_options[:s3_healthy] != false
  end

  def profile_pic
    image_with_fallback(object.profile_pic)
  end
end
