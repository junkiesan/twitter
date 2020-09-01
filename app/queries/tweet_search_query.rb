class TweetSearchQuery
  def initialize(term:)
    @term = term
  end

  def to_relation
    matching_tweets_for_text_tweets.
      or(matching_tweets_for_photo_tweets)
  end

  private

  attr_reader :term

  def matching_tweets_for_text_tweets
    Tweet.where(content_type: "TextTweet", content_id: matching_text_tweets.select(:id))
  end

  def matching_text_tweets
    TextTweet.where("body LIKE ?", "%#{term}%")
  end

  def matching_tweets_for_text_tweets
    Tweet.where(content_type: "PhotoTweet", content_id: matching_photo_tweets.select(:id))
  end

  def matching_photo_tweets
    PhotoTweet.where("image_file_name LIKE ?", "%#{term}%")
  end
end
