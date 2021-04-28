class CreateDmMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :dm_messages do |t|

      t.timestamps
    end
  end
end
