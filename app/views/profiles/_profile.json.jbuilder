json.extract! profile, :id, :name, :website, :bio, :phone, :profile_pic, :user_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
