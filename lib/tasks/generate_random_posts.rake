namespace :db do
  desc "Generate 1 to 10 random posts for each profile"
  task generate_random_posts: :environment do
    puts "🖼 Generating random posts for all profiles..."

    base_url = "https://cal1.s3.us-east-2.amazonaws.com/posts/random_post"
    image_variants = (1..10).to_a.map { |i| "r#{i}.jpeg" }

    Profile.find_each do |profile|
      post_count = rand(1..10)
      puts "🔧 Creating #{post_count} posts for #{profile.name} (ID: #{profile.id})"

      post_count.times do
        filename = image_variants.sample
        post_img_url = "#{base_url}/#{filename}"

        profile.posts.create!(
          caption: Faker::Lorem.sentence(word_count: 8),
          post_img: { url: post_img_url }
        )
      end
    end

    puts "✅ Done creating posts for all profiles!"
  end
end
