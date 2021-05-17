class RemoveCherishedIdFromFavorites < ActiveRecord::Migration[6.0]
  def change
    remove_reference :favorites, :cherished, null: false
  end
end
