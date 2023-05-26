class Question < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :question_answers
  has_many :answers, through: :question_answers
  #TODO:post空でもいいよはおかしい・・？ 

  def posts_search
    #Post.where(Question.:post_id == :id)
  end
end
