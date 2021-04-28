class CreateDmTalks < ActiveRecord::Migration[6.0]
  def change
    create_table :dm_talks do |t|

      t.timestamps
    end
    add_index :dm_talks, :updated_at
  end
end
