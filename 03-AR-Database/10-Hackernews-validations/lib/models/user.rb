class User < ActiveRecord::Base
  has_many :posts
  validates :name, presence: true
  validates :email, format: { with /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
message: "Please enter a email"}
end
