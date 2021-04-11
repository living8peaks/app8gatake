class AddReferencesToLikes < ActiveRecord::Migration[6.0]
  def change
    add_reference :likes, :lend_farmland, foreign_key: true, null: false
  end
end
