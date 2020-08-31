class CreatePhotoTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :photo_tweets do |t|
      t.attachment :image, null: false

      t.timestamps
    end
  end
end
