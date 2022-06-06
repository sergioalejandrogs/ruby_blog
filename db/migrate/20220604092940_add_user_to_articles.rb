class AddUserToArticles < ActiveRecord::Migration[7.0]
  def change
    unless column_exists?(:articles, :user_id)  
      add_reference :articles, :user, null: true, foreign_key: true
    end
  end
end
