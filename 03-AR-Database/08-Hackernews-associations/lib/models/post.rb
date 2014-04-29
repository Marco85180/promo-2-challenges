class Post < ActiveRecord::Base
  #TODO: add association to the user model
  belongs_to :user

  def to_s
      "#{name} on #{date.strftime('%d/%M/%Y')}, rated #{rating}}"
  end

end