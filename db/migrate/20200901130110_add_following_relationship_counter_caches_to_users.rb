class AddFollowingRelationshipCounterCachesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :followed_users_count, :integer, default: 0, null: false
    add_column :users, :follower_count, :integer, default: 0, null: false
  end
end