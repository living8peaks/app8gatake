class CreateLendFarmlands < ActiveRecord::Migration[6.0]
  def change
    create_table :lend_farmlands do |t|

      t.timestamps
    end
  end
end
