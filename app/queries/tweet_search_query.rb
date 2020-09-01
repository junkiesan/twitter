class TweetSearchQuery
  def initialize(term:)
    @term = term
  end

  def to_relation
    Tweet.
      joins("LEFT JOIN text_tweets ON content_type = 'TextTweet' AND content_id = text_tweets.id").
      where("text_tweets.body LIKE ?", "%#{term}%")
  end

  private

  attr_reader :term
end
