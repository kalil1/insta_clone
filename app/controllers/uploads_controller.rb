class UploadsController < ApplicationController
    protect_from_forgery with: :null_session
    respond_to :json
  
    def generate_presigned_url
        file = params[:file]
        raise "No file uploaded" unless file
        
        filename = file.original_filename
        content_type = file.content_type
        key = "uploads/#{SecureRandom.uuid}_#{filename}"
        
        s3 = Aws::S3::Resource.new(
            region: ENV['AWS_REGION'],
            access_key_id: ENV['AWS_ACCESS_KEY_ID'],
            secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
        )
        
        obj = s3.bucket(ENV['AWS_S3_BUCKET']).object(key)
        obj.upload_file(file.tempfile.path, acl: 'public-read', content_type: content_type)
        
        render json: { url: obj.public_url, key: key }
    end      
  end