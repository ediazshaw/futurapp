class Category < ApplicationRecord
  has_many :entries
  has_many :question_days
end
