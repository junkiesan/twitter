class TweetsController < ApplicationController

  def show
    @tweet = Tweet.find(params[:id])
  end

  def create
    tweet = current_user.tweets.create(tweet_params)
    redirect_to root_path, redirect_options_for(tweet)
  end

private

  def tweet_params
    { content: content_from_params }
  end

  def content_from_params
    params[:content_type].new(content_params)

    case params[:tweet][:content_type]
    when "TextTweet" then TextTweet.new(text_tweet_content_params)
    when "PhotoTweet" then PhotoTweet.new(photo_tweet_content_params)
    end
  end

  def content_params
    params.require(:tweet).rquire(:content).permit!
  end

  def redirect_options_for
    if tweet.persisted?
      { notice: "Tweeted successfully 🤓"}
    else
      { alert: "Could not tweet 😭" }
  end
end
end
