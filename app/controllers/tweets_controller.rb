class TweetsController < ApplicationController

  def create
    tweet = current_user.tweets.create(tweet_params)
    redirect_to root_path, redirect_options_for(tweet)
  end

private

  def tweet_params
    params.require(:tweet).permit(:body)
  end

  def redirect_options_for
    if tweet.persisted?
      { notice: "Tweeted successfully 🤓"}
    else
      { alert: "Could not shout 😭" }
  end
end
