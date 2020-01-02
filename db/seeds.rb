# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#  page = HTTParty.get("https://www.google.com/search?hl=en&tbm=isch&sxsrf=ACYBGNSDltC4Bic-to6YlNkIw2He6gLADw%3A1573781698049&source=hp&biw=1440&bih=821&ei=wQDOXd_vPILWtQWc4KvgAQ&q=#{}&oq=&gs_l=img.3.0.35i362i39l10.0.0..7536...0.0..0.304.304.3-1......0......gws-wiz-img.....10.xS-sKzwvNEI")
#  nokogiri_page = Nokogiri::HTML(page)
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



  user = User.new
  user.email = "wkalil47@gmail.com"
  user.username = "kalil_3"
  user.password = 'password'
  user.password_confirmation = 'password'
  user.encrypted_password = '#$taawktljasktlw4aaglj'
  user.save

  100.times do |n|
  user = User.new
  user.email = Faker::Internet.email
  user.username = Faker::Internet.username(separators: %w(. _ -)) + n.to_s
  user.password = 'valid_password'
  user.password_confirmation = 'valid_password'
  user.encrypted_password = '#$taawktljasktlw4aaglj'
  user.save

  profile = Profile.new
  profile.id = n
  profile.name = Faker::Name.name
  profile.website = Faker::Internet.url
  profile.bio = Faker::Quote.famous_last_words
  profile.phone = Faker::PhoneNumber.cell_phone
  profile.user_id = user.id
  profile.created_at = DateTime.now
  profile.updated_at = DateTime.now
  profile.save

  post = Post.new
  post.id = n
  post.caption = Faker::Quotes::Shakespeare.hamlet_quote
  post.profile_id = profile.id
  post.created_at = DateTime.now
  post.updated_at = DateTime.now
  post.save
  rand((1..100)).times do |p|
    union = Union.new
    union.user1 = rand((1..100))
    union.user2 = rand((1..100))
    union.postid = post.id
    union.created_at = DateTime.now
    union.updated_at = DateTime.now
    union.save
  end

  union = Union.new
  union.user1 = rand((1..100))
  union.user2 = rand((1..100))
  union.union_type = "follow"
  union.created_at = DateTime.now
  union.updated_at = DateTime.now
  union.save
  p profile
end
p 'Done!!'
