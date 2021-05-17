class RemoveCuriousFromFavorites < ActiveRecord::Migration[6.0]
  def change
    remove_column :favorites, :curious, :boolean
  end
end
