class AddColumnUserId < ActiveRecord::Migration
 def up
  add_column :posts, :user_id, :integer
 end

end