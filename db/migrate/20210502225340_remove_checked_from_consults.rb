class RemoveCheckedFromConsults < ActiveRecord::Migration[6.0]
  def change
    remove_column :consults, :checked, :boolean
  end
end
