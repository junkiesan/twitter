class LikesController < ApplicationController
  before_action :require_login

  def create
    current_user.like(tweet)
    redirect_to root_path
  end

  def destroy
    current_user.unlike(tweet)
    redirect_to root_path
  end

private

  def tweet
    @_tweet ||= Tweet.find(params[:id])
  end
end
