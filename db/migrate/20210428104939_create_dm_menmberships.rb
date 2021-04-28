class CreateDmMenmberships < ActiveRecord::Migration[6.0]
  def change
    create_table :dm_menmberships do |t|

      t.timestamps
    end
  end
end
