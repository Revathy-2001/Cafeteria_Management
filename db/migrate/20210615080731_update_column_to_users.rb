class UpdateColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :password, :password_digest
    remove_column :users, :gender
  end
end
