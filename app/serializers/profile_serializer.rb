class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :name, :website, :bio, :phone
end
