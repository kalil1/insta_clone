class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :commenter_name, :commenter_id

  belongs_to :post
  belongs_to :profile

  def commenter_name
    object.profile.name
  end

  def commenter_id
    object.profile.id
  end
end