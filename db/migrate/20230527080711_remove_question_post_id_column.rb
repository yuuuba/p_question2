class RemoveQuestionPostIdColumn < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :questions, :posts
    remove_index :questions, :post_id
    remove_column :questions, :post_id, :bigint
  end
end
