module TweetHelper
  def avatar(user)
    email_digest = Digest::MD5.hexidigest(user.email)
    gravatar_url = "//www.gravatar.com/avatar/#{email_digest}"

    image_tag gravatar_url
  end

  def like_button(tweet)
    if current_user.liked?(tweet)
      link_to "Unlike", unlike_tweet_path(tweet), method: :delete
    else
      link_to "Like", like_tweet_path(tweet), method: :post
    end
  end
end
