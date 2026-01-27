namespace :db do
    desc "Add 10 to 100 random likes to each post"
    task add_likes_to_posts: :environment do
      puts "❤️ Adding likes to each post..."
  
      Post.find_each do |post|
        like_count = rand(10..100)
        user_ids = User.pluck(:id).sample(like_count)
  
        user_ids.each do |user_id|
          Union.create!(
            user1: user_id,
            user2: post.profile.user_id,
            postid: post.id,
            union_type: "like"
          )
        end
  
        puts "👍 Post ID #{post.id} received #{like_count} likes."
      end
  
      puts "✅ All posts updated with likes!"
    end
  
    desc "Add 3 to 12 random comments to each post"
    task add_comments_to_posts: :environment do
      puts "💬 Adding comments to each post..."
  
      Post.find_each do |post|
        comment_count = rand(3..12)
        comment_profiles = Profile.pluck(:id).sample(comment_count)
  
        comment_profiles.each do |profile_id|
          Comment.create!(
            body: Faker::Quote.yoda,
            profile_id: profile_id,
            post_id: post.id
          )
        end
  
        puts "📝 Post ID #{post.id} received #{comment_count} comments."
      end
  
      puts "✅ All posts updated with comments!"
    end
  end
  