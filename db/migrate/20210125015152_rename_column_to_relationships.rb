class RenameColumnToRelationships < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :relationships, :users
    remove_reference :relationships, :user
    remove_reference :relationships, :follow
    add_reference :relationships, :follower, foreign_key: { to_table: :users }
    add_reference :relationships, :following, foreign_key: { to_table: :users }
  end
end
