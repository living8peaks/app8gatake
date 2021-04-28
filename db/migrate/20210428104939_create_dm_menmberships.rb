class CreateDmMenmberships < ActiveRecord::Migration[6.0]
  def change
    create_table :dm_menmberships do |t|
      t.references :dm_talk, foreign_key: true
      t.references :user,    foreign_key: true

      t.timestamps
    end
    add_index :dm_menmberships, %i[user_id dm_talk_id], unique: true
  end
end
