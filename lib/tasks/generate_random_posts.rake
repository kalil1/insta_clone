namespace :db do
  desc "Generate 1 to 10 random posts for each profile"
  task generate_random_posts: :environment do
    puts "🖼 Generating random posts for all profiles..."

    base_url = ENV['S3_BASE_URL']
    raise "Missing ENV['S3_BASE_URL']" if base_url.blank?

    image_variants = (1..10).to_a.map { |i| "r#{i}.jpeg" }

    Profile.find_each do |profile|
      post_count = rand(1..10)
      puts "🔧 Creating #{post_count} posts for #{profile.name} (ID: #{profile.id})"

      post_count.times do
        filename = image_variants.sample
        post_img_url = "#{base_url}/#{filename}"

        profile.posts.create!(
          caption: Faker::Lorem.sentence(word_count: 8),
          post_img: post_img_url 
        )
      end
    end

    puts "✅ Done creating posts for all profiles!"
  end

  desc "Assign a new random post_img to each existing post"
  task reassign_post_images: :environment do
    puts "🔁 Reassigning random post images to all existing posts..."

    base_url = ENV['S3_BASE_URL']
    raise "Missing ENV['S3_BASE_URL']" if base_url.blank?

    image_variants = (1..10).to_a.map { |i| "r#{i}.jpeg" }

    Post.all.each do |post|
      filename = image_variants.sample
      new_img_url = "#{base_url}/#{filename}"

      post.update!(post_img: new_img_url )
      puts "🖼 Updated Post ID #{post.id} with new image: #{post.post_img}"
    end

    puts "✅ All posts updated with new images!"
  end

  desc "Assign a new random profile_pic to each profile"
  task reassign_profile_pics: :environment do
    puts "🔁 Reassigning random profile pictures to all profiles..."

    base_url = ENV['S3_BASE_URL']
    raise "Missing ENV['S3_BASE_URL']" if base_url.blank?

    image_variants = (1..10).to_a.map { |i| "r#{i}.jpeg" }

    Profile.find_each do |profile|
      filename = image_variants.sample
      new_pic_url = "#{base_url}/#{filename}"

      profile.update!(profile_pic:  new_pic_url )
      puts "👤 Updated Profile ID #{profile.id} with new picture: #{filename}"
    end

    puts "✅ All profiles updated with new profile pictures!"
  end
end
