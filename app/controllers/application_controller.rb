class ApplicationController < ActionController::Base
  before_action :check_s3_bucket
  # before_action :configure_permitted_parameters, if: :devise_controller?

  # protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  # end

  private

  def check_s3_bucket
    @s3_healthy = Rails.cache.fetch("s3_healthy", expires_in: 5.minutes) do
      test_s3_image
    end
  end
  
  def s3_healthy?
    @s3_healthy
  end
  
  def test_s3_image
    test_url = ENV['S3_TEST_IMAGE_URL']
    return false if test_url.blank?
  
    uri = URI.parse(test_url)
    response = Net::HTTP.start(
      uri.host,
      uri.port,
      use_ssl: uri.scheme == "https",
      read_timeout: 2
    ) do |http|
      http.head(uri.request_uri)
    end
  
    response.code.to_i == 200
  rescue StandardError
    false
  end
end
