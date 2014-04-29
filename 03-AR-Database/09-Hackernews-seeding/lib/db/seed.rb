require_relative "../config/application"
require_relative "../models/post"
require_relative "../models/user"

# Seed you database with post data from hacker news
# And fake users using Faker gem

puts "Seeding database..."

#TODO: Your code goes here
# 1. create fake users
users =[]
10.times do
  user = User.create(name: Faker::Name.name, email: Faker::Internet.email)
  users << user
end

# 2. Scrape news from https://news.ycombinator.com/ and associate posts to your existing users

response = open("https://news.ycombinator.com/")
doc = Nokogiri::HTML(response)
doc.search('td.title>a').each do |e|
  x = e.parent.parent.next_sibling
  if not x.nil?
    y = x.search("td.subtext>span").first
    score = y.nil? ? 0 : y.inner_text.to_i
    Post.create({
      name: e.inner_text,
      date: Time.now,
      source_url: e['href'],
      user: users.sample,
      rating: score
    })
  end
end