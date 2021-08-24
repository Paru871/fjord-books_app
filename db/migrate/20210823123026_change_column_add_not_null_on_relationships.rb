class ChangeColumnAddNotNullOnRelationships < ActiveRecord::Migration[6.1]
  def change
    change_column_null :relationships, :followed_id, false
    change_column_null :relationships, :follower_id, false
  end
end
