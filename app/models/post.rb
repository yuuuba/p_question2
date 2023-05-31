class Post < ApplicationRecord
  belongs_to :user
  # has_many :questions
  # has_many :post_questions

  # * activerecord - Rails: Cannot have a has\_many :through association before association is defined - Stack Overflow
  # https://stackoverflow.com/questions/53074430/rails-cannot-have-a-has-many-through-association-before-association-is-defined
  # has_many :questions
  has_many :post_questions
  has_many :questions, through: :post_questions
end
