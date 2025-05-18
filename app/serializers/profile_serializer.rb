class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :name, :website, :bio, :phone, :profile_pic

end
