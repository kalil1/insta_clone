# README# INSTACLONE
INSTACLONE is one of my personal projects, it's a clone of instagram I work on in my spare time. Allowing users to sign up, create a profile, follow or unfollow other users, upload post, like post & comment on them . My goal for this application is to replicate all of instagram's features using Ruby on Rails.  


## Technologies & RubyGems
- Ruby
- HTML5
- CSS3
- JavaScript
- BootStrap
- MySQL2
- Devise
- Faker
- CarrierWave
- Capybara
## Project Photos & Details

* Log in or sign.
![INSTACLONE](https://github.com/kalil1/insta_clone/blob/master/app/assets/images/Screen-Shot12.png)
![INSTACLONE](https://github.com/kalil1/insta_clone/blob/master/app/assets/images/Screen-Shot13.png)
* Create a profile.
![INSTACLONE](https://github.com/kalil1/insta_clone/blob/master/app/assets/images/Screen-Shot14.png)
![INSTACLONE](https://github.com/kalil1/insta_clone/blob/master/app/assets/images/Screen-Shot14.png)
![INSTACLONE](https://github.com/kalil1/insta_clone/blob/master/app/assets/images/Screen-Shot15.png)
![INSTACLONE](https://github.com/kalil1/insta_clone/blob/master/app/assets/images/Screen-Shot17.png)
![INSTACLONE](https://github.com/kalil1/insta_clone/blob/master/app/assets/images/Screen-Shot21.png)
* Comment on other users post.
![INSTACLONE](https://github.com/kalil1/insta_clone/blob/master/app/assets/images/Screen-Shot16.png)
* View and follow other user profiles.
![INSTACLONE](https://github.com/kalil1/insta_clone/blob/master/app/assets/images/Screen-Shot18.png)
![INSTACLONE](https://github.com/kalil1/insta_clone/blob/master/app/assets/images/Screen-Shot20.png)

* I used the gem Faker to fill the app with dummy data creating 100 fake profiles when you seed the database.
* Each profile has
- A random username, bio phrase,
- A random amount of post with a random caption and random amount of likes
- A random amount of followings and followers from the 100 fake user profiles.
![INSTACLONE](https://github.com/kalil1/insta_clone/blob/master/app/assets/images/Screen-Shot10.png)
![INSTACLONE](https://github.com/kalil1/insta_clone/blob/master/app/assets/images/Screen-Shot8.png)
![INSTACLONE](https://github.com/kalil1/insta_clone/blob/master/app/assets/images/Screen-Shot23.png)

## CarrierWave
* All profiles and post without pictures gets saved with either the default profile or post image. When working with images, it's a good idea to provide a default url, a fallback in case no file has been uploaded. You can do this easily by overriding the `default_url` method in your uploader:

```ruby
class MyUploader < CarrierWave::Uploader::Base
  def default_url(*args)
    # For Rails 3.1+ asset pipeline compatibility:
    ActionController::Base.helpers.asset_path([version_name, "no_image.png"].compact.join('_'))
    # "assets/images/" +[version_name, "missing.jpeg"].compact.join('_')
  end
end
```
![INSTACLONE](https://github.com/kalil1/insta_clone/blob/master/app/assets/images/Screen-Shot22.png)

## Upcoming Features
- In app chat (DM's).
- Stories.
- Post alerts.
- Like's on comments.
