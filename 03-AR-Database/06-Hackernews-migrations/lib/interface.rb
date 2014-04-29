require_relative 'config/application'
require_relative 'crud'

require 'time'


def ask_and_get(param)
  puts "What is the #{param} of your piece of news?"
  gets.chomp
end


db = SQLite3::Database.new(DB_PATH.to_s)

while true

  puts "\n Hey you, what do you want to do today? Enter <task_id>"
  puts "1. Create a post"
  puts "2. Read your posts"
  puts "3. Update your posts"
  puts "4. Delete a specific post"
  puts "5. Delete all posts"
  puts "6. Exit"

	choice =  gets.chomp.to_i

	case choice
  when 1
    name = ask_and_get("name")
    source_url = ask_and_get("source url")
    rating = ask_and_get("rating")
    post = { name: name, source_url: source_url, date: Time.now, rating: rating }
    create_post(db, post)
  when 2
    get_posts(db).each do |post|
      date = DateTime.parse(post[3]).strftime"%m/%d/%Y"
      puts "The name is #{post[1]} in #{date}, the source is #{post[2]} rate #{post[4.to_i]}"
    end

  when 3
    get_posts(db).each do |post|
    puts "id-#{post[0]}: #{post[1]}"
    end
    id = ask_and_get("id")
    name = ask_and_get("name")
    update_post(db, id, name)

  when 4
    get_posts(db).each do |post|
    puts "id-#{post[0]}: #{post[1]}"
    end
    id = ask_and_get("id")
    delete_post(db, id)

  when 5
    delete_posts(db)

  #TODO: add other CRUD tasks to your interface if you wish!
  when 6
    break
	end

end

