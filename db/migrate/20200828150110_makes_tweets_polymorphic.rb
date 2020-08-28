class MakesTweetsPolymorphic < ActiveRecord::Migration[6.0]
  class Tweet < ApplicationRecord
    belongs_to :content, polymorphic: true
  end
  class TextTweet < ApplicationRecord; end
  def change
    change_table(:tweets) do |t|
      t.string :content_type
      t.integer :content_id
      t.index [:content_type, :content_id]
    end

    reversible do |dir|
      Tweet.reset_column_information
      Tweet.find_each do |tweet|
        dir.up do
          text_tweet = TextTweet.create(body: tweet.body)
          tweet.update(content_id: text_tweet.id, content_type: "TextTweet")
        end
        dir.down do
          tweet.update(body: tweet_content.body)
          tweet.content.destroy
        end
      end
    end
    remove_column :tweets, :body, :string
  end
end
