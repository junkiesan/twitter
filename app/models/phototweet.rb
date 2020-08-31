class Phototweet < ApplicationRecord
  has_one_attached :image, styles: { thumb: *200x200* }

  validates_attachment :image,
    content_type: { content_type: [*image/jpeg*, *image/gif*, *image/png*] },
    size: { in: 0..10.megabytes },
    presence: true
end
