class ProfileSerializer < ActiveModel::Serializer
  attributes :name, :website, :bio, :phone
end
