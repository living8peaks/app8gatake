class CreateRentFarmlands < ActiveRecord::Migration[6.0]
  def change
    create_table :rent_farmlands do |t|
      t.references :user, foreign_key: true, null: false
      t.text       :rent_philosophy
      t.integer    :rent_municipality
      t.integer    :rent_chino
      t.integer    :rent_hara
      t.integer    :rent_fujimi
      t.integer    :rent_area
      t.integer    :rent_field_type
      t.integer    :rent_desired_year
      t.integer    :borrow_immediately
      t.integer    :renting_term
      t.text       :rent_other_term

      t.timestamps
    end
  end
end
