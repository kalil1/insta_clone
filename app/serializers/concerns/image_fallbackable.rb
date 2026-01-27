module ImageFallbackable
  extend ActiveSupport::Concern

  DEV_FALLBACK_RANGE = (1..20).freeze

  PROD_FALLBACKS = {
    profile: "/fallbacks/404_avatar.png",
    post: "/fallbacks/post_404.png"
  }.freeze

  def image_with_fallback(image_url)
    type = infer_image_type

    if image_url.blank? || !s3_healthy?
      return dev_fallback if Rails.env.development? || Rails.env.staging?
      return PROD_FALLBACKS[type]
    end

    image_url
  end

  private

  def dev_fallback
    number = DEV_FALLBACK_RANGE.to_a.sample
    "/fallbacks/fallback#{number}.jpg"
  end

  def s3_healthy?
    instance_options[:s3_healthy] != false
  end

  def infer_image_type
    caller_location = caller_locations(2, 1)[0].label

    case caller_location
    when /profile_pic/
      :profile
    when /post_img/
      :post
    else
      :post
    end
  end
end
