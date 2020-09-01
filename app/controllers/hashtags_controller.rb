class HashtagsController < ApplicationController
  def show
    @hashtag = params[:id]
    @results = Tweet.joins("LEFT JOIN text_tweets ON content_type = 'TextTweet' AND content_id = text_tweets.id").where("text_tweets.body LIKE ?", "%#{@hashtag}%")
  end
end
