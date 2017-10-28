class AddUserToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :user, foreign_key: true
    add_column :comments, :body, :string  
  end
end
