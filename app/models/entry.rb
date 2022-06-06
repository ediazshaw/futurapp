class Entry < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :theme, presence: true
  validates :remember_date, presence: true
  validates :comment, length: { maximum: 10000, too_long: `%{count} characters is the maximum allowed` }
  has_many_attached :photos
  has_many :reviews, dependent: :destroy
  include PgSearch::Model
  pg_search_scope :search,
    against: [ :theme, :created_at, :remember_date ],
    using: {
      tsearch: { prefix: true }
    }
end
