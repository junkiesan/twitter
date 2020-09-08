class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :content, polymorphic: true

  validates :user, presence: true

  delegate :username, to: :user

  searchable do
    text :content do
      case content
      when TextTweet then content.body
      when PhotoTweet then content.image_file_name
      end
    end
  end
end
