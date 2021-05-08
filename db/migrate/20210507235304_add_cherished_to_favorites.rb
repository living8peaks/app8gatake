class AddCherishedToFavorites < ActiveRecord::Migration[6.0]
  def change
    add_reference :favorites, :cherished, null: false, foreign_key: { to_table: :users }
  end
end
