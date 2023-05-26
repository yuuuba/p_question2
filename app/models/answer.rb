class Answer < ApplicationRecord
  belongs_to :user
  has_many :question_answers
  has_many :questions, through: :question_answers
end
