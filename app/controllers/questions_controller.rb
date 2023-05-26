class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show destroy ]
  before_action :authenticate_user!, only: [:new, :destroy]

  def index
    @post = Post.find(params[:post_id])
    #TODO: postに紐付いたquestionを取得したい == postsのquestion_idとquestion.idが同じものを取得したい
    # find_question
    # Question.where(id: question_id)#ここがおかしい？
    
  end

  def new
    @post = Post.find(params[:post_id])
    @question = Question.new
    @user_id = current_user.id
  end

  def create
    @post = Post.find(params[:post_id])

    @question = Question.new(
      body:params[:question][:body],
      user_id:current_user.id,
      post_id:params[:post_id]
    )
    
    if @question.save!
      #FIX：posts#showのpathがわからない
      redirect_to root_path
    else
      render :new
    end
    
    @post.update(question_id: @question.id)
  end

  def destroy
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body,:post_id,:user_id)
  end
end
