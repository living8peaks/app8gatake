class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :lend_farmland, foreign_key: true, null: false
      t.references :user,          foreign_key: true, null: false

      t.timestamps
    end
  end
end
