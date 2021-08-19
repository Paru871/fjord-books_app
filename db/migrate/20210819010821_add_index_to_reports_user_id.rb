class AddIndexToReportsUserId < ActiveRecord::Migration[6.1]
  def change
    add_index :reports, [:user_id, :created_at]
  end
end
