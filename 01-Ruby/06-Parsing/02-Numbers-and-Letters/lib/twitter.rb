require 'twitter'

client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = "ugugJziA534zoiUTDWZs09lki"
  config.consumer_secret     = "NRJgYcJz9GLEc1jBYjYgXbh4jWlKX6HmIMbIha9WTq4vWZ9EVx"
  config.access_token        = "760463514-ssHBqV1m2Qx3Wdqjivm2c7HOWoQUWJoB7Edxm4eh"
  config.access_token_secret = "EeQeBFK2A9UUfozyp13exTePT7oYiISFa833VuGiuBPS2"
end

topics = ["conne"]
client.filter(:track => topics.join(",")) do |object|
  puts object.text if object.is_a?(Twitter::Tweet)
end