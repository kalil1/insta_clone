class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :commenter_name

  belongs_to :post
  belongs_to :profile

  def commenter_name
    object.profile.name
  end
end