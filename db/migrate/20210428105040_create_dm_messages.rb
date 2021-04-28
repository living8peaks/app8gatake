class CreateDmMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :dm_messages do |t|
      t.references :dm_talk, foreign_key: true
      t.references :user,    foreign_key: true
      t.string     :content

      t.timestamps
    end
  end
end
