class RemovePostColumn < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :posts, :questions
    remove_index :posts, :question_id
    remove_column :posts, :question_id, :bigint
  end
end
