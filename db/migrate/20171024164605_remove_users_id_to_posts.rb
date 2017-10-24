class RemoveUsersIdToPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :users_id, :integer
  end
end
