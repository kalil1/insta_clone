class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :created_at, :updated_at

  has_one :profile, serializer: ProfileSerializer

  def s3_healthy?
    instance_options[:s3_healthy] != false
  end
end
