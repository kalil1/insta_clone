class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :created_at, :updated_at
  has_one :profile
end
