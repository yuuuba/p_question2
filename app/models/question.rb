class Question < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :question_answers
  has_many :answers, through: :question_answers
end
