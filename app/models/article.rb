class Article < ApplicationRecord
  belongs_to :user
  enum category: { selfPR: 0, reason: 1, movie: 2 }, _prefix: true
  enum article_companyScale: { large: 0,  smallmedium: 1, venture: 2, nothing: 3 }, _prefix: true

  has_many :comments, dependent: :destroy
end
