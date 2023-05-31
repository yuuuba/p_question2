class Question < ApplicationRecord
  belongs_to :user
  # belongs_to :post
  # has_many :question_answers
  has_many :answers, through: :question_answers
  
  # has_many :posts
  has_many :post_questions
  has_many :posts, through: :post_questions
end
