class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show destroy ]
  before_action :authenticate_user!, only: [:new, :destroy]

  def index
    @post = Post.find(params[:post_id])
    @post_user_id = @post.user_id
    @questions = @post.questions
    
  end

  def new
    @post = Post.find(params[:post_id])
    @question = Question.new
    @user_id = current_user.id
    
  end

  def create
    @post = Post.find(params[:post_id])

    # * [ruby - How to assign a has\_many/belongs\_to relation properly in Rails ActiveRecord? - Stack Overflow]
    # ( https://stackoverflow.com/questions/13649540/how-to-assign-a-has-many-belongs-to-relation-properly-in-rails-activerecord )

    @question = Question.new(
      body:params[:question][:body],
      user_id:current_user.id,
    )

    @post.questions << @question
    
    if @question.save!
      redirect_to root_path
    else
      render :new
    end

    # if @post.save!
    #   redirect_to root_path
    # else
    #   render :new
    # end
    
    # @post.question = Question.new(question_params)
    # @post.save!
  end

  def destroy
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body, :user_id)
  end
end
