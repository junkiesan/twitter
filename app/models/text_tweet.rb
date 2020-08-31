class TextTweet < ApplicationRecord
  validates :body, presence: true, length: { in: 1..144 }
end
