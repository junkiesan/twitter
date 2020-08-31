class AddNullFalseToTweets < ActiveRecord::Migration[6.0]
  def change
    change_column_null :tweets, :user_id, false
    change_column_null :tweets, :content_type, false
    change_column_null :tweets, :content_id, false
  end
end
