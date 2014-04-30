require_relative 'config/application'
require_relative 'app/models/user'
require_relative 'app/models/post'
require_relative 'app/controllers/users_controller'
require_relative 'app/controllers/posts_controller'

users_controller = UserController.new
posts_controller = PostController.new

#TODO: that's the entry point of your app.
def ask_and_get(param)
  puts "What is the #{param} of your piece of news?"
  gets.chomp
end

while true

  puts "Welcome on LewagonNews!!!"
  logged_in = false

  until logged_in
    puts "Are you already a member? y/n"
    user_id = gets.chomp.to_i

    logged_in = true

    begin
      user = User.find(user_id)
    rescue
      puts "Incorrect ID!!"
      logged_in = false
    end
  end

  while true
      puts "Hey #{user.name}, what do you want to do today? Enter <task_id>"
      puts "1. Create a post"
      puts "2. Read your posts"
      puts "3. Delete all posts"
      puts "4. Exit"

      choice =  gets.chomp.to_i

      case choice
      when 1
        name = ask_and_get("name")
        source_url = ask_and_get("source url")
        rating = ask_and_get("rating")
        post = { name: name, source_url: source_url, date: Time.now,
          rating: rating }

        user.posts.create(post)
        #TODO: use ActiveRecord to add a new post for the user logged in!
      when 2
        user.posts.each do |p|
          puts p
        end
        #TODO: use ActiveRecord to get all posts of the current user
      when 3
        user.posts.destroy_all
        #TODO: use ActiveRecord to delete all posts of current user
      when 4
        break
      end
  end

end