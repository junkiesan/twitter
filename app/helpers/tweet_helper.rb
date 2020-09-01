module TweetHelper

  def tweet_form_for(content_type)
    form_for(Tweet.new, url: content_type.new) do |form|
      form.fields_for(:content) { |content_form| yield(content_form) } +
      form.submit("Tweet!")
    end
  end

  def like_button(tweet)
    if current_user.liked?(tweet)
      link_to "Unlike", unlike_tweet_path(tweet), method: :delete
    else
      link_to "Like", like_tweet_path(tweet), method: :post
    end
  end

  def autolink(text)
    text.
      gsub(/@\w+/) { |mention| link_to mention, user_path(mention[1..-1]) }.
      gsub(/@\w+/) { |hashtag| link_to hashtag, hashtag_path(hashtag[1..-1]) }.
      html_safe
  end
end
