# frozen_string_literal: true

class AddIndexToReportsUserId < ActiveRecord::Migration[6.1]
  def change
    add_index :reports, %i[user_id created_at]
  end
end
