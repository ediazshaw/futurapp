class QuestionDay < ApplicationRecord
  belongs_to :category
  validates :theme, presence: true
  validates :question, presence: true
  validates :date, presence: true
  has_one_attached :photo
end
