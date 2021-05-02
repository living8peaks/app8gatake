class AddCheckedToConsults < ActiveRecord::Migration[6.0]
  def change
    add_column :consults, :checked, :boolean, default: false, null: false
  end
end
