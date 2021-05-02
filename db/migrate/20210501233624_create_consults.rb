class CreateConsults < ActiveRecord::Migration[6.0]
  def change
    create_table :consults do |t|
      t.references :user, foreign_key: true
      t.references :lend_farmland, foreign_key: true

      t.timestamps
    end
  end
end
