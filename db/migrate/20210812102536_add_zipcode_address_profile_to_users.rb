class AddZipcodeAddressProfileToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :zipcode, :string
    add_column :users, :address, :text
    add_column :users, :profile, :text
  end
end
