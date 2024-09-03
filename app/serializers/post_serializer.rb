class PostSerializer < ActiveModel::Serializer
  attributes :id,
             :caption,
             :profile_id,
             :post_img,
             :likess



def likess
  object.likes
end
end
