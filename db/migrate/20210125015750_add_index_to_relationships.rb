class AddIndexToRelationships < ActiveRecord::Migration[6.0]
  def change
    add_index :relationships, %i[follower_id following_id], unique: true
  end
end
