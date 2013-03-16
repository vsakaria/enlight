class AddUserIdToLight < ActiveRecord::Migration
  def change
    add_column :lights, :user_id, :integer
  end
end
