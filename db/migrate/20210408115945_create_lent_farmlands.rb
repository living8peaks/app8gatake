class CreateLentFarmlands < ActiveRecord::Migration[6.0]
  def change
    create_table :lent_farmlands do |t|

      t.timestamps
    end
  end
end
