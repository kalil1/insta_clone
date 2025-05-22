# README# INSTACLONE

## InstaClone Architecture: A Rails API and React Frontend Collaboration
- InstaClone is designed with a two-part architecture, using a Rails API for the backend and a React Frontend for the client-side application. This structure means that the user interacts with the React frontend, which communicates with the Rails API to fetch and send data.
- Here’s how the components work together
### Rails API (Backend):
- Handles the core application logic, data storage, and processing.
- Uses Ruby on Rails, a framework well-suited for building APIs.
- Manages data persistence through a PostgreSQL database.
- Offers endpoints that the React frontend can interact with.
### Employs Ruby gems like Devise (for user authentication), Faker (for generating dummy data), and CarrierWave (for handling image uploads) to provide key functionalities.
- React Frontend (Client-Side):
- Provides the user interface (UI) that users directly interact with.
- Built using React, a JavaScript library known for building dynamic and interactive user interfaces.
- Communicates with the Rails API to request data and perform actions.
### Renders the received data from the API into visually appealing components.
- User Experience:
- When a user interacts with the InstaClone application, their actions on the React frontend trigger requests to the Rails API.
- The Rails API processes these requests, interacts with the database if needed, and sends back the appropriate response.
- The React frontend then takes this response and updates the UI accordingly, creating a seamless and dynamic experience for the user.
- This separation of concerns, with the backend handling data and logic, and the frontend managing the user interface, makes InstaClone a scalable and maintainable application.


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
