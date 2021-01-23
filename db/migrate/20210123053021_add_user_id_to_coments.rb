class AddUserIdToComents < ActiveRecord::Migration[6.0]
  def up
    execute 'DELETE FROM comments;'
    add_reference :comments, :user, index: true, foreign_key: true
  end

  def down
    remove_reference :user, index: true, foreign_key: true
  end
end
