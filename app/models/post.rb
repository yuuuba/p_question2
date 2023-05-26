class Post < ApplicationRecord
  belongs_to :user
  has_many :questions

  # TODO:リレーションで参照できない　@post.questions
  # 設計上postテーブルのquesution_idがnilなデータもあるから..?
  #TODO: Qurstion.idとpostのquestion_idが同じQuestionのインスタンスを取得したい
  def find_question
    #question.idとPostのquestion_idが同じもの
    # Question.where(id: Post.question_id)#ここがおかしい？
    Question.where(id: question_id)#ここがおかしい？
  end
end
