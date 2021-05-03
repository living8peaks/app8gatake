class AddDefaultCheckedToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :checked, :integer, default: 0
  end
end
