class Category < ApplicationRecord
  has_many :entries, dependent: :destroy
  has_many :question_days, dependent: :destroy
end
