class Entry < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :theme, presence: true
  validates :remember_date, presence: true
  validates :comment, length: { maximum: 10000, too_long: `%{count} characters is the maximum allowed` }
end
