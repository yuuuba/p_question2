class CreatePostQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :post_questions do |t|
      t.references :post, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
