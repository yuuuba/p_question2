class Renamecolumnquestion < ActiveRecord::Migration[7.0]
  def change
    rename_column :questions, :bosy, :body
  end
end
