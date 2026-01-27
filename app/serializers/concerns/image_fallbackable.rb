module ImageFallbackable
    extend ActiveSupport::Concern
  
    DEV_FALLBACKS = %w[
        /fallbacks/fallback1.jpg
        /fallbacks/fallback2.jpg
        /fallbacks/fallback3.jpg
        /fallbacks/fallback4.jpg
        /fallbacks/fallback5.jpg
        /fallbacks/fallback6.jpg
        /fallbacks/fallback7.jpg
        /fallbacks/fallback8.jpg
        /fallbacks/fallback9.jpg
      ].freeze
  
    PROD_FALLBACKS = {
      profile: "/fallbacks/404_avatar.png",
      post: "/fallbacks/post_404.png"
    }.freeze
  
    def image_with_fallback(image_url)
      type = infer_image_type
  
      if image_url.blank? || !s3_healthy?
        return Rails.env.development? ? DEV_FALLBACKS.sample : PROD_FALLBACKS[type]
      end
  
      image_url
    end
  
    private
  
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
  