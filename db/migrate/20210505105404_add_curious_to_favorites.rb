class AddCuriousToFavorites < ActiveRecord::Migration[6.0]
  def change
    add_column :favorites, :curious, :boolean, default: false, null: false
  end
end
