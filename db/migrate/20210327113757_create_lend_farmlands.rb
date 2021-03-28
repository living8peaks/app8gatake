class CreateLendFarmlands < ActiveRecord::Migration[6.0]
  def change
    create_table :lend_farmlands do |t|
      t.references :user, foreign_key: true, null: false
      t.text       :lend_philosophy
      t.string     :lend_place
      t.integer    :lend_area
      t.integer    :lend_field_type
      t.integer    :immediate_lending
      t.integer    :status
      t.integer    :watering
      t.integer    :sunlight
      t.integer    :agricultural_machines
      t.integer    :crops
      t.integer    :field_situation
      t.integer    :lending_period
      t.integer    :lending_terms
      t.text       :lend_other_terms

      t.timestamps
    end
  end
end
