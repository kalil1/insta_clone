puts "🧹 Cleaning database..."

Comment.destroy_all
Union.destroy_all
Post.destroy_all
Profile.destroy_all
User.destroy_all

puts "🌱 Seeding database..."

# Create a specific user with profile
main_user = User.create!(
  email: "wkalil77@gmail.com",
  username: "kalil_3",
  password: "password",
  password_confirmation: "password"
)

Profile.create!(
  name: "Kalil Williams",
  website: "https://kalil.dev",
  bio: "Founder. Engineer. Dreamer.",
  phone: Faker::PhoneNumber.cell_phone,
  user: main_user
)

# Create 100 users with profiles, posts, comments
100.times do
  user = User.create!(
    email: Faker::Internet.email,
    username: Faker::Internet.username(separators: %w(. _ -)),
    password: "valid_password",
    password_confirmation: "valid_password"
  )

  profile = Profile.create!(
    name: Faker::Name.name,
    website: Faker::Internet.url,
    bio: Faker::Quote.famous_last_words,
    phone: Faker::PhoneNumber.cell_phone,
    user: user
  )

  post = Post.create!(
    caption: Faker::Quotes::Shakespeare.hamlet_quote,
    profile: profile
  )

  # Create random comments for the post
  rand(1..10).times do
    commenter_profile = Profile.order("RANDOM()").first
    Comment.create!(
      body: Faker::Music::Hiphop.artist,
      profile: commenter_profile,
      post: post
    )
  end

  # Create random "follow" unions
  Union.create!(
    user1: User.pluck(:id).sample,
    user2: User.pluck(:id).sample,
    union_type: "follow"
  )

  # Create post-related unions
  rand(1..3).times do
    Union.create!(
      user1: User.pluck(:id).sample,
      user2: User.pluck(:id).sample,
      postid: post.id
    )
  end
end

puts "✅ Done seeding!"
