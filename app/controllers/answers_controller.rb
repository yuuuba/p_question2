class AnswersController < ApplicationController
  before_action :set_answer, only: %i[ destroy ]
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @post = Post.find(params[:post_id])
    @question = Question.find(params[:question_id])
    @answer = Answer.new
    @user_id = current_user.id
  end

  def create
    @post = Post.find(params[:post_id])
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)

    if @answer.save!
      redirect_to post_questions_path(params[:post_id])
    else
      render :new, notice: "投稿に失敗しました"
    end
  end

  def destroy
    @answer.destroy
    redirect_to answers_url, notice: "投稿が削除されました"
  end

  private

    def set_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:body,:user_id)
    end
end
