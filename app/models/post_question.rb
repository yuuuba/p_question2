class PostQuestion < ApplicationRecord
  belongs_to :post
  belongs_to :question
end
